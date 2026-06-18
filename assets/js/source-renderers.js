export function createSourceRenderers({
  getSources,
  getInternationalFeeds,
  sourceGrid,
  sourceMetrics,
  strategicSourceSections,
  sourceSpotlights,
  sortSourcesByPriority,
  sortSourcesForSpotlight,
  getFeedMonitoringState,
  getRenderableFeedJobs,
  getFeedPortalState,
  getSpotlightFeedJobs,
  collectSpotlightAggregateJobs,
  getInternationalFeed,
  sortFeedJobs,
  getVerifiedSourceCount,
  sourceHasSegment,
  normalize,
  escapeHtml,
  formatJobDate,
  initVisualEnhancements,
}) {
  function sourceReferenceDescriptor(source) {
    if (source?.collection === "official_link") {
      return {
        badge: "Lien officiel",
        actionLabel: "Ouvrir la reference officielle",
        note: "Lien officiel.",
      };
    }

    if (source?.collection === "manual_only") {
      return {
        badge: "Veille humaine",
        actionLabel: "Ouvrir la reference citee",
        note: "Veille humaine.",
      };
    }

    if (source?.collection === "review_required") {
      return {
        badge: "Source verifiee",
        actionLabel: "Ouvrir l'annonce source",
        note: "Source suivie.",
      };
    }

    return {
      badge: "Source citee",
      actionLabel: "Ouvrir la source",
      note: "Source citee.",
    };
  }

  function getSourceTypeLabel(type) {
    const labels = {
      administration: "Administration",
      aggregator: "Agrégateur",
      certification: "Certification",
      competition: "Concours",
      education: "Education",
      employer: "Employeur",
      media: "Media",
      multilateral: "Institution internationale",
      ngo: "ONG",
      organization: "Organisation",
      private: "Prive",
      public: "Public",
      training: "Formation",
    };

    return labels[type] || "Source";
  }

  function getCollectionLabel(collection) {
    const labels = {
      manual_only: "Controle manuel",
      official_link: "Lien officiel",
      review_required: "Verification requise",
    };

    return labels[collection] || "Verification requise";
  }

  function getSourceMonitoringLabel(source) {
    if (source.collection === "manual_only") return "Controle humain";
    if (source.collection === "official_link") return "Source officielle";
    return source.priority <= 1 ? "Veille prioritaire" : "Veille reguliere";
  }

  function renderSourceDirectory() {
    const sources = getSources();
    if (!sourceGrid && !sourceMetrics) return;

    const sourceTypes = sources.reduce((acc, source) => {
      acc[source.type] = (acc[source.type] || 0) + 1;
      return acc;
    }, {});
    const automaticCount = sources.filter((source) => source.collection !== "manual_only").length;
    const manualCount = sources.length - automaticCount;
    const orderedSources = sortSourcesByPriority(sources);
    const feeds = getInternationalFeeds();
    const activeFeedCount = feeds.filter((feed) => getFeedMonitoringState(feed).visibleCount > 0).length;
    const liveSyncCount = feeds.filter((feed) => getFeedMonitoringState(feed).hasLiveSync).length;

    if (sourceMetrics) {
      sourceMetrics.innerHTML = `
        <article><strong>${sources.length}</strong><span>sources surveillees</span></article>
        <article><strong>${activeFeedCount}</strong><span>flux avec offres visibles</span></article>
        <article><strong>${liveSyncCount || automaticCount}</strong><span>suivi automatise exploitable</span></article>
        <article><strong>${manualCount}</strong><span>controle humain</span></article>
        <article><strong>${Object.keys(sourceTypes).length}</strong><span>types de sources</span></article>
      `;
    }

    if (sourceGrid) {
      sourceGrid.innerHTML = orderedSources
        .map((source) => {
          const descriptor = sourceReferenceDescriptor(source);
          return `
          <article class="source-card">
            <div>
              <p class="eyebrow">${getSourceTypeLabel(source.type)}</p>
              <h3>${escapeHtml(source.name)}</h3>
              <p class="muted">${escapeHtml(source.notes || "Source a verifier avant publication.")}</p>
            </div>
            <div class="job-meta">
              <span class="pill">${getCollectionLabel(source.collection)}</span>
              <span class="pill">${getSourceMonitoringLabel(source)}</span>
            </div>
            <a class="secondary-link" href="${escapeHtml(source.url)}" target="_blank" rel="noopener">${escapeHtml(descriptor.actionLabel)}</a>
          </article>
        `;
        })
        .join("");
    }
    initVisualEnhancements();
  }

  function renderInstitutionFeedCard(source, options = {}) {
    const descriptor = sourceReferenceDescriptor(source);
    const feed = getInternationalFeed(source.id);
    const jobs = Array.isArray(options.jobs) ? sortFeedJobs(options.jobs).slice(0, 10) : getRenderableFeedJobs(feed, 10).visible;
    const feedState = getFeedMonitoringState(feed);
    const portalState = getFeedPortalState(feed);
    const animated = jobs.length > 1;
    const trackMarkup = jobs.length
      ? [...jobs, ...(animated ? jobs : [])]
          .map((job) => {
            const summaryBits = [job.location, job.contract].filter(Boolean).join(" - ");
            const secondaryLabel = summaryBits || job.sourceLabel || source.name;
            const dateBits = [
              job.openingDate ? `Publie: ${formatJobDate(job.openingDate)}` : "",
              job.closingDate ? `Cloture: ${formatJobDate(job.closingDate)}` : "",
            ].filter(Boolean);
            const href = !portalState.unavailable && job.url ? ` href="${escapeHtml(job.url)}" target="_blank" rel="noopener"` : "";
            const tagName = portalState.unavailable ? "div" : "a";
            const stateClass = portalState.unavailable ? " is-disabled" : "";
            const statusLine = portalState.unavailable
              ? escapeHtml(portalState.message)
              : escapeHtml(dateBits.join(" | ") || "Date non lue");

            return `
            <${tagName} class="institution-feed-item${stateClass}"${href}>
              <strong>${escapeHtml(job.title)}</strong>
              <span>${escapeHtml(secondaryLabel)}</span>
              <small>${statusLine}</small>
            </${tagName}>
          `;
          })
          .join("")
      : `<div class="institution-feed-empty">${
          feed?.error
            ? "La derniere synchronisation automatique n'a pas abouti pour cette source. Ouvrez directement la reference officielle pendant la reprise."
            : "Aucune offre ouverte n'a encore ete detectee automatiquement pour cette institution. Ouvrez la source officielle."
        }</div>`;

    const footerAction = portalState.unavailable
      ? `<span class="secondary-link is-disabled" aria-disabled="true">${escapeHtml("Portail temporairement indisponible")}</span>`
      : `<a class="secondary-link" href="${escapeHtml(source.url)}" target="_blank" rel="noopener">${escapeHtml(descriptor.actionLabel)}</a>`;

    return `
      <article class="source-card institution-source-card">
        <div>
          <p class="eyebrow">${getSourceTypeLabel(source.type)}</p>
          <h3>${escapeHtml(source.name)}</h3>
          <p class="muted">${escapeHtml(source.notes || "Source a verifier avant publication.")}</p>
        </div>
        <div class="job-meta">
          <span class="pill">${getCollectionLabel(source.collection)}</span>
          <span class="pill">${jobs.length} offre${jobs.length > 1 ? "s" : ""}</span>
          ${feedState.datedCount ? `<span class="pill">${feedState.datedCount} date${feedState.datedCount > 1 ? "s" : ""} lue${feedState.datedCount > 1 ? "s" : ""}</span>` : ""}
          ${feedState.isStale ? `<span class="pill">${escapeHtml("Dernier flux conserve")}</span>` : ""}
          ${feedState.hasError && !feedState.isStale ? `<span class="pill">${escapeHtml("Controle requis")}</span>` : ""}
          ${portalState.unavailable ? `<span class="pill">${escapeHtml("Maintenance externe")}</span>` : ""}
        </div>
        <div
          class="institution-feed-shell ${animated ? "is-animated" : ""}"
          data-feed-auto="${animated ? "true" : "false"}"
          aria-label="${escapeHtml("Liste d'offres defilante. Survolez puis utilisez la molette ou faites glisser pour monter et descendre.")}"
        >
          <div class="institution-feed-track">
            ${trackMarkup}
          </div>
        </div>
        ${footerAction}
      </article>
    `;
  }

  function renderAggregateTechFeedCard(entries = [], spotlight = {}) {
    const aggregateJobs = collectSpotlightAggregateJobs(entries, 10);
    const mergedJobs = [];
    const seen = new Set();

    aggregateJobs.forEach((job) => {
      const key = normalize(job.url || job.id || job.title);
      if (!key || seen.has(key)) return;
      seen.add(key);
      mergedJobs.push(job);
    });

    const aggregateSource = {
      id: `${spotlight.id}-aggregate`,
      name: "Offres internationales en informatique",
      type: "organization",
      collection: "review_required",
      notes:
        "Selection consolidee JobFaso a partir de sources internationales reelles, diversifiees et suivies pour l'IT, la data, les systemes et la cybersecurite.",
      url: spotlight.actionHref || "jobs.html?focus=onu-consultance&q=informatique",
    };

    return renderInstitutionFeedCard(aggregateSource, {
      jobs: mergedJobs,
    });
  }

  function renderStrategicSourcePlaceholder(spotlight, message) {
    const keywordMarkup = spotlight.keywords
      .map((keyword) => `<span class="pill">${escapeHtml(keyword)}</span>`)
      .join("");
    const shortcutMarkup = (spotlight.searchShortcuts || [])
      .map(
        (shortcut) => `
          <button
            class="strategic-search-card"
            type="button"
            data-portal-focus="${escapeHtml(shortcut.focus || "")}"
            data-portal-query="${escapeHtml(shortcut.query || "")}"
          >
            <strong>${escapeHtml(shortcut.label)}</strong>
            <span>${escapeHtml(shortcut.note)}</span>
          </button>
        `
      )
      .join("");

    return `
      <section class="strategic-source-section strategic-source-band" id="${escapeHtml(spotlight.anchor)}">
        <div class="strategic-source-lead">
          <div>
            <p class="eyebrow">${escapeHtml(spotlight.eyebrow)}</p>
            <h3>${escapeHtml(spotlight.title)}</h3>
            <p class="muted">${escapeHtml(spotlight.description)}</p>
          </div>
          <div class="strategic-source-meta">
            <span class="pill">Synchronisation</span>
            <span class="pill">Sources reelles</span>
          </div>
        </div>
        <div class="strategic-search-grid">
          ${shortcutMarkup}
        </div>
        <div class="tag-row keyword-row">${keywordMarkup}</div>
        <div class="source-directory-grid spotlight-grid">
          <article class="source-card institution-source-card">
            <div>
              <p class="eyebrow">${escapeHtml(spotlight.eyebrow)}</p>
              <h3>Chargement des references</h3>
              <p class="muted">${escapeHtml(message)}</p>
            </div>
            <div class="job-meta">
              <span class="pill">Patientez</span>
              <span class="pill">Verification en cours</span>
            </div>
            <div class="institution-feed-shell">
              <div class="institution-feed-track">
                <div class="institution-feed-empty">Les liens officiels et les offres detectees s'afficheront ici automatiquement des que la synchronisation est terminee.</div>
              </div>
            </div>
            <a class="secondary-link" href="${escapeHtml(spotlight.actionHref)}">${escapeHtml(spotlight.actionLabel)}</a>
          </article>
        </div>
        <div class="strategic-source-actions">
          <a class="secondary-link" href="${escapeHtml(spotlight.actionHref)}">${escapeHtml(spotlight.actionLabel)}</a>
          <a class="secondary-link" href="conseils.html">Voir les conseils de candidature</a>
        </div>
      </section>
    `;
  }

  function renderStrategicSourceSections() {
    const sources = getSources();
    const internationalFeeds = getInternationalFeeds();
    if (!strategicSourceSections) return;

    if (!sources.length) {
      strategicSourceSections.innerHTML = sourceSpotlights
        .map((spotlight) =>
          renderStrategicSourcePlaceholder(
            spotlight,
            "Les sources internationales sont en cours de chargement. La rubrique reste visible pour eviter tout ecran vide."
          )
        )
        .join("");
      initVisualEnhancements();
      return;
    }

    if (!internationalFeeds.length) {
      strategicSourceSections.innerHTML = sourceSpotlights
        .map((spotlight) =>
          renderStrategicSourcePlaceholder(
            spotlight,
            "Les flux d'offres internationales sont en cours de synchronisation. Les references officielles seront injectees automatiquement."
          )
        )
        .join("");
      initVisualEnhancements();
      return;
    }

    strategicSourceSections.innerHTML = sourceSpotlights
      .map((spotlight) => {
        const spotlightSegments = Array.isArray(spotlight.segments) && spotlight.segments.length
          ? spotlight.segments
          : [spotlight.id];
        const spotlightCandidates = sortSourcesForSpotlight(
          sources.filter(
            (source) =>
              spotlightSegments.some((segment) => sourceHasSegment(source, segment)) &&
              (!spotlight.sourceTypes?.length || spotlight.sourceTypes.includes(source.type))
          ),
          spotlight
        );
        const spotlightSources = spotlightCandidates
          .map((source) => ({ source, feedJobs: getSpotlightFeedJobs(source, spotlight, 10) }))
          .filter(({ feedJobs }) => feedJobs.length > 0)
          .slice(0, spotlight.mode === "tech" ? Math.max(2, spotlight.limit) : spotlight.limit);
        const spotlightJobCount =
          spotlight.mode === "tech"
            ? (() => {
                const seen = new Set();
                return collectSpotlightAggregateJobs(spotlightSources, 18).filter((job) => {
                  const key = normalize(job.url || job.id || job.title);
                  if (!key || seen.has(key)) return false;
                  seen.add(key);
                  return true;
                }).length;
              })()
            : collectSpotlightAggregateJobs(spotlightSources, 18).length;
        const keywordMarkup = spotlight.keywords.map((keyword) => `<span class="pill">${escapeHtml(keyword)}</span>`).join("");
        const shortcutMarkup = (spotlight.searchShortcuts || [])
          .map(
            (shortcut) => `
            <button
              class="strategic-search-card"
              type="button"
              data-portal-focus="${escapeHtml(shortcut.focus || "")}"
              data-portal-query="${escapeHtml(shortcut.query || "")}"
            >
              <strong>${escapeHtml(shortcut.label)}</strong>
              <span>${escapeHtml(shortcut.note)}</span>
            </button>
          `
          )
          .join("");
        const shouldRenderShortcutGrid = spotlight.mode !== "tech" && Boolean(shortcutMarkup);
        const spotlightCards =
          spotlight.mode === "tech"
            ? [
                ...spotlightSources.slice(0, 2).map(({ source, feedJobs }) => renderInstitutionFeedCard(source, { jobs: feedJobs })),
                ...(spotlightSources.length ? [renderAggregateTechFeedCard(spotlightSources, spotlight)] : []),
              ]
            : spotlightSources.map(({ source, feedJobs }) => renderInstitutionFeedCard(source, { jobs: feedJobs }));

        const cardsMarkup = spotlightCards.length
          ? spotlightCards.join("")
          : `
          <article class="source-card institution-source-card">
            <div>
              <p class="eyebrow">${escapeHtml(spotlight.eyebrow)}</p>
              <h3>Flux en cours de synchronisation</h3>
              <p class="muted">Les institutions internationales sont bien configurees, mais aucune offre exploitable n'a encore ete chargee dans cette rubrique a cet instant.</p>
            </div>
            <div class="institution-feed-shell">
              <div class="institution-feed-track">
                <div class="institution-feed-empty">Rechargez la page dans quelques instants ou ouvrez directement les references officielles ci-dessous.</div>
              </div>
            </div>
            <div class="strategic-source-actions">
              <a class="secondary-link" href="${escapeHtml(spotlight.actionHref)}">${escapeHtml(spotlight.actionLabel)}</a>
            </div>
          </article>`;

        return `
        <section class="strategic-source-section strategic-source-band" id="${escapeHtml(spotlight.anchor)}">
          <div class="strategic-source-lead">
            <div>
              <p class="eyebrow">${escapeHtml(spotlight.eyebrow)}</p>
              <h3>${escapeHtml(spotlight.title)}</h3>
              <p class="muted">${escapeHtml(spotlight.description)}</p>
            </div>
            <div class="strategic-source-meta">
              <span class="pill">${spotlightSources.length} source${spotlightSources.length > 1 ? "s" : ""}</span>
              <span class="pill">${spotlightJobCount} offre${spotlightJobCount > 1 ? "s" : ""} reliee${spotlightJobCount > 1 ? "s" : ""}</span>
              <span class="pill">Liens reels</span>
            </div>
          </div>
          ${shouldRenderShortcutGrid ? `<div class="strategic-search-grid">${shortcutMarkup}</div>` : ""}
          <div class="tag-row keyword-row">${keywordMarkup}</div>
          <div class="source-directory-grid spotlight-grid">${cardsMarkup}</div>
          <div class="strategic-source-actions">
            <a class="secondary-link" href="${escapeHtml(spotlight.actionHref)}">${escapeHtml(spotlight.actionLabel)}</a>
            <a class="secondary-link" href="conseils.html">Voir les conseils de candidature</a>
          </div>
        </section>
      `;
      })
      .join("");

    initVisualEnhancements();
  }

  return {
    renderAggregateTechFeedCard,
    renderInstitutionFeedCard,
    renderSourceDirectory,
    renderStrategicSourcePlaceholder,
    renderStrategicSourceSections,
    sourceReferenceDescriptor,
  };
}
