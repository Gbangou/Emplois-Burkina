import { ArrowLeft, Bot, Globe2, RadioTower } from "lucide-react";
import { AutomationCommandCenter } from "@/components/automation-command-center";
import { PublicationBatchLauncher } from "@/components/publication-batch-launcher";
import { getAutomationOverview, getPublicationBatches } from "@/lib/data";

export default async function AutomationPage() {
  const [automation, batches] = await Promise.all([getAutomationOverview(), getPublicationBatches()]);

  return (
    <main>
      <header className="topbar">
        <a className="brand" href="/">
          <span>EB</span>
          <strong>Emplois Burkina</strong>
        </a>
        <nav>
          <a href="/">
            <ArrowLeft size={15} />
            Accueil
          </a>
          <a href="/jobs">Offres</a>
          <a href="/operations">Operations</a>
          <a href="/annonceurs">Recruteurs</a>
        </nav>
      </header>

      <section className="automation-hero">
        <div>
          <p className="eyebrow">Publication engine</p>
          <h1>Automatiser largement, publier proprement, proteger la confiance.</h1>
          <p>
            Emplois Burkina couvre le formel, l'informel, les concours, l'international, les ONG/ONU et les metiers tech,
            avec une file de publication qui decide: auto-publication, digest ou moderation.
          </p>
        </div>
        <aside>
          <span>
            <RadioTower size={18} />
            Canaux actifs
          </span>
          <strong>{automation.channels.length}</strong>
          <small>{automation.channels.join(" / ")}</small>
        </aside>
      </section>

      <section className="section automation-principles">
        <article>
          <Bot />
          <strong>Collecte large</strong>
          <span>Sources locales, terrain, job boards, pages carrieres, flux internationaux et remote tech.</span>
        </article>
        <article>
          <Globe2 />
          <strong>Segmentation fine</strong>
          <span>Chaque offre rejoint un segment pour choisir le bon canal et le bon niveau de controle.</span>
        </article>
        <article>
          <RadioTower />
          <strong>Distribution controlee</strong>
          <span>Catalogue, SEO, WhatsApp, LinkedIn, Facebook et digests seulement si la qualite est suffisante.</span>
        </article>
      </section>

      <AutomationCommandCenter overview={automation} />

      <PublicationBatchLauncher initialBatches={batches} />
    </main>
  );
}
