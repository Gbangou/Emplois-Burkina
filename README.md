# Emplois Burkina

Web app locale de Emplois Burkina : portail emploi, concours, metiers terrain,
automation de collecte, moderation SQLite, SEO, analytics et monetisation
recruteurs/sponsors.

## Ouvrir le projet

Ouvrir `index.html` dans un navigateur.

Mode dynamique recommande :

```bash
npm start
```

Puis ouvrir `http://127.0.0.1:8088`. Configure `EMPLOIS_BURKINA_ADMIN_TOKEN`
en production pour activer l'admin serveur.

Synchroniser la base locale runtime :

```bash
npm run db:sync
npm run db:sqlite
```

Le serveur reconstruit aussi cette base automatiquement au premier appel API.
Pour verifier l'etat cote backend :

```bash
curl http://127.0.0.1:8088/api/health
curl http://127.0.0.1:8088/api/db/status
curl http://127.0.0.1:8088/api/platform
```

`/api/db/status` indique aussi si l'API lit en priorite `sqlite` ou `json`.

## Ce que l'app contient

- Recherche d'opportunites par mot-cle et ville.
- Categories : bureau, ONG, concours, stages, metiers terrain.
- Formulaire d'inscription aux alertes WhatsApp.
- Formulaire pour publier une offre ou un profil professionnel.
- Proposition premium simple pour commencer a vendre.
- Documentation produit, architecture, monetisation et politique de collecte.
- Script de collecte extensible : `scripts/emplois-burkina-scraper.mjs`.
- Schema PostgreSQL de depart : `database/schema.sql`.
- Base SQLite locale : `data/runtime/emplois-burkina.sqlite` generee hors Git.
- Pages publiques pretes pour confiance et monetisation :
  `annonceurs.html`, `privacy.html`, `terms.html`, `contact.html`.
- Mini back-office local pour le pre-lancement : `admin.html`.
- API dynamique : `/api/jobs`, `/api/platform`, `/api/db/status`.
- Base locale runtime : `data/runtime/local-db.json` et `data/runtime/emplois-burkina.sqlite` generees hors Git.

## Vision concrete

Emplois Burkina commence comme un site web mobile-first, pas comme une application
mobile native. WhatsApp sert de canal d'acquisition et de vente. L'application
mobile vient plus tard, quand le produit a deja une audience et du revenu.

Flux cible :

```text
Sources web autorisees
-> collecte/scraping propre
-> nettoyage et classification IA
-> moderation humaine
-> publication site
-> alertes WhatsApp premium
-> paiements mobile money
```

## Tester le collecteur

Le collecteur utilise uniquement Node.js natif.

```bash
node scripts/emplois-burkina-scraper.mjs
```

Il lit `data/sources.json` et ecrit les resultats dans `data/raw-items.json`.
Certaines sources peuvent bloquer ou limiter la collecte : c'est normal et il
faut respecter leurs conditions.

Puis transformer les elements bruts en offres candidates :

```bash
node scripts/curate-raw-items.mjs
```

Ce script ecrit `data/curated-jobs.json`. Ces offres restent a moderer avant
publication.

Pipeline complet pre-lancement :

```bash
node scripts/run-automation.mjs
```

Ce script collecte, nettoie, genere les pages SEO dans `pages/`, puis met a jour
`sitemap.xml` et `robots.txt`.

Mode automatique continu :

```bash
npm run automate:daemon
```

Healthcheck :

```bash
npm run automate:health
```

Rapport automation :

```bash
npm run automate:report
```

Quality gate :

```bash
npm run automate:quality
```

File de revue des dates :

```bash
npm run dates:queue
```

Variables utiles :

```bash
EMPLOIS_BURKINA_AUTOMATION_INTERVAL_MINUTES=360
EMPLOIS_BURKINA_AUTOMATION_RUN_ON_START=false
EMPLOIS_BURKINA_AUTOMATION_MAX_AGE_HOURS=30
```

Variables utiles pour la collecte :

```bash
EMPLOIS_BURKINA_CRAWLER_AGENT="Emplois BurkinaBot/0.1 (+contact: contact@emplois-burkina.com)"
EMPLOIS_BURKINA_DETAIL_LIMIT=18
EMPLOIS_BURKINA_REQUEST_DELAY_MS=350
```

