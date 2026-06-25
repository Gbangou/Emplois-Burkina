# Emplois Burkina Automation And Sourcing Blueprint

## Benchmark Direction

The best global recruitment products combine several strengths:

- Indeed and ZipRecruiter: huge coverage, fast search, job alerts, sponsored distribution.
- LinkedIn: network signals, recruiter search, candidate relationship workflows.
- Greenhouse, Lever and iCIMS: ATS automation, structured pipelines, analytics, fairness and integrations.
- Workable and Zoho Recruit: job distribution, templates, collaborative hiring and configurable workflows.
- Getwork and niche job boards: verified sources and fast freshness.

Emplois Burkina should adapt these patterns to Burkina Faso and Francophone Africa: broad collection, strong trust, simple mobile workflows, WhatsApp distribution and recruiter monetization.

## Source Coverage

Emplois Burkina must cover five source families:

- Formal Burkina: companies, cabinets, banks, telecoms, mines, public projects.
- Informal local: chauffeurs, shops, restaurants, construction, artisans, short missions.
- International NGO/UN: UNjobs, ReliefWeb, UNDP, UNICEF, WFP, IRC, NRC, MSF, cooperation projects.
- Global tech: remote software, data, cloud, cybersecurity, product and support IT jobs.
- Public opportunities: concours, internships, scholarships, calls for applications.

## Publication Automation

Each collected opportunity should pass through:

1. Collection: API, RSS, official page, job board, partner form, or moderated community intake.
2. Normalization: title, company, location, category, deadline, source and canonical URL.
3. Scoring: confidence, risk, freshness, deadline readiness and duplicate probability.
4. Routing: auto-publish, scheduled digest, or moderation queue.
5. Distribution: catalogue, SEO, WhatsApp, LinkedIn, Facebook, email digest.

## Technology Direction

- Frontend: Next.js, server rendering, accessible components, mobile-first layouts.
- API: NestJS modules with shared domain logic.
- Data now: JSON for fast iteration.
- Data next: PostgreSQL + Prisma, Redis queue, worker process and object storage.
- Scraping next: Playwright/Cheerio connectors, per-source rate limits, robots checks and source health.
- Intelligence next: semantic matching, skill extraction, explainable scoring and anti-scam classifiers.

## Quality Rules

- No candidate fee allowed unless explicitly official and verified.
- Informal jobs require phone/location verification before broad distribution.
- International jobs require country/remote eligibility clarity.
- Tech jobs require extracted stack, seniority, language and remote/relocation signal.
- UN/NGO jobs require original source link and closing date where available.
