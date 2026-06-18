export function createSearchHelpers({
  searchEquivalents,
  specialJobFilters,
  getJobSearchCache,
  getSourceRecord,
  getSourceSegments,
  normalize,
  tokenizeNormalized,
  boundedDistance,
}) {
  function getJobSearchableText(job) {
    return normalize(
      [
        job.title,
        job.company,
        job.city,
        job.category,
        job.type,
        job.salary,
        job.deadline,
        job.openingDate,
        job.closingDate,
        job.sourceName,
        job.excerpt,
        ...(job.tags || []),
      ].join(" ")
    );
  }

  function buildJobSearchCache(list = []) {
    return new Map(
      list.map((job) => [
        job.id,
        {
          searchable: getJobSearchableText(job),
          titleTokens: tokenizeNormalized(`${job.title} ${job.company}`),
          companyTokens: tokenizeNormalized(job.company),
          cityTokens: tokenizeNormalized(job.city),
          categoryTokens: tokenizeNormalized(job.category),
          typeTokens: tokenizeNormalized(job.type),
          sourceTokens: tokenizeNormalized(job.sourceName),
          tagTokens: tokenizeNormalized((job.tags || []).join(" ")),
          excerptTokens: tokenizeNormalized(job.excerpt),
        },
      ])
    );
  }

  function matchesSpecialJobFilter(job, filterValue = "") {
    const config = specialJobFilters[normalize(filterValue)];
    if (!config) return false;

    const source = getSourceRecord(job.sourceName);
    const sourceSegments = new Set(getSourceSegments(source));
    if ((config.segments || []).some((segment) => sourceSegments.has(normalize(segment)))) return true;

    const searchable = getJobSearchableText(job);
    return (config.keywords || []).some((keyword) => searchable.includes(normalize(keyword)));
  }

  function matchesSpotlightJob(job, spotlight) {
    const source = getSourceRecord(job.sourceName);
    const sourceSegments = new Set(getSourceSegments(source));
    return (spotlight.segments || []).some((segment) => sourceSegments.has(normalize(segment)));
  }

  function buildSearchGroups(query = "") {
    const tokens = tokenizeNormalized(query);

    return tokens.map((token) => {
      const variants = new Set([token]);
      const related = searchEquivalents[token] || [];
      related.forEach((value) => variants.add(normalize(value)));
      for (const [keyword, equivalents] of Object.entries(searchEquivalents)) {
        if (keyword.includes(token) || token.includes(keyword)) {
          variants.add(normalize(keyword));
          equivalents.forEach((value) => variants.add(normalize(value)));
        }
      }
      return [...variants];
    });
  }

  function tokenMatchStrength(token, candidates = []) {
    if (!token) return 0;
    let best = 0;
    for (const candidate of candidates) {
      if (!candidate) continue;
      if (candidate === token) return 1;
      if (candidate.includes(token) || token.includes(candidate)) best = Math.max(best, 0.88);
      if ((candidate.startsWith(token) || token.startsWith(candidate)) && Math.min(candidate.length, token.length) >= 4) {
        best = Math.max(best, 0.78);
      }
      if (Math.min(candidate.length, token.length) >= 5 && boundedDistance(candidate, token, 1) <= 1) {
        best = Math.max(best, 0.68);
      }
    }
    return best;
  }

  function scoreTextAgainstGroups(text, groups, weight, fieldTokens = tokenizeNormalized(text)) {
    if (!text && !fieldTokens.length) return 0;
    let score = 0;
    for (const group of groups) {
      let groupScore = 0;
      for (const token of group) {
        const normalizedToken = normalize(token);
        if (!normalizedToken) continue;
        if (text.includes(normalizedToken)) {
          groupScore = Math.max(groupScore, 1);
          continue;
        }
        groupScore = Math.max(groupScore, tokenMatchStrength(normalizedToken, fieldTokens));
      }
      score += Math.round(weight * groupScore);
    }
    return score;
  }

  function getJobSearchScore(job, query = "") {
    const normalizedQuery = normalize(query);
    if (!normalizedQuery) return 0;

    const groups = buildSearchGroups(normalizedQuery);
    if (!groups.length) return 0;

    const cache = getJobSearchCache()?.get(job.id);

    const fields = {
      title: normalize(job.title),
      company: normalize(job.company),
      city: normalize(job.city),
      category: normalize(job.category),
      type: normalize(job.type),
      source: normalize(job.sourceName),
      tags: normalize((job.tags || []).join(" ")),
      excerpt: normalize(job.excerpt),
    };
    const fieldTokens = {
      title: cache?.titleTokens || tokenizeNormalized(`${job.title} ${job.company}`),
      company: cache?.companyTokens || tokenizeNormalized(job.company),
      city: cache?.cityTokens || tokenizeNormalized(job.city),
      category: cache?.categoryTokens || tokenizeNormalized(job.category),
      type: cache?.typeTokens || tokenizeNormalized(job.type),
      source: cache?.sourceTokens || tokenizeNormalized(job.sourceName),
      tags: cache?.tagTokens || tokenizeNormalized((job.tags || []).join(" ")),
      excerpt: cache?.excerptTokens || tokenizeNormalized(job.excerpt),
    };

    const searchable = cache?.searchable || Object.values(fields).join(" ");
    const matchedGroups = groups.filter((group) =>
      group.some((token) => {
        const normalizedToken = normalize(token);
        return (
          searchable.includes(normalizedToken) ||
          tokenMatchStrength(normalizedToken, [
            ...fieldTokens.title,
            ...fieldTokens.company,
            ...fieldTokens.city,
            ...fieldTokens.category,
            ...fieldTokens.type,
            ...fieldTokens.source,
            ...fieldTokens.tags,
            ...fieldTokens.excerpt,
          ]) >= 0.68
        );
      })
    );
    if (!matchedGroups.length) return 0;
    if (groups.length > 1 && matchedGroups.length < groups.length) return 0;

    let score = 0;
    if (searchable.includes(normalizedQuery)) score += 18;
    score += scoreTextAgainstGroups(fields.title, groups, 9, fieldTokens.title);
    score += scoreTextAgainstGroups(fields.category, groups, 7, fieldTokens.category);
    score += scoreTextAgainstGroups(fields.tags, groups, 6, fieldTokens.tags);
    score += scoreTextAgainstGroups(fields.company, groups, 5, fieldTokens.company);
    score += scoreTextAgainstGroups(fields.type, groups, 4, fieldTokens.type);
    score += scoreTextAgainstGroups(fields.city, groups, 4, fieldTokens.city);
    score += scoreTextAgainstGroups(fields.source, groups, 3, fieldTokens.source);
    score += scoreTextAgainstGroups(fields.excerpt, groups, 1, fieldTokens.excerpt);
    return score;
  }

  return {
    buildJobSearchCache,
    buildSearchGroups,
    getJobSearchScore,
    getJobSearchableText,
    matchesSpecialJobFilter,
    matchesSpotlightJob,
    scoreTextAgainstGroups,
    tokenMatchStrength,
  };
}
