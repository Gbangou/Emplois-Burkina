import { ArrowLeft, Bot, Gauge, ShieldCheck } from "lucide-react";
import { AutomationCommandCenter } from "@/components/automation-command-center";
import { MarketIntelligencePanel } from "@/components/market-intelligence-panel";
import { ModerationBoard } from "@/components/moderation-board";
import { ScrapingCommandCenter } from "@/components/scraping-command-center";
import { SearchComplianceBoard } from "@/components/search-compliance-board";
import { SourceGovernanceBoard } from "@/components/source-governance-board";
import { RevenueSignalBoard } from "@/components/revenue-signal-board";
import { getAutomationOverview, getMarketIntelligence, getModerationQueue, getScrapingOverview } from "@/lib/data";
import { getRevenueSignals } from "@/lib/revenue-signals";
import { getSearchComplianceReport } from "@/lib/search-compliance";
import { getSourceGovernance } from "@/lib/source-governance";

export default async function OperationsPage() {
  const [automation, intelligence, scraping, moderationQueue, sourceGovernance, revenueSignals] = await Promise.all([
    getAutomationOverview(),
    getMarketIntelligence(),
    getScrapingOverview(),
    getModerationQueue(16),
    getSourceGovernance(),
    getRevenueSignals()
  ]);
  const searchCompliance = getSearchComplianceReport();

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
          <a href="/annonceurs">Recruteurs</a>
        </nav>
      </header>

      <section className="ops-hero">
        <div>
          <p className="eyebrow">Architecture data</p>
          <h1>Scraping robuste, moderation claire, sources sous controle.</h1>
          <p>
            Cette console transforme la collecte en systeme pilotable: volume brut, file de revue,
            confiance, deadlines et actions prioritaires par source.
          </p>
        </div>
        <aside>
          <span>
            <Bot size={18} />
            Pipeline actuel
          </span>
          <strong>{scraping.healthAverage}%</strong>
          <small>Sante moyenne sur {scraping.sources} sources referencees</small>
        </aside>
      </section>

      <section className="section ops-principles">
        <article>
          <Gauge />
          <strong>Mesurer avant d'automatiser</strong>
          <span>Chaque source a un score base sur volume, confiance, deadlines et mode de collecte.</span>
        </article>
        <article>
          <ShieldCheck />
          <strong>Moderation par defaut</strong>
          <span>Les offres douteuses restent en revue avant distribution publique ou WhatsApp.</span>
        </article>
        <article>
          <Bot />
          <strong>Scraping responsable</strong>
          <span>Priorite aux sources autorisees, partenaires, delais raisonnables et attribution claire.</span>
        </article>
      </section>

      <AutomationCommandCenter overview={automation} />

      <MarketIntelligencePanel intelligence={intelligence} />

      <ScrapingCommandCenter overview={scraping} />

      <SourceGovernanceBoard governance={sourceGovernance} />

      <RevenueSignalBoard signals={revenueSignals} />

      <SearchComplianceBoard report={searchCompliance} />

      <ModerationBoard initialJobs={moderationQueue} />
    </main>
  );
}
