# Emplois Burkina Architecture Blueprint

## Product Layers

Emplois Burkina is structured as a platform, not a simple job listing website.

- Candidate experience: fast search, trusted job cards, saved jobs, alerts, mobile-first reading.
- Recruiter experience: lead capture, packages, moderated publishing, performance reporting.
- Operations experience: scraping health, source quality, review queue, risk monitoring.
- Data platform: raw collection, curation, deduplication, confidence scoring, distribution.

## Runtime Architecture

- `apps/web`: Next.js frontend for public, recruiter and operations surfaces.
- `apps/api`: NestJS API for jobs, leads, platform overview and scraping health.
- `packages/domain`: shared product types and scoring logic used by API and web.
- `data`: current JSON persistence layer for rapid iteration.
- `scripts`: scraping, curation, audits, automation, SEO and social distribution.

## Scraping Principles

- Prefer official career pages, partner feeds, RSS/API sources and lawful public pages.
- Keep `manual_only` sources out of aggressive automation until a reliable connector exists.
- Always preserve attribution: source name, source URL, collected date and canonical URL.
- Every collected item must pass normalization, deduplication, date extraction and risk scoring.
- High-risk or low-confidence jobs stay in review before alerts, SEO pages or sponsor slots.

## Quality Gates

- Frontend: TypeScript check, responsive layouts, stable CSS, no server-only imports in client components.
- Backend: shared domain types, bounded public lists, separate analytics reads.
- Data: source health, confidence average, review queue, deadline coverage.
- Product: benchmark refresh every two weeks against leading job boards and ATS products.

## Next Build Priorities

1. Persist jobs, sources, leads and alerts in PostgreSQL through Prisma.
2. Add an admin moderation board with approve/reject/fix-date actions.
3. Add source connectors with per-source rate limits and robots.txt checks.
4. Add WhatsApp alert segments and delivery logs.
5. Add recruiter analytics and Mobile Money payment workflow.
