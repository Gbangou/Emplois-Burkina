export function createAdminHelpers({
  adminJobSourceFilter,
  adminJobSearchInput,
  adminJobStatusFilter,
  adminJobDateFilter,
  leadCount,
  eventCount,
  adminSummary,
  leadTable,
  adminJobsFilterSummary,
  adminJobsList,
  readStorageArray,
  leadsKey,
  eventsKey,
  getJobs,
  normalize,
  getJobSearchScore,
  isExpiredJob,
  escapeHtml,
  displayDate,
  formatFcfa,
  saveLead,
  syncLeadToServer,
}) {
  function hydrateAdminSourceFilter() {
    if (!adminJobSourceFilter) return;
    const current = adminJobSourceFilter.value;
    const values = [...new Set(getJobs().map((job) => job.sourceName).filter(Boolean))].sort((a, b) => a.localeCompare(b, "fr"));
    adminJobSourceFilter.innerHTML = `<option value="">Toutes les sources</option>${values
      .map((source) => `<option value="${escapeHtml(source)}">${escapeHtml(source)}</option>`)
      .join("")}`;
    adminJobSourceFilter.value = values.includes(current) ? current : "";
  }

  function isFreshAdminJob(job) {
    const reference = new Date(job.collectedAt || 0).getTime();
    if (!reference) return false;
    return reference >= Date.now() - 14 * 24 * 60 * 60 * 1000;
  }

  function getFilteredAdminJobs() {
    const query = normalize(adminJobSearchInput?.value || "");
    const status = adminJobStatusFilter?.value || "";
    const source = adminJobSourceFilter?.value || "";
    const dateMode = adminJobDateFilter?.value || "";

    return getJobs().filter((job) => {
      const haystack = normalize(
        [job.title, job.company, job.city, job.category, job.type, job.sourceName, job.deadline, ...(job.tags || [])].join(" ")
      );
      const matchesQuery = !query || haystack.includes(query) || getJobSearchScore(job, query) > 0;
      const matchesStatus = !status || job.status === status;
      const matchesSource = !source || job.sourceName === source;
      const matchesDateMode =
        !dateMode ||
        (dateMode === "expired" && isExpiredJob(job)) ||
        (dateMode === "missing_closing" && !job.closingDate) ||
        (dateMode === "inconsistent" && Boolean(job.inconsistentDates)) ||
        (dateMode === "fresh" && isFreshAdminJob(job));

      return matchesQuery && matchesStatus && matchesSource && matchesDateMode;
    });
  }

  function getLeadLabel(kind) {
    const labels = {
      alert: "Alerte candidat",
      publish: "Publication",
      sponsor: "Commercial",
      contact: "Contact",
    };
    return labels[kind] || "Lead";
  }

  function leadContact(lead) {
    return lead.data?.contact || lead.data?.phone || lead.data?.email || "";
  }

  function leadName(lead) {
    return lead.data?.organization || lead.data?.name || lead.data?.title || "Sans nom";
  }

  function exportLeadsCsv() {
    const leads = readStorageArray(leadsKey);
    const headers = ["date", "type", "nom", "contact", "valeur_fcfa", "statut", "details"];
    const rows = leads.map((lead) => [
      displayDate(lead.createdAt),
      getLeadLabel(lead.kind),
      leadName(lead),
      leadContact(lead),
      lead.valueFcfa || 0,
      lead.status,
      JSON.stringify(lead.data || {}),
    ]);
    const csv = [headers, ...rows]
      .map((row) => row.map((cell) => `"${String(cell).replaceAll('"', '""')}"`).join(","))
      .join("\n");
    const blob = new Blob([csv], { type: "text/csv;charset=utf-8" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = `jobfaso-leads-${new Date().toISOString().slice(0, 10)}.csv`;
    link.click();
    URL.revokeObjectURL(url);
  }

  function validateLead(kind, data) {
    const contact = data.phone || data.contact || data.email || "";
    if (kind === "alert" && !/(\+?\d[\d\s.-]{6,})/.test(contact)) {
      return "Ajoutez un numero WhatsApp valide.";
    }
    if (!Object.values(data).some((value) => String(value || "").trim())) {
      return "Veuillez remplir les informations demandees.";
    }
    return "";
  }

  function setFormState(form, message, text, state = "info") {
    if (!message) return;
    message.textContent = text;
    message.dataset.state = state;
    form.dataset.state = state;
  }

  function handleDemoForm(form, messageId, successText) {
    form.addEventListener("submit", async (event) => {
      event.preventDefault();
      const message = document.querySelector(messageId);
      const data = Object.fromEntries(new FormData(form).entries());
      const kind = form.dataset.leadType || "contact";
      const error = validateLead(kind, data);
      if (error) {
        setFormState(form, message, error, "error");
        return;
      }

      const submitButton = form.querySelector("button[type='submit']");
      submitButton?.setAttribute("disabled", "disabled");
      setFormState(form, message, "Envoi en cours...", "info");
      const lead = saveLead(kind, data);

      try {
        const serverId = await syncLeadToServer(lead);
        setFormState(form, message, serverId ? `${successText} Reference: ${serverId.slice(0, 8)}.` : successText, "success");
        form.reset();
      } catch {
        setFormState(form, message, successText, "success");
      } finally {
        submitButton?.removeAttribute("disabled");
      }
    });
  }

  function renderAdmin() {
    const leads = readStorageArray(leadsKey);
    const events = readStorageArray(eventsKey);
    const jobs = getJobs();
    const pipelineValue = leads.reduce((sum, lead) => sum + (lead.valueFcfa || 0), 0);
    const reviewJobs = jobs.filter((job) => job.status === "needs_review");
    const expiredJobs = jobs.filter((job) => isExpiredJob(job));
    const inconsistentJobs = jobs.filter((job) => job.inconsistentDates);
    const moderationJobs = jobs
      .slice()
      .sort((a, b) => Number(a.status === "needs_review") - Number(b.status === "needs_review"))
      .reverse();
    const filteredAdminJobs = getFilteredAdminJobs()
      .slice()
      .sort((a, b) => Number(a.status === "needs_review") - Number(b.status === "needs_review"))
      .reverse();

    if (leadCount) leadCount.textContent = leads.length;
    if (eventCount) eventCount.textContent = events.length;
    hydrateAdminSourceFilter();

    if (adminSummary) {
      adminSummary.innerHTML = `
        <article><strong>${leads.length}</strong><span>leads captures</span></article>
        <article><strong>${formatFcfa(pipelineValue)}</strong><span>pipeline potentiel</span></article>
        <article><strong>${reviewJobs.length}</strong><span>offres a moderer</span></article>
        <article><strong>${expiredJobs.length}</strong><span>expirees</span></article>
        <article><strong>${inconsistentJobs.length}</strong><span>dates incoherentes</span></article>
        <article><strong>${events.length}</strong><span>evenements suivis</span></article>
      `;
    }

    if (leadTable) {
      leadTable.innerHTML = leads.length
        ? leads
            .map(
              (lead) => `
                <tr>
                  <td>${escapeHtml(displayDate(lead.createdAt))}</td>
                  <td>${escapeHtml(getLeadLabel(lead.kind))}</td>
                  <td>${escapeHtml(leadName(lead))}</td>
                  <td>${escapeHtml(leadContact(lead))}</td>
                  <td>${escapeHtml(formatFcfa(lead.valueFcfa))}</td>
                </tr>
              `
            )
            .join("")
        : `<tr><td colspan="5">Aucun lead local pour le moment.</td></tr>`;
    }

    if (adminJobsFilterSummary) {
      adminJobsFilterSummary.textContent = `${filteredAdminJobs.length} offre${filteredAdminJobs.length > 1 ? "s" : ""} affichee${filteredAdminJobs.length > 1 ? "s" : ""} sur ${moderationJobs.length}. ${reviewJobs.length} a moderer, ${expiredJobs.length} expiree${expiredJobs.length > 1 ? "s" : ""}, ${inconsistentJobs.length} avec dates incoherentes.`;
    }

    if (adminJobsList) {
      adminJobsList.innerHTML = filteredAdminJobs.length
        ? filteredAdminJobs
            .slice(0, 24)
            .map(
              (job) => `
                <article class="job-card" data-job-id="${escapeHtml(job.id)}">
                  <p class="eyebrow">${escapeHtml(job.category || "A classer")}</p>
                  <h3>${escapeHtml(job.title)}</h3>
                  <p class="muted">${escapeHtml(job.company || job.sourceName || "")} - ${escapeHtml(job.city || "Burkina Faso")}</p>
                  <div class="job-meta">
                    <span class="pill ${job.status === "needs_review" ? "warning" : ""}">${escapeHtml(job.status || "needs_review")}</span>
                    <span class="pill">${escapeHtml(job.sourceName || "Source")}</span>
                    ${isExpiredJob(job) ? `<span class="pill warning">Expiree</span>` : ""}
                    ${job.inconsistentDates ? `<span class="pill warning">Dates incoherentes</span>` : ""}
                    ${!job.closingDate ? `<span class="pill">Cloture absente</span>` : ""}
                  </div>
                  ${job.moderationNote ? `<p class="muted">${escapeHtml(job.moderationNote)}</p>` : ""}
                  <div class="job-actions">
                    <a class="secondary-link" href="${escapeHtml(job.sourceUrl || "#")}" target="_blank" rel="noopener" data-track="admin_source_open" data-track-label="${escapeHtml(job.title)}">Verifier</a>
                    <button class="secondary-button moderation-button" type="button" data-job-id="${escapeHtml(job.id)}" data-status="validated">Valider</button>
                    <button class="secondary-button moderation-button" type="button" data-job-id="${escapeHtml(job.id)}" data-status="needs_review">Revoir</button>
                    <button class="secondary-button moderation-button" type="button" data-job-id="${escapeHtml(job.id)}" data-status="rejected">Rejeter</button>
                  </div>
                  <details class="admin-edit">
                    <summary>Modifier l'offre</summary>
                    <form class="admin-edit-form" data-job-id="${escapeHtml(job.id)}">
                      <label>Titre<input name="title" value="${escapeHtml(job.title || "")}" required /></label>
                      <label>Entreprise<input name="company" value="${escapeHtml(job.company || "")}" /></label>
                      <label>Ville<input name="city" value="${escapeHtml(job.city || "")}" /></label>
                      <label>Categorie<input name="category" value="${escapeHtml(job.category || "")}" /></label>
                      <label>Type<input name="type" value="${escapeHtml(job.type || "")}" /></label>
                      <label>Ouverture<input name="openingDate" type="date" value="${escapeHtml(job.openingDate || "")}" /></label>
                      <label>Cloture<input name="closingDate" type="date" value="${escapeHtml(job.closingDate || "")}" /></label>
                      <label>Source<input name="sourceName" value="${escapeHtml(job.sourceName || "")}" /></label>
                      <label>URL source<input name="sourceUrl" value="${escapeHtml(job.sourceUrl || "")}" /></label>
                      <label>Tags<input name="tags" value="${escapeHtml((job.tags || []).join(", "))}" /></label>
                      <button type="submit">Enregistrer</button>
                    </form>
                  </details>
                </article>
              `
            )
            .join("")
        : `<p class="muted">Aucune offre ne correspond aux filtres de moderation.</p>`;
    }
  }

  return {
    exportLeadsCsv,
    getFilteredAdminJobs,
    getLeadLabel,
    handleDemoForm,
    hydrateAdminSourceFilter,
    isFreshAdminJob,
    leadContact,
    leadName,
    renderAdmin,
    setFormState,
    validateLead,
  };
}
