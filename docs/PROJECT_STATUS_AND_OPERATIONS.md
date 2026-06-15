# JobFaso - Etat du projet et guide operationnel

Derniere mise a jour : 12 juin 2026.

Ce document consigne les decisions, composants et commandes importantes du
projet JobFaso. Il sert de reference pour reprendre le travail sans perdre le
contexte.

## Objectif produit

JobFaso est une web app emploi pour le Burkina Faso :

- offres d'emploi, concours, stages, missions terrain et metiers informels ;
- collecte multi-sources avec moderation ;
- pages SEO indexables par ville, categorie, guide et fiche offre ;
- alertes candidats, leads recruteurs et espaces sponsorises ;
- analytics anonymisees pour mesurer audience, clics sponsorises et pipeline ;
- base locale SQLite fonctionnelle en developpement, puis migration PostgreSQL/Supabase.

## Frontend

Pages principales :

- `index.html` : accueil portail, recherche, carrousels, sources actives,
  offres a la une, categories, regions, CVtheque, monetisation.
- `jobs.html` : catalogue complet avec filtres par ville, type, source,
  categorie et favoris.
- `conseils.html` : guides candidats.
- `grille-tarifaire.html` : packs recruteurs, sponsorisation, publicite.
- `contacts.html` et `contact.html` : contact, signalement, partenariat.
- `admin.html` : admin local avec token serveur, automation, DB sync, leads,
  analytics commerciales, social queue.

Categories visibles :

- Bureau
- ONG
- Concours
- Stage
- Metiers terrain et informels
- BTP et chantier
- Technique et maintenance
- Transport et logistique
- Commerce et vente
- Finance et administration
- Sante

Les metiers informels captes incluent notamment : plombier, soudeur, macon,
menuisier, mecanicien, chauffeur, gardien, ouvrier, peintre, tailleur,
electricien, artisan et missions journalieres.

## Backend local

Serveur principal : `server.mjs`.

Les endpoints publics lisent en priorite `data/runtime/jobfaso.sqlite` quand
la base existe et que `node:sqlite` est disponible. Si SQLite est absente ou
indisponible, le serveur retombe automatiquement sur
`data/runtime/local-db.json`.

Routes utiles :

- `/api/health`
- `/api/config`
- `/api/platform`
- `/api/db/status`
- `/api/jobs`
- `/api/leads`
- `/api/events`
- `/api/admin/db/sync`
- `/api/admin/db/sqlite/sync`
- `/api/admin/jobs/moderation`
- `/api/admin/jobs/edit`
- `/api/admin/analytics/summary`
- `/api/admin/growth/visibility`
- `/api/admin/automation`
- `/api/admin/social/queue`
- `/api/admin/social/publish`

Securite deja presente :

- headers HTTP de securite ;
- CSP ;
- rate limiting ;
- verification origine sur POST ;
- token admin via `JOBFASO_ADMIN_TOKEN` ;
- analytics anonymisees par hash avec sel `JOBFASO_EVENT_SALT` ;
- runtime ignore par Git ;
- pas de secrets commites.

## Donnees et base locale

Fichiers de donnees :

- `data/sources.json` : registre des sources surveillees.
- `data/raw-items.json` : resultats bruts de collecte.
- `data/curated-jobs.json` : offres nettoyees et publiees localement.
- `data/rate-card.json` : offres commerciales.
- `data/runtime/local-db.json` : cache applicatif local genere hors Git.
- `data/runtime/jobfaso.sqlite` : vraie base SQLite locale generee hors Git.

Commande :

```bash
npm run db:sync
```

Base SQLite locale :

```bash
npm run db:sqlite
```

L'admin peut aussi lancer `/api/admin/db/sqlite/sync` via le bouton
`Synchroniser SQLite`. Le statut `/api/db/status` expose la taille et la date
de mise a jour de `data/runtime/jobfaso.sqlite`, ainsi que le stockage primaire
utilise par l'API (`sqlite` ou `json`).

Moderation SQLite :