Les sources qui bloquent la collecte ou imposent des limites sont conservees
dans le journal de pipeline. Le site publie uniquement les donnees obtenues
proprement et affiche les dates de cloture quand elles sont disponibles.

## Categorisation et metiers informels

La curation classe les offres par domaines : bureau, ONG, concours, stage,
BTP, technique, logistique, commerce, finance/admin, sante et
`Metiers terrain et informels`. Cette derniere categorie capte notamment les
plombiers, soudeurs, macons, menuisiers, mecaniciens, chauffeurs, gardiens,
ouvriers, peintres, tailleurs et autres missions locales.

Les reseaux sociaux et groupes communautaires sont integres comme sources de
veille `manual_only` : Facebook, LinkedIn posts, WhatsApp/Telegram et groupes
artisans doivent passer par API autorisee, partenariat, formulaire de
soumission ou validation admin avant publication.

## SEO et indexation

Generer toutes les pages SEO, metas sociales, sitemap, robots, manifest,
`llms.txt` et liste IndexNow :

```bash
npm run growth
```

Autopilote revenu :

```bash
npm run revenue:autopilot
```

Ce rapport genere `data/growth/revenue-autopilot.json` et
`docs/REVENUE_AUTOPILOT.md` pour prioriser les canaux a vendre, les sponsors,
les offres recruteurs, les services candidats et les rapports marche.

Fichiers publics importants :

- `sitemap.xml` pour Google, Bing, Yandex et autres moteurs.
- `robots.txt` avec lien sitemap et blocage des zones admin/API.
- `llms.txt` pour les crawlers IA.
- `site.webmanifest` pour l'identite web app.
- `indexnow-urls.txt` pour la soumission rapide des URLs.

Apres deploiement, ajoute le domaine dans Google Search Console et Bing
Webmaster Tools, puis soumets `https://emplois-burkina.com/sitemap.xml`.

Pour IndexNow :

```bash
$env:INDEXNOW_KEY="cle-indexnow-fournie-par-le-moteur"
npm run seo:indexnow
```

Le script cree `indexnow-key.txt` localement et soumet les URLs de
`indexnow-urls.txt`. La cle reste ignoree par Git.

## Prochaines etapes recommandees

1. Ajouter une page admin de detail offre avec edition persistante SQLite.
2. Ajouter comptes recruteurs/admin avec sessions securisees.
3. Brancher WhatsApp Business et paiements mobile money.
4. Ajouter validation automatique de liens morts et dates expirees.
5. Preparer migration PostgreSQL/Supabase pour le deploiement cloud.

## Documents importants

- `docs/PROJECT_STATUS_AND_OPERATIONS.md`
- `docs/PLAN.md`
- `docs/MASTER_PROMPT.md`
- `docs/LAUNCH_PLAN.md`
- `docs/AI_MARKETING_AUTOMATION.md`
- `docs/ARCHITECTURE.md`
- `docs/SCRAPING_POLICY.md`
- `docs/MONETISATION.md`
- `docs/ADSENSE_CHECKLIST.md`
- `docs/SPONSOR_KIT.md`
- `docs/SEO_CONTENT_PLAN.md`
- `docs/IMPLEMENTATION_STEPS.md`
- `docs/EXTRAORDINARY_PRODUCT_BLUEPRINT.md`
- `docs/REVENUE_AUTOPILOT.md`

## Pre-lancement commercial

1. Ouvrir `index.html` avec un petit serveur local.
2. Tester les formulaires alertes, publication et annonceurs.
3. Ouvrir `admin.html` pour voir les leads captures.
4. Exporter les leads CSV et suivre les prospects dans Google Sheets ou Excel.

## Securite dynamique

- Headers HTTP de securite dans `server.mjs`.
- Content Security Policy.
- Protection anti-framing.
- Limite de taille des payloads.
- Rate limiting par IP.
- Verification d'origine sur les POST.
- Admin API protegee par `EMPLOIS_BURKINA_ADMIN_TOKEN`.
- Donnees runtime ignorees par Git : `data/runtime/`.
- Aucun secret ne doit etre commite.
