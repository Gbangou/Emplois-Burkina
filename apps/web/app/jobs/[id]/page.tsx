import {
  ArrowLeft,
  ArrowUpRight,
  Bell,
  Briefcase,
  Building2,
  CalendarClock,
  CheckCircle,
  ExternalLink,
  MapPin,
  Share2,
  ShieldCheck,
  Tag,
  TriangleAlert,
  Zap
} from "lucide-react";
import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { getJobs } from "@/lib/data";
import { buildBreadcrumbJsonLd, buildJobPostingJsonLd, getJobDeadline, isIndexableJob, jobCanonicalUrl, SITE_URL } from "@/lib/seo";
import { SiteHeader } from "@/components/site-header";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { JobDetailActions } from "./job-detail-actions";

type PageProps = {
  params: Promise<{ id: string }>;
};

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params;
  const jobs = await getJobs();
  const job = jobs.find((j) => j.id === id);
  if (!job) return { title: "Offre introuvable — Emplois Burkina" };
  const title = `${job.title}${job.company ? ` · ${job.company}` : ""}`;
  const description = job.excerpt
    ? job.excerpt.slice(0, 160)
    : `Offre d'emploi : ${job.title} à ${job.city || "Burkina Faso"}. Voir les détails et postuler sur Emplois Burkina.`;
  return {
    title,
    description,
    alternates: {
      canonical: jobCanonicalUrl(job)
    },
    robots: isIndexableJob(job)
      ? { index: true, follow: true }
      : { index: false, follow: true, googleBot: { index: false, follow: true } },
    openGraph: {
      title,
      description,
      type: "article",
      locale: "fr_BF",
      siteName: "Emplois Burkina",
      url: jobCanonicalUrl(job)
    },
    twitter: { card: "summary", title, description }
  };
}

function ScoreBadge({ score }: { score: number }) {
  if (score >= 85) return <Badge variant="success"><CheckCircle size={10} /> {score}% — Très fiable</Badge>;
  if (score >= 65) return <Badge variant="blue"><ShieldCheck size={10} /> {score}% — Fiable</Badge>;
  return <Badge variant="warning"><TriangleAlert size={10} /> {score}% — À vérifier</Badge>;
}

function MetaRow({ icon: Icon, label, value, href }: {
  icon: React.ElementType; label: string; value?: string | null; href?: string;
}) {
  if (!value) return null;
  const inner = (
    <div className="flex items-center gap-3 py-3 group">
      <div className="w-8 h-8 rounded-lg bg-muted flex items-center justify-center shrink-0">
        <Icon size={14} className="text-muted-foreground" />
      </div>
      <div className="flex-1 min-w-0">
        <p className="text-xs font-black uppercase tracking-wide text-muted-foreground">{label}</p>
        <p className="text-sm font-semibold text-foreground truncate mt-0.5">{value}</p>
      </div>
      {href && <ExternalLink size={13} className="text-muted-foreground opacity-0 group-hover:opacity-100 transition-opacity shrink-0" />}
    </div>
  );
  if (href) return (
    <a href={href} target="_blank" rel="noopener noreferrer" className="block hover:bg-muted/50 rounded-lg px-2 -mx-2 transition-colors">
      {inner}
    </a>
  );
  return <div className="px-2 -mx-2">{inner}</div>;
}

