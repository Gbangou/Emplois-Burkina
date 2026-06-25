import {
  ArrowRight,
  BadgeCheck,
  Briefcase,
  Globe2,
  Languages,
  MapPin,
  Radar,
  Search,
  ShieldCheck,
  Sparkles,
  Wifi
} from "lucide-react";
import type { Metadata } from "next";
import type { JobOpportunity } from "@emplois-burkina/domain";
import { SiteHeader } from "@/components/site-header";
import { JobCard } from "@/components/job-card";
import { getJobs, getScrapingOverview } from "@/lib/data";

export const metadata: Metadata = {
  title: "Emplois internationaux et remote pour l'Afrique | Emplois Burkina",
  description:
    "Offres remote, ONG, ONU, consulting et opportunités internationales accessibles depuis le Burkina Faso et l'Afrique francophone."
};

const INTERNATIONAL_TERMS = [
  "remote",
  "teletravail",
  "international",
  "global",
  "afrique",
  "africa",
  "ong",
  "ngo",
  "onu",
  "un ",
  "undp",
  "unicef",
  "consult",
  "consultant",
  "humanitaire",
  "anglais",
  "english",
  "digital",
  "data",
  "developer",
  "developpeur"
];

const FOCUS_AREAS = [
  {
    label: "Remote qualifie",
    icon: Wifi,
    query: "remote",
    copy: "Postes tech, data, support client, marketing digital et operations accessibles a distance."
  },
  {
    label: "ONG, ONU et humanitaire",
    icon: ShieldCheck,
    query: "ONG",
    copy: "Missions internationales, programmes de developpement, appels a consultants et terrain regional."
  },
  {
    label: "Afrique francophone",
    icon: Globe2,
    query: "international",
    copy: "Opportunites regionales pour profils bases au Burkina Faso, au Sahel et dans la diaspora."
  }
];

const SEARCH_LINKS = [
  "remote",
  "international",
  "ONG",
  "ONU",
  "consultant",
  "data",
  "developpeur",
  "anglais"
];

function normalize(value = "") {
  return value
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");
}

function isInternationalJob(job: JobOpportunity) {
  const city = normalize(job.city);
  const text = normalize([job.title, job.company, job.city, job.category, job.type, job.sourceName, ...(job.tags || [])].join(" "));
  const matchesTerm = INTERNATIONAL_TERMS.some((term) => text.includes(normalize(term)));
  const outsideBurkina =
    Boolean(city) &&
    !city.includes("burkina") &&
    !city.includes("ouagadougou") &&
    !city.includes("bobo") &&
    !city.includes("koudougou") &&
    !city.includes("banfora") &&
    !city.includes("ouahigouya") &&
    !city.includes("fada") &&
    !city.includes("dedougou");

  return matchesTerm || outsideBurkina;
}

function getDeadlineCount(jobs: JobOpportunity[]) {
  return jobs.filter((job) => Boolean(job.closingDate || job.deadline)).length;
}

