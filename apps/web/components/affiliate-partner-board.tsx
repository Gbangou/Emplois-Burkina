import { ArrowUpRight, BadgeCheck, Link2, WalletCards } from "lucide-react";
import { AFFILIATE_PROGRAMS, AFFILIATE_RECOMMENDATIONS } from "@/lib/affiliate-recommendations";

function configured(envName: string) {
  return Boolean(process.env[envName]);
}

export function AffiliatePartnerBoard() {
  const configuredRecommendations = AFFILIATE_RECOMMENDATIONS.filter((item) => configured(item.partnerEnv)).length;
  const missingRecommendations = AFFILIATE_RECOMMENDATIONS.length - configuredRecommendations;

  return (
    <section className="section">
      <div className="section-head">
        <div>
          <p className="eyebrow">Affiliation rentable</p>
          <h2>Vrais programmes partenaires a activer pour transformer le trafic en commissions.</h2>
        </div>
        <p>
          Les liens de candidature sont officiels. Les revenus commencent seulement quand les URLs affiliées
          personnelles sont ajoutees dans l'environnement de production.
        </p>
      </div>

      <div className="grid gap-4 md:grid-cols-4">
        <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <WalletCards size={17} className="text-primary" />
          <p className="mt-3 text-2xl font-black text-foreground">{AFFILIATE_PROGRAMS.length}</p>
          <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">Programmes reels</p>
        </article>
        <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <BadgeCheck size={17} className="text-primary" />
          <p className="mt-3 text-2xl font-black text-foreground">{configuredRecommendations}</p>
          <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">Liens configures</p>
        </article>
        <article className="rounded-xl border border-border bg-white p-4 shadow-sm">
          <Link2 size={17} className="text-primary" />
          <p className="mt-3 text-2xl font-black text-foreground">{missingRecommendations}</p>
          <p className="mt-1 text-xs font-black uppercase tracking-wide text-muted-foreground">A brancher</p>
        </article>
        <article className="rounded-xl border border-border bg-muted/30 p-4">
          <p className="text-xs font-black uppercase tracking-wide text-muted-foreground">Action prioritaire</p>
          <p className="mt-2 text-sm font-bold leading-relaxed text-muted-foreground">
            Demander Impact, puis renseigner les URLs `EMPLOIS_BURKINA_AFFILIATE_*_URL`.
          </p>
        </article>
      </div>

      <div className="mt-4 grid gap-4 lg:grid-cols-2">
        {AFFILIATE_PROGRAMS.map((program) => (
          <article key={program.id} className="rounded-xl border border-border bg-white p-4 shadow-sm">
            <div className="flex items-start justify-between gap-3">
              <div>
                <p className="text-sm font-black text-foreground">{program.name}</p>
                <p className="mt-1 text-xs font-black uppercase tracking-wide text-primary">{program.network}</p>
              </div>
              <a href={program.applyUrl} rel="nofollow sponsored" className="text-primary" aria-label={`Demander ${program.name}`}>
                <ArrowUpRight size={18} />
              </a>
            </div>
            <p className="mt-3 text-xs font-bold leading-relaxed text-muted-foreground">{program.bestFor}</p>
            <div className="mt-3 grid gap-2 text-xs font-bold leading-relaxed text-muted-foreground">
              <p>Commission: {program.commission}</p>
              <p>Paiement: {program.payout}</p>
            </div>
          </article>
        ))}
      </div>
    </section>
  );
}
