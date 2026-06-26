import type { JobOpportunity } from "@emplois-burkina/domain";

export const SITE_URL = "https://emplois-burkina.com";

function asDate(value?: string | null) {
  if (!value) return null;
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? null : date;
}

export function toIsoDate(value?: string | null) {
  return asDate(value)?.toISOString().slice(0, 10);
}

export function getJobDeadline(job: JobOpportunity) {
  return job.closingDate || job.deadline || "";
}

export function isExpiredJob(job: JobOpportunity, now = new Date()) {
  const deadline = asDate(getJobDeadline(job));
  if (!deadline) return false;
  deadline.setHours(23, 59, 59, 999);
  return deadline.getTime() < now.getTime();
}

export function isIndexableJob(job: JobOpportunity, now = new Date()) {
  const hasUsefulContent = Boolean(job.title && (job.company || job.sourceName) && (job.excerpt || job.sourceUrl));
  const isTrustedEnough = (job.confidenceScore || 0) >= 55 && (job.riskScore || 0) <= 45;
  return hasUsefulContent && isTrustedEnough && !isExpiredJob(job, now);
}

export function jobCanonicalUrl(job: JobOpportunity) {
  return `${SITE_URL}/jobs/${job.id}`;
}

function employmentType(type?: string) {
  const normalized = (type || "").toLowerCase();
  if (normalized.includes("stage")) return "INTERN";
  if (normalized.includes("cdi")) return "FULL_TIME";
  if (normalized.includes("temps partiel") || normalized.includes("part")) return "PART_TIME";
  if (normalized.includes("consult") || normalized.includes("prestation")) return "CONTRACTOR";
  return "OTHER";
}

export function buildJobPostingJsonLd(job: JobOpportunity) {
  const deadline = toIsoDate(getJobDeadline(job));
  const posted = toIsoDate(job.openingDate || job.collectedAt);

  return {
    "@context": "https://schema.org",
    "@type": "JobPosting",
    "@id": `${jobCanonicalUrl(job)}#jobposting`,
    title: job.title,
    description: job.excerpt || `${job.title} - ${job.company || job.sourceName || "Organisation"} - ${job.city || "Burkina Faso"}`,
    identifier: {
      "@type": "PropertyValue",
      name: "Emplois Burkina",
      value: job.id
    },
    datePosted: posted,
    validThrough: deadline,
    employmentType: employmentType(job.type),
    directApply: false,
    hiringOrganization: {
      "@type": "Organization",
      name: job.company || job.sourceName || "Organisation",
      sameAs: job.sourceUrl || undefined
    },
    jobLocation: {
      "@type": "Place",
      address: {
        "@type": "PostalAddress",
        addressLocality: job.city || "Burkina Faso",
        addressCountry: "BF"
      }
    },
    url: jobCanonicalUrl(job),
    applicantLocationRequirements: {
      "@type": "Country",
      name: "Burkina Faso"
    }
  };
}

export function buildBreadcrumbJsonLd(items: Array<{ name: string; url: string }>) {
  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: items.map((item, index) => ({
      "@type": "ListItem",
      position: index + 1,
      name: item.name,
      item: item.url
    }))
  };
}
