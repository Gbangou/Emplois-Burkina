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
- base locale fonctionnelle en developpement, puis migration PostgreSQL/Supabase.

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
  social queue.

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

Routes utiles :

- `/api/health`
- `/api/config`
- `/api/platform`
- `/api/db/status`
- `/api/jobs`
- `/api/leads`
- `/api/admin/db/sync`
- `/api/admin/automation`
- `/api/admin/social/queue`
- `/api/admin/social/publish`

Securite deja presente :

- headers HTTP de securite ;
- CSP ;
- rate limiting ;
- verification origine sur POST ;
- token admin via `JOBFASO_ADMIN_TOKEN` ;
- runtime ignore par Git ;
- pas de secrets commites.

## Donnees et base locale

Fichiers de donnees :

- `data/sources.json` : registre des sources surveillees.
- `data/raw-items.json` : resultats bruts de collecte.
- `data/curated-jobs.json` : offres nettoyees et publiees localement.
- `data/rate-card.json` : offres commerciales.
- `data/runtime/local-db.json` : base locale generee hors Git.

Commande :

```bash
npm run db:sync
```

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

Etapes :

1. collecte des sources ;
2. curation, dedoublonnage, filtrage Burkina ;
3. categorisation professionnelle ;
4. generation SEO ;
5. injection SEO pages statiques ;
6. generation assets croissance ;
7. preparation posts reseaux sociaux.

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
npm run growth
npm start
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

1. Migrer vers PostgreSQL/Supabase avec `database/schema.sql`.
2. Appliquer `database/seed.sql` pour initialiser sources, raw items, jobs et
   pages SEO.
3. Ajouter interface de moderation persistante.
4. Ajouter comptes recruteurs.
5. Ajouter paiements mobile money.
6. Ajouter tracking clics/vues/conversions.
7. Ajouter validation automatique de liens morts et dates expirees.
8. Brancher Search Console/Bing apres deploiement.