export default async function InternationalPage() {
  const [jobs, scraping] = await Promise.all([getJobs(), getScrapingOverview()]);
  const internationalJobs = jobs
    .filter(isInternationalJob)
    .sort((a, b) => {
      const trustDelta = (b.confidenceScore || 0) - (a.confidenceScore || 0);
      if (trustDelta) return trustDelta;
      return String(b.collectedAt || b.closingDate || "").localeCompare(String(a.collectedAt || a.closingDate || ""));
    });

  const featured = internationalJobs.slice(0, 9);
  const trusted = internationalJobs.filter((job) => (job.confidenceScore || 0) >= 80).length;
  const deadlines = getDeadlineCount(internationalJobs);
  const sources = new Set(internationalJobs.map((job) => job.sourceName).filter(Boolean)).size;

  const metrics = [
    { label: "opportunites ciblees", value: internationalJobs.length, icon: Globe2, tone: "text-emerald-700", bg: "bg-emerald-50", border: "border-emerald-200" },
    { label: "sources distinctes", value: sources || scraping.sources, icon: Radar, tone: "text-blue-700", bg: "bg-blue-50", border: "border-blue-200" },
    { label: "avec deadline", value: deadlines, icon: BadgeCheck, tone: "text-violet-700", bg: "bg-violet-50", border: "border-violet-200" },
    { label: "tres fiables", value: trusted, icon: ShieldCheck, tone: "text-amber-700", bg: "bg-amber-50", border: "border-amber-200" }
  ];

  return (
    <div className="min-h-screen bg-background">
      <SiteHeader />

      <section className="border-b border-border bg-white">
        <div className="container py-10 lg:py-12">
          <div className="grid gap-8 lg:grid-cols-[1.1fr_0.9fr] lg:items-end">
            <div>
              <div className="flex items-center gap-2 mb-3">
                <Globe2 size={17} className="text-primary" />
                <p className="text-xs font-black text-primary uppercase tracking-widest">International / Remote</p>
              </div>
              <h1 className="max-w-3xl text-3xl lg:text-5xl font-black text-foreground leading-tight">
                Opportunites internationales accessibles depuis l'Afrique
              </h1>
              <p className="max-w-2xl text-muted-foreground font-semibold mt-4 leading-relaxed">
                Une entree dediee aux offres remote, ONG, ONU, consulting, tech et missions regionales pour les talents bases au Burkina Faso et dans l'Afrique francophone.
              </p>
              <div className="mt-6 flex flex-wrap gap-2">
                {SEARCH_LINKS.map((term) => (
                  <a
                    key={term}
                    href={`/jobs?q=${encodeURIComponent(term)}`}
                    className="inline-flex items-center gap-1.5 rounded-lg border border-border bg-white px-3 py-2 text-xs font-black text-foreground transition-colors hover:border-primary hover:text-primary"
                  >
                    <Search size={12} />
                    {term}
                  </a>
                ))}
              </div>
            </div>

            <div className="grid grid-cols-2 gap-3">
              {metrics.map((metric) => (
                <div key={metric.label} className={`rounded-xl border ${metric.border} ${metric.bg} p-4`}>
                  <metric.icon size={17} className={metric.tone} />
                  <p className={`mt-3 text-2xl font-black leading-none ${metric.tone}`}>{metric.value}</p>
                  <p className="mt-1 text-xs font-semibold text-muted-foreground">{metric.label}</p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      <section className="container py-8">
        <div className="grid gap-4 md:grid-cols-3">
          {FOCUS_AREAS.map((area) => (
            <a
              key={area.label}
              href={`/jobs?q=${encodeURIComponent(area.query)}`}
              className="group rounded-xl border border-border bg-white p-5 transition-all hover:-translate-y-0.5 hover:border-primary hover:shadow-md"
            >
              <div className="flex items-start justify-between gap-4">
                <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-muted text-primary">
                  <area.icon size={18} />
                </div>
                <ArrowRight size={15} className="mt-1 text-muted-foreground transition-transform group-hover:translate-x-0.5 group-hover:text-primary" />
              </div>
              <h2 className="mt-4 text-base font-black text-foreground">{area.label}</h2>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">{area.copy}</p>
            </a>
          ))}
        </div>
      </section>

      <section className="border-y border-border bg-muted/30 py-8">
        <div className="container">
          <div className="flex flex-col gap-4 md:flex-row md:items-end md:justify-between">
            <div>
              <div className="mb-2 flex items-center gap-2">
                <Sparkles size={15} className="text-primary" />
                <p className="text-xs font-black uppercase tracking-widest text-primary">Selection prioritaire</p>
              </div>
              <h2 className="text-2xl font-black text-foreground">Offres internationales a suivre</h2>
              <p className="mt-1 text-sm font-semibold text-muted-foreground">
                Classement par confiance, source et fraicheur pour reduire le bruit.
              </p>
            </div>
            <a
              href="/jobs?q=international"
              className="inline-flex h-10 items-center justify-center gap-2 rounded-xl border border-border bg-white px-4 text-sm font-black text-foreground transition-colors hover:border-primary hover:text-primary"
            >
              Tout explorer <ArrowRight size={14} />
            </a>
          </div>

          {featured.length > 0 ? (
            <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {featured.map((job) => (
                <JobCard key={job.id} job={job} />
              ))}
            </div>
          ) : (
            <div className="mt-6 rounded-xl border border-border bg-white p-6">
              <p className="text-sm font-black text-foreground">La selection internationale est en cours d'enrichissement.</p>
              <p className="mt-1 text-sm font-semibold text-muted-foreground">
                Les prochaines collectes ajouteront les offres remote, ONG et consultants les plus pertinentes.
              </p>
            </div>
          )}
        </div>
      </section>

      <section className="container py-10">
        <div className="grid gap-4 md:grid-cols-3">
          <div className="rounded-xl border border-border bg-white p-5">
            <Languages size={18} className="text-primary" />
            <h2 className="mt-3 text-base font-black text-foreground">Requetes bilingues</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
              Les recherches ciblent les variantes francaises et anglaises pour capter plus d'opportunites qualifiees.
            </p>
          </div>
          <div className="rounded-xl border border-border bg-white p-5">
            <MapPin size={18} className="text-primary" />
            <h2 className="mt-3 text-base font-black text-foreground">Afrique et diaspora</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
              Les offres regionales sont organisees pour rester utiles aux candidats bases au Burkina Faso.
            </p>
          </div>
          <div className="rounded-xl border border-border bg-white p-5">
            <Briefcase size={18} className="text-primary" />
            <h2 className="mt-3 text-base font-black text-foreground">Profils monetisables</h2>
            <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
              Tech, humanitaire, consulting et formation generent des pages plus riches pour le trafic organique durable.
            </p>
          </div>
        </div>
      </section>
    </div>
  );
}