export default async function JobDetailPage({ params }: PageProps) {
  const { id } = await params;
  const jobs = await getJobs();
  const job = jobs.find((j) => j.id === id);
  if (!job) notFound();

  const deadline = getJobDeadline(job);
  const jsonLd = buildJobPostingJsonLd(job);
  const breadcrumbJsonLd = buildBreadcrumbJsonLd([
    { name: "Accueil", url: SITE_URL },
    { name: "Offres", url: `${SITE_URL}/jobs` },
    { name: job.title, url: jobCanonicalUrl(job) }
  ]);
  const isUrgent = deadline && new Date(deadline) < new Date(Date.now() + 7 * 86400000);
  const score = job.confidenceScore ?? 70;

  const related = jobs
    .filter((j) => j.id !== id && (j.category === job.category || j.city === job.city))
    .sort((a, b) => (b.confidenceScore || 0) - (a.confidenceScore || 0))
    .slice(0, 4);

  return (
    <div className="min-h-screen bg-background">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbJsonLd) }}
      />
      <SiteHeader />

      <div className="container py-6 lg:py-10 pb-24 lg:pb-10">

        {/* Breadcrumb */}
        <div className="flex items-center gap-2 mb-6 text-sm">
          <a href="/jobs" className="inline-flex items-center gap-1.5 font-black text-primary hover:underline">
            <ArrowLeft size={14} /> Offres
          </a>
          <span className="text-border">›</span>
          <span className="text-muted-foreground font-semibold truncate max-w-xs">{job.category || "Opportunité"}</span>
        </div>

        <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_360px] items-start">

          {/* ── LEFT COLUMN ── */}
          <div className="grid gap-5">

            {/* Hero card */}
            <div className="rounded-2xl overflow-hidden border border-border shadow-sm">
              {/* Dark header */}
              <div className="p-6 lg:p-8"
                style={{ background: "linear-gradient(135deg, #07171e 0%, #0c3d26 100%)" }}>

                {/* Badges row */}
                <div className="flex flex-wrap gap-2 mb-4">
                  {job.type && (
                    <span className="inline-flex items-center gap-1 bg-white/10 border border-white/15 text-white/90 rounded-full px-3 py-1 text-xs font-black">
                      <Briefcase size={10} /> {job.type}
                    </span>
                  )}
                  {job.category && (
                    <span className="inline-flex items-center gap-1 bg-emerald-500/20 border border-emerald-500/30 text-emerald-300 rounded-full px-3 py-1 text-xs font-black">
                      {job.category}
                    </span>
                  )}
                  {isUrgent && (
                    <span className="inline-flex items-center gap-1 bg-red-500/20 border border-red-400/30 text-red-300 rounded-full px-3 py-1 text-xs font-black">
                      <Zap size={10} /> Urgent
                    </span>
                  )}
                </div>

                {/* Title */}
                <h1 className="font-black text-white leading-tight mb-3"
                  style={{ fontSize: "clamp(1.4rem, 3vw, 2rem)" }}>
                  {job.title}
                </h1>

                {/* Meta inline */}
                <div className="flex flex-wrap gap-4">
                  {job.company && (
                    <span className="flex items-center gap-2 text-sm font-semibold text-white/75">
                      <Building2 size={14} className="text-cyan-400" /> {job.company}
                    </span>
                  )}
                  {job.city && (
                    <span className="flex items-center gap-2 text-sm font-semibold text-white/75">
                      <MapPin size={14} className="text-yellow-400" /> {job.city}
                    </span>
                  )}
                  {deadline && (
                    <span className={`flex items-center gap-2 text-sm font-semibold ${isUrgent ? "text-red-300" : "text-white/75"}`}>
                      <CalendarClock size={14} /> Clôture : {deadline}
                    </span>
                  )}
                </div>
              </div>

              {/* Score bar */}
              <div className="flex items-center justify-between gap-4 px-6 lg:px-8 py-3 bg-muted/50 border-t border-border flex-wrap">
                <div className="flex gap-2 flex-wrap">
                  <ScoreBadge score={score} />
                  {(job.riskScore || 0) > 25 && (
                    <Badge variant="warning">
                      <TriangleAlert size={10} /> Risque : {job.riskScore}%
                    </Badge>
                  )}
                </div>
                {job.sourceName && (
                  <span className="text-xs font-semibold text-muted-foreground flex items-center gap-1">
                    <CheckCircle size={10} className="text-emerald-500" /> {job.sourceName}
                  </span>
                )}
              </div>
            </div>

            {/* Description */}
            {job.excerpt && (
              <Card>
                <CardHeader>
                  <CardTitle className="text-base flex items-center gap-2">
                    <Briefcase size={16} className="text-primary" />
                    Description de l'offre
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  <p className="text-sm font-semibold text-muted-foreground leading-relaxed whitespace-pre-line">
                    {job.excerpt}
                  </p>
                </CardContent>
              </Card>
            )}

            {/* Tags */}
            {job.tags && job.tags.filter((t) => !t.startsWith("moderation:")).length > 0 && (
              <Card>
                <CardContent className="pt-5">
                  <p className="text-xs font-black uppercase tracking-wide text-muted-foreground mb-3 flex items-center gap-1.5">
                    <Tag size={12} /> Mots-clés
                  </p>
                  <div className="flex flex-wrap gap-2">
                    {job.tags.filter((t) => !t.startsWith("moderation:")).map((tag) => (
                      <Badge key={tag} variant="muted">{tag}</Badge>
                    ))}
                  </div>
                </CardContent>
              </Card>
            )}

            {/* Related jobs */}
            {related.length > 0 && (
              <div>
                <p className="text-xs font-black uppercase tracking-wide text-muted-foreground mb-3">
                  Offres similaires
                </p>
                <div className="grid gap-3 sm:grid-cols-2">
                  {related.map((rel) => (
                    <a key={rel.id} href={`/jobs/${rel.id}`}
                      className="flex items-center gap-3 p-4 rounded-xl border border-border bg-card hover:shadow-sm hover:-translate-y-px transition-all group">
                      <div className="w-10 h-10 rounded-xl bg-muted flex items-center justify-center shrink-0">
                        <Briefcase size={15} className="text-primary" />
                      </div>
                      <div className="flex-1 min-w-0">
                        <p className="font-black text-sm text-foreground truncate group-hover:text-primary transition-colors">{rel.title}</p>
                        <p className="text-xs text-muted-foreground font-semibold mt-0.5 truncate">
                          {[rel.company, rel.city].filter(Boolean).join(" · ")}
                        </p>
                      </div>
                      <Badge variant="success" className="shrink-0 text-xs">{rel.confidenceScore || 70}%</Badge>
                    </a>
                  ))}
                </div>
              </div>
            )}
          </div>

          {/* ── RIGHT SIDEBAR ── */}
          <div className="grid gap-4 lg:sticky lg:top-20">

            {/* Apply CTA */}
            <Card className="shadow-md">
              <CardContent className="p-5 grid gap-3">
                <h3 className="font-black text-foreground text-base">Postuler à cette offre</h3>
                <p className="text-sm text-muted-foreground font-semibold leading-relaxed">
                  L'offre est hébergée sur le site officiel de l'organisation.
                </p>

                {job.sourceUrl ? (
                  <a
                    href={job.sourceUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center justify-center gap-2 w-full h-12 rounded-xl font-black text-sm text-white transition-all hover:-translate-y-0.5"
                    style={{ background: "linear-gradient(135deg, #dd3f31, #b82f25)", boxShadow: "0 6px 20px rgba(221,63,49,0.25)" }}
                  >
                    <ExternalLink size={15} />
                    Voir l'offre officielle
                  </a>
                ) : (
                  <div className="flex items-center justify-center h-12 rounded-xl border border-border text-sm font-semibold text-muted-foreground bg-muted">
                    Lien source non disponible
                  </div>
                )}

                <JobDetailActions
                  jobId={job.id}
                  jobTitle={job.title}
                  jobCity={job.city}
                  jobCategory={job.category}
                />
              </CardContent>
            </Card>

            {/* Info card */}
            <Card>
              <CardContent className="p-5">
                <p className="text-xs font-black uppercase tracking-wide text-muted-foreground mb-1">
                  Détails
                </p>
                <Separator className="mb-3" />
                <div className="divide-y divide-border">
                  <MetaRow icon={Building2} label="Organisation" value={job.company} />
                  <MetaRow icon={MapPin} label="Lieu" value={job.city || "Burkina Faso"} />
                  <MetaRow icon={Briefcase} label="Type de contrat" value={job.type} />
                  <MetaRow icon={Tag} label="Secteur" value={job.category} />
                  <MetaRow icon={CalendarClock} label="Date de clôture" value={deadline} />
                  {job.salary && <MetaRow icon={CheckCircle} label="Salaire" value={job.salary} />}
                  {job.sourceUrl && (
                    <MetaRow
                      icon={ExternalLink}
                      label="Source officielle"
                      value={job.sourceName || "Voir la source"}
                      href={job.sourceUrl}
                    />
                  )}
                </div>
              </CardContent>
            </Card>

            {/* WhatsApp alert */}
            <Card className="border-emerald-200 bg-emerald-50/50">
              <CardContent className="p-5 grid gap-3">
                <div className="flex items-center gap-2">
                  <Bell size={15} className="text-emerald-700" />
                  <h3 className="font-black text-sm text-emerald-900">
                    Alertes offres similaires
                  </h3>
                </div>
                <p className="text-xs font-semibold text-emerald-800/70 leading-relaxed">
                  Recevez sur WhatsApp les prochaines offres en{" "}
                  <strong>{job.category || "ce secteur"}</strong>
                  {job.city ? ` à ${job.city}` : ""}.
                </p>
                <JobDetailActions
                  jobId={job.id}
                  jobTitle={job.title}
                  jobCity={job.city}
                  jobCategory={job.category}
                  showAlertOnly
                />
              </CardContent>
            </Card>

            {/* Share */}
            <JobDetailActions
              jobId={job.id}
              jobTitle={job.title}
              jobCity={job.city}
              jobCategory={job.category}
              showShareOnly
            />
          </div>
        </div>
      </div>
    </div>
  );
}