- `POST /api/admin/jobs/moderation` avec `jobId`, `status` et `note`.
- Statuts acceptes : `needs_review`, `validated`, `rejected`.
- Les decisions sont stockees dans `moderation_overrides`, preservees quand
  `npm run db:sqlite` reconstruit la base.
- Les offres `rejected` sont exclues de `/api/jobs` par defaut, sauf avec
  `includeRejected=true`.

Edition persistante SQLite :

- `POST /api/admin/jobs/edit` avec `jobId` et les champs corriges.
- Champs principaux : `title`, `company`, `city`, `category`, `type`,
  `openingDate`, `closingDate`, `sourceName`, `sourceUrl`, `tags`.
- Les corrections sont stockees dans `job_edit_overrides`, preservees quand
  `npm run db:sqlite` reconstruit la base.
- Les corrections humaines sont fusionnees avant la moderation, puis exposees
  par `/api/jobs` et `/api/platform`.

Export PostgreSQL/Supabase :

```bash
npm run db:export
```

Cette commande genere `database/seed.sql` depuis les JSON locaux. Appliquer
d'abord `database/schema.sql`, puis `database/seed.sql`.

Etat verifie :

- 20 offres publiques ;
- 38 sources configurees ;
- 394 items bruts ;
- 47 pages SEO exportables ;
- base SQLite locale regenerable ;
- categories exposees via `/api/platform`.

## Scraping et sources

Scripts :

- `scripts/jobfaso-scraper.mjs`
- `scripts/curate-raw-items.mjs`
- `scripts/run-automation.mjs`

Pipeline :

```bash
npm run automate
```

Mode automatique continu :

```bash
npm run automate:daemon
```

Variables utiles :

- `JOBFASO_AUTOMATION_INTERVAL_MINUTES=360` : intervalle entre deux runs.
- `JOBFASO_AUTOMATION_RUN_ON_START=false` : demarrer le daemon sans run immediat.
- `JOBFASO_AUTOMATION_MAX_AGE_HOURS=30` : seuil healthcheck.

Healthcheck :

```bash
npm run automate:health
```

Rapport sans relancer toute la collecte :

```bash
npm run automate:report
```

Quality gate sans relancer toute la collecte :

```bash
npm run automate:quality
```

File de revue des dates :

```bash
npm run dates:queue
```

Le daemon ecrit son etat dans `data/runtime/automation-state.json` :
`status`, `lastSuccessAt`, `lastError`, `durationMs`, `nextRunAt`,
`latestSteps`. Le fichier est visible dans l'admin via
`/api/admin/automation/status`.

Le rapport consolide dans `data/runtime/automation-report.json` et
`docs/AUTOMATION_REPORT.md` : totaux, erreurs scraper, offres sans date de
cloture, deadlines proches, categories, villes, sources et taille du seed SQL.

Le quality gate consolide dans `data/runtime/automation-quality.json` et
`docs/AUTOMATION_QUALITY.md` : seuil minimum de sources/offres/items, coherence
sitemap/pages, seed SQL, diversite des sources/categories et dates de cloture.
En mode strict, une erreur critique fait echouer le pipeline.

La file de revue des dates consolide dans `data/runtime/date-review-queue.json`
et `docs/DATE_REVIEW_QUEUE.md` les offres dont la date de cloture est absente
ou incoherente. Elle est affichee dans l'admin pour accelerer la moderation.

Depuis `admin.html`, le bouton `Corriger` de la file dates appelle
`/api/admin/jobs/date-override`. La correction :

- valide une date `YYYY-MM-DD` ;
- met a jour `data/curated-jobs.json` ;
- conserve une trace dans `data/runtime/date-overrides.json` ;
- regenere pages SEO, metas statiques, file dates, quality gate, rapport,
  seed PostgreSQL et DB locale.

Etapes :

1. collecte des sources ;
2. curation, dedoublonnage, filtrage Burkina ;
3. categorisation professionnelle ;
4. generation SEO ;
5. injection SEO pages statiques ;
6. generation assets croissance ;
7. generation moteur visibilite, AdSense readiness, backlinks et prospection ;
8. export PostgreSQL `database/seed.sql` ;
9. synchronisation cache JSON local ;
10. synchronisation SQLite locale ;
11. preparation posts reseaux sociaux.

