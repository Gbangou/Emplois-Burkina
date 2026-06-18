export function createFeedHelpers({
  getSources,
  getSourceIndex,
  getSourceRecord,
  getPublicJobs,
  getInternationalFeeds,
  sourceHasSegment,
  normalize,
  daysUntil,
  formatJobDate,
  internationalTechPatterns,
  internationalEligibilityBlockers,
  internationalTechTitlePatterns,
  internationalTechExclusionPatterns,
}) {
  function getInternationalFeed(sourceId = "") {
    return getInternationalFeeds().find((feed) => normalize(feed.sourceId) === normalize(sourceId)) || null;
  }

  function getFeedJobAgeDays(job = {}) {
    const reference = job.openingDate || String(job.updatedAt || job.collectedAt || "").slice(0, 10);
    if (!reference) return null;
    const date = new Date(`${String(reference).slice(0, 10)}T00:00:00`);
    if (Number.isNaN(date.getTime())) return null;
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    return Math.floor((today - date) / 86_400_000);
  }

  function isExpiredFeedJob(job = {}) {
    if (job?.expired) return true;
    if (!job?.closingDate) return false;
    return daysUntil(job.closingDate) < 0;
  }

  function isStaleFeedJob(job = {}) {
    if (job?.closingDate) return false;
    const ageDays = getFeedJobAgeDays(job);
    return typeof ageDays === "number" && ageDays > 21;
  }

  function isVisibleFeedJob(job = {}) {
    return !isExpiredFeedJob(job) && !isStaleFeedJob(job);
  }

  function sortFeedJobs(list = []) {
    return list
      .slice()
      .sort((a, b) => {
        const hasClosingA = Boolean(a?.closingDate);
        const hasClosingB = Boolean(b?.closingDate);
        if (hasClosingA !== hasClosingB) return Number(hasClosingB) - Number(hasClosingA);

        if (hasClosingA && hasClosingB) {
          const remainingA = daysUntil(a.closingDate);
          const remainingB = daysUntil(b.closingDate);
          if (remainingA !== remainingB) return remainingA - remainingB;
        }

        const openingA = String(a?.openingDate || "");
        const openingB = String(b?.openingDate || "");
        if (openingA !== openingB) return openingB.localeCompare(openingA);

        return String(a?.title || "").localeCompare(String(b?.title || ""), "fr");
      });
  }

  function countFeedJobsWithDates(list = []) {
    return list.filter((job) => job?.openingDate || job?.closingDate).length;
  }

  function getFeedMonitoringState(feed = {}) {
    const jobs = Array.isArray(feed?.jobs) ? feed.jobs : [];
    const visibleJobs = jobs.filter(isVisibleFeedJob);
    return {
      visibleCount: visibleJobs.length,
      datedCount: countFeedJobsWithDates(visibleJobs),
      hasError: Boolean(feed?.error),
      isStale: Boolean(feed?.stale),
      hasLiveSync: Boolean(visibleJobs.length) && !feed?.error && !feed?.stale,
    };
  }

  function getRenderableFeedJobs(feed = {}, limit = 10) {
    const jobs = Array.isArray(feed?.jobs) ? feed.jobs : [];
    const visible = sortFeedJobs(jobs.filter(isVisibleFeedJob)).slice(0, limit);
    const archived = sortFeedJobs(jobs.filter((job) => !isVisibleFeedJob(job)));
    return { visible, archived };
  }

  function getFeedPortalState(feed = {}) {
    const status = normalize(feed?.portalStatus || "");
    if (["maintenance", "unavailable", "unreachable"].includes(status)) {
      return {
        unavailable: true,
        status,
        message:
          feed?.statusMessage ||
          "Le portail externe est temporairement indisponible. JobFaso garde la reference visible mais suspend l'ouverture directe.",
      };
    }

    return {
      unavailable: false,
      status: status || "available",
      message: "",
    };
  }

  function daysSince(value) {
    if (!value) return null;
    const target = new Date(`${String(value).slice(0, 10)}T00:00:00`);
    if (Number.isNaN(target.getTime())) return null;
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    return Math.floor((today - target) / 86_400_000);
  }

  function isPublicSearchableFeedJob(job = {}) {
    return isVisibleFeedJob(job) && Boolean(job?.title) && Boolean(job?.url);
  }

  function inferPublicCategoryFromFeedJob(job = {}, source = {}) {
    const text = normalize([job.title, job.location, job.contract, job.excerpt].filter(Boolean).join(" "));
    if (internationalTechPatterns.some((pattern) => pattern.test(text))) return "Informatique, data et systemes";
    if (/consultant|consultance|consultation|roster|call for|proposal/.test(text)) return "Consultation";
    if (/terrain|driver|chauffeur|artisan|ma[çc]on|mason|soudeur|ouvrier|plombier|electricien|gardien|vigile/.test(text)) {
      return "Metiers terrain et informels";
    }
    if (sourceHasSegment(source, "international_onu")) return "ONG";
    return "Bureau";
  }

  function inferPublicTypeFromFeedJob(job = {}) {
    const text = normalize([job.title, job.contract, job.excerpt].filter(Boolean).join(" "));
    if (/consultant|consultance|consultation/.test(text)) return "Consultation";
    if (/intern|internship|stage|stagiaire/.test(text)) return "Stage";
    if (/volunteer|volontaire/.test(text)) return "Volontariat";
    if (/remote|teletravail/.test(text)) return "Teletravail";
    return job.contract || "A verifier";
  }

  function buildFeedJobTags(job = {}, source = {}, category = "", city = "") {
    return [
      category,
      city,
      source.name || "",
      ...(sourceHasSegment(source, "international_onu") ? ["International", "ONU / ONG"] : []),
      ...(sourceHasSegment(source, "consulting_remote") ? ["Consultance", "Teletravail"] : []),
    ]
      .filter(Boolean)
      .slice(0, 8);
  }

  function normalizeFeedJobAsPublicJob(job = {}, feed = {}) {
    const sourceIndex = getSourceIndex();
    const sources = getSources();
    const source =
      sourceIndex.get(normalize(feed.name)) ||
      sources.find((entry) => normalize(entry.id) === normalize(feed.sourceId)) || {
        id: feed.sourceId,
        name: feed.name,
        collection: feed.collection,
        type: feed.type,
        url: feed.url,
      };
    const category = inferPublicCategoryFromFeedJob(job, source);
    const city = job.location || (sourceHasSegment(source, "consulting_remote") ? "Teletravail" : "International");

    return {
      id: `intl-${job.id || normalize(`${feed.sourceId}-${job.title}-${job.url}`)}`,
      title: job.title,
      company: source.name || feed.name || "Source internationale",
      city,
      category,
      type: inferPublicTypeFromFeedJob(job),
      salary: "Non communique",
      deadline: job.closingDate ? formatJobDate(job.closingDate, "A verifier") : "A verifier",
      openingDate: job.openingDate || "",
      closingDate: job.closingDate || "",
      openingDateConfirmed: Boolean(job.openingDate),
      closingDateConfirmed: Boolean(job.closingDate),
      inconsistentDates: false,
      sourceName: source.name || feed.name || "",
      sourceUrl: job.url || source.url || feed.url || "#",
      canonicalUrl: job.url || source.url || feed.url || "#",
      sourceLogoUrl: source.logoUrl || "",
      companyLogoUrl: source.logoUrl || "",
      riskScore: 0,
      confidenceScore: 72 + (job.closingDate ? 10 : 0) + (job.openingDate ? 8 : 0),
      tags: buildFeedJobTags(job, source, category, city),
      status: "needs_review",
      excerpt: job.excerpt || "",
      collectedAt: feed.updatedAt || new Date().toISOString(),
      sourceLabel: job.sourceLabel || "",
      fromInternationalFeed: true,
    };
  }

  function mergePublicJobs(baseList = []) {
    const byCanonical = new Map();
    const merged = [];

    for (const job of baseList) {
      const key = normalize(job.canonicalUrl || job.sourceUrl || job.id);
      if (!key || byCanonical.has(key)) continue;
      byCanonical.set(key, job.id);
      merged.push(job);
    }

    for (const feed of getInternationalFeeds()) {
      for (const job of (feed.jobs || []).filter(isPublicSearchableFeedJob)) {
        const normalizedJob = normalizeFeedJobAsPublicJob(job, feed);
        const key = normalize(normalizedJob.canonicalUrl || normalizedJob.sourceUrl || normalizedJob.id);
        if (!key || byCanonical.has(key)) continue;
        byCanonical.set(key, normalizedJob.id);
        merged.push(normalizedJob);
      }
    }

    return merged;
  }

  function isLikelyInternationallyEligible(job = {}) {
    const text = normalize([job.title, job.location, job.contract, job.excerpt].filter(Boolean).join(" "));
    return !internationalEligibilityBlockers.some((pattern) => pattern.test(text));
  }

  function isInternationalTechJob(job = {}) {
    const title = normalize(job.title || "");
    if (!title) return false;
    if (internationalTechExclusionPatterns.some((pattern) => pattern.test(title))) return false;
    return internationalTechTitlePatterns.some((pattern) => pattern.test(title));
  }

  function isFreshSpotlightJob(job = {}, maxAgeDays = 90) {
    const closingIn = daysUntil(job.closingDate);
    if (typeof closingIn === "number" && closingIn < 0) return false;

    const openingAge = daysSince(job.openingDate);
    if (typeof openingAge === "number") return openingAge <= maxAgeDays;

    const closingAge = daysSince(job.closingDate);
    if (typeof closingAge === "number") return closingAge <= maxAgeDays;

    return true;
  }

  function matchesSpotlightFeedJob(job = {}, spotlight = {}) {
    if (spotlight.mode === "tech") {
      return isLikelyInternationallyEligible(job) && isFreshSpotlightJob(job) && isInternationalTechJob(job);
    }
    return true;
  }

  function getSpotlightFeedJobs(source, spotlight, limit = 10) {
    const feed = getInternationalFeed(source?.id);
    if (spotlight?.mode === "tech" && (feed?.stale || feed?.error)) return [];
    const { visible } = getRenderableFeedJobs(feed, Math.max(limit * 4, limit));
    return visible.filter((job) => matchesSpotlightFeedJob(job, spotlight)).slice(0, limit);
  }

  function sortSourcesForSpotlight(list = [], spotlight = {}) {
    const uniqueSources = [];
    const seen = new Set();
    list.forEach((source) => {
      const key = normalize(source?.id || source?.name);
      if (!key || seen.has(key)) return;
      seen.add(key);
      uniqueSources.push(source);
    });

    return uniqueSources
      .slice()
      .sort((a, b) => {
        const feedA = getInternationalFeed(a.id);
        const feedB = getInternationalFeed(b.id);
        const jobsA = getSpotlightFeedJobs(a, spotlight, 10);
        const jobsB = getSpotlightFeedJobs(b, spotlight, 10);
        const scoreA =
          jobsA.length * 10 +
          countFeedJobsWithDates(jobsA) * 3 +
          (a.collection === "review_required" ? 2 : a.collection === "official_link" ? 1 : 0) -
          (feedA?.error ? 4 : 0) -
          (feedA?.stale ? 2 : 0);
        const scoreB =
          jobsB.length * 10 +
          countFeedJobsWithDates(jobsB) * 3 +
          (b.collection === "review_required" ? 2 : b.collection === "official_link" ? 1 : 0) -
          (feedB?.error ? 4 : 0) -
          (feedB?.stale ? 2 : 0);
        return scoreB - scoreA || a.priority - b.priority || a.name.localeCompare(b.name, "fr");
      });
  }

  function collectSpotlightAggregateJobs(entries = [], limit = 10) {
    const queue = entries
      .map(({ source, feedJobs }) => ({
        source,
        jobs: (feedJobs || []).slice(),
        index: 0,
      }))
      .filter((entry) => entry.jobs.length);

    const selected = [];
    const seen = new Set();

    while (queue.length && selected.length < limit) {
      for (let i = 0; i < queue.length && selected.length < limit; i += 1) {
        const entry = queue[i];
        const job = entry.jobs[entry.index];
        entry.index += 1;
        if (!job) continue;
        const key = job.id || `${normalize(job.title)}::${normalize(job.url)}`;
        if (seen.has(key)) continue;
        seen.add(key);
        selected.push({
          ...job,
          sourceLabel: entry.source?.name || job.sourceName || "",
        });
      }

      for (let i = queue.length - 1; i >= 0; i -= 1) {
        if (queue[i].index >= queue[i].jobs.length) queue.splice(i, 1);
      }
    }

    return selected;
  }

  function collectPublicSpotlightJobs(spotlight = {}, limit = 10) {
    const segments = Array.isArray(spotlight.segments) && spotlight.segments.length ? spotlight.segments : [spotlight.id];
    const seen = new Set();
    return getPublicJobs()
      .filter((job) => {
        const source = getSourceRecord(job.sourceName);
        return (
          segments.some((segment) => sourceHasSegment(source, segment)) &&
          (!spotlight.mode || matchesSpotlightFeedJob(job, spotlight))
        );
      })
      .sort((a, b) => {
        const hasClosingA = Boolean(a.closingDate);
        const hasClosingB = Boolean(b.closingDate);
        if (hasClosingA !== hasClosingB) return Number(hasClosingB) - Number(hasClosingA);
        if (hasClosingA && hasClosingB) {
          const daysA = daysUntil(a.closingDate);
          const daysB = daysUntil(b.closingDate);
          if (daysA !== daysB) return daysA - daysB;
        }
        return String(b.collectedAt || "").localeCompare(String(a.collectedAt || ""));
      })
      .filter((job) => {
        const key = normalize(job.canonicalUrl || job.sourceUrl || job.id);
        if (!key || seen.has(key)) return false;
        seen.add(key);
        return true;
      })
      .slice(0, limit)
      .map((job) => ({
        id: job.id,
        title: job.title,
        url: job.sourceUrl || job.canonicalUrl,
        location: job.city,
        contract: job.type,
        openingDate: job.openingDate,
        closingDate: job.closingDate,
        excerpt: job.excerpt,
        sourceLabel: job.sourceName,
      }));
  }

  function sortSpotlightSources(list = []) {
    return list
      .slice()
      .sort((a, b) => {
        const feedA = getInternationalFeed(a.id);
        const feedB = getInternationalFeed(b.id);
        const jobsA = getRenderableFeedJobs(feedA).visible.length;
        const jobsB = getRenderableFeedJobs(feedB).visible.length;
        return jobsB - jobsA || a.priority - b.priority || a.name.localeCompare(b.name, "fr");
      });
  }

  return {
    collectPublicSpotlightJobs,
    collectSpotlightAggregateJobs,
    countFeedJobsWithDates,
    daysSince,
    getFeedJobAgeDays,
    getFeedMonitoringState,
    getFeedPortalState,
    getInternationalFeed,
    getRenderableFeedJobs,
    getSpotlightFeedJobs,
    isExpiredFeedJob,
    isFreshSpotlightJob,
    isInternationalTechJob,
    isLikelyInternationallyEligible,
    isPublicSearchableFeedJob,
    isStaleFeedJob,
    isVisibleFeedJob,
    matchesSpotlightFeedJob,
    mergePublicJobs,
    normalizeFeedJobAsPublicJob,
    sortFeedJobs,
    sortSourcesForSpotlight,
    sortSpotlightSources,
  };
}