Principes :

- respecter `robots.txt` ;
- ne pas scraper agressivement les plateformes fermees ;
- marquer Facebook, LinkedIn posts, WhatsApp/Telegram en `manual_only` sauf API
  ou partenariat autorise ;
- conserver un statut `needs_review` tant qu'une offre n'est pas validee ;
- ne pas inventer les dates de cloture.

## SEO et indexation

Scripts :

- `scripts/generate-seo-pages.mjs`
- `scripts/enhance-static-seo.mjs`
- `scripts/submit-indexnow.mjs`

Commande complete :

```bash
npm run growth
```

Moteur de visibilite seul :

```bash
npm run visibility
```

Cette commande genere :

- `data/growth/visibility-report.json` : score SEO/AdSense/monetisation ;
- `data/growth/outreach-targets.json` : cibles backlinks, sources,
  recruteurs, formations et sponsors ;
- `data/growth/outreach-templates.json` : scripts de prospection ;
- `docs/VISIBILITY_ENGINE.md` : rapport lisible et plan d'action.

L'admin affiche ces donnees via `/api/admin/growth/visibility` et permet une
regeneration manuelle avec le token serveur.

Fichiers generes :

- `sitemap.xml`
- `robots.txt`
- `llms.txt`
- `site.webmanifest`
- `indexnow-urls.txt`
- `assets/jobfaso-og.svg`

SEO deja applique :

- canonical ;
- meta robots ;
- Open Graph ;
- Twitter cards ;
- JSON-LD `Organization`, `WebSite`, `CollectionPage`, `Article`,
  `JobPosting` ;
- `hreflang="fr-BF"` et `x-default` ;
- sitemap avec `lastmod`, `changefreq`, `priority` ;
- fichiers servis avec bons types MIME par `server.mjs`.

Apres deploiement :

1. ajouter le domaine a Google Search Console ;
2. ajouter le domaine a Bing Webmaster Tools ;
3. soumettre `https://jobfaso.com/sitemap.xml` ;
4. configurer IndexNow si disponible :

```powershell
$env:INDEXNOW_KEY="cle-indexnow"
npm run seo:indexnow
```

## Monetisation

Canaux prevus :

- Google AdSense ;
- emplacements sponsorises natifs ;
- packs recruteurs ;
- diffusion WhatsApp ;
- leads formation/CV/coaching ;
- rapports marche ;
- file de posts sociaux automatisee.
- moteur visibilite/backlinks/prospection automatise.

Scripts sociaux :

- `scripts/generate-social-queue.mjs`
- `scripts/publish-social.mjs`

Le mode live depend des variables :

- `FACEBOOK_PAGE_ID`
- `FACEBOOK_PAGE_ACCESS_TOKEN`
- `SOCIAL_WEBHOOK_URL`
- `SOCIAL_PUBLISH_LIVE`

## Commandes de verification

```bash
npm run check
npm run db:sync
npm run db:sqlite
npm run growth
npm start
npm run automate:health
```

URLs locales :

- `http://127.0.0.1:8088/`
- `http://127.0.0.1:8088/jobs/`
- `http://127.0.0.1:8088/api/health`
- `http://127.0.0.1:8088/api/platform`
- `http://127.0.0.1:8088/api/db/status`
- `http://127.0.0.1:8088/sitemap.xml`
- `http://127.0.0.1:8088/robots.txt`
- `http://127.0.0.1:8088/llms.txt`

## Prochaines etapes propres

1. Ajouter comptes recruteurs/admin avec sessions securisees.
2. Brancher WhatsApp Business et paiements mobile money.
3. Ajouter validation automatique de liens morts et dates expirees.
4. Migrer vers PostgreSQL/Supabase avec `database/schema.sql`.
5. Appliquer `database/seed.sql` pour initialiser sources, raw items, jobs et
   pages SEO.
6. Brancher Search Console/Bing apres deploiement.
