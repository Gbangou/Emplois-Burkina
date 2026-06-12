# JobFaso MVP

Premiere version locale de JobFaso : une page web pour tester le concept
`emplois + concours + metiers terrain + alertes WhatsApp`.

## Ouvrir le projet

Ouvrir `index.html` dans un navigateur.

Mode dynamique recommande :

```bash
npm start
```

Puis ouvrir `http://127.0.0.1:8088`. Configure `JOBFASO_ADMIN_TOKEN`
en production pour activer l'admin serveur.

Synchroniser la base locale runtime :

```bash
npm run db:sync
```

Le serveur reconstruit aussi cette base automatiquement au premier appel API.
Pour verifier l'etat cote backend :

```bash
curl http://127.0.0.1:8088/api/health
curl http://127.0.0.1:8088/api/db/status
curl http://127.0.0.1:8088/api/platform
```

## Ce que le MVP contient

- Recherche d'opportunites par mot-cle et ville.
- Categories : bureau, ONG, concours, stages, metiers terrain.
- Formulaire d'inscription aux alertes WhatsApp.
- Formulaire pour publier une offre ou un profil professionnel.
- Proposition premium simple pour commencer a vendre.
- Documentation produit, architecture, monetisation et politique de collecte.
- Script de collecte extensible : `scripts/jobfaso-scraper.mjs`.
- Schema PostgreSQL de depart : `database/schema.sql`.
- Pages publiques pretes pour confiance et monetisation :
  `annonceurs.html`, `privacy.html`, `terms.html`, `contact.html`.
- Mini back-office local pour le pre-lancement : `admin.html`.
- API dynamique : `/api/jobs`, `/api/platform`, `/api/db/status`.
- Base locale runtime : `data/runtime/local-db.json` generee hors Git.

## Vision concrete

JobFaso commence comme un site web mobile-first, pas comme une application
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
node scripts/jobfaso-scraper.mjs
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

Variables utiles pour la collecte :

```bash
JOBFASO_CRAWLER_AGENT="JobFasoBot/0.1 (+contact: contact@jobfaso.com)"
JOBFASO_DETAIL_LIMIT=18
JOBFASO_REQUEST_DELAY_MS=350
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

## Prochaines etapes recommandees

1. Remplacer les donnees demo par une base Supabase.
2. Ajouter une interface admin pour valider les offres.
3. Brancher n8n pour collecter, nettoyer et publier les offres.
4. Ajouter OpenAI pour classer les offres et generer CV/lettres.
5. Brancher WhatsApp Business et paiements mobile money.

## Documents importants

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
- Admin API protegee par `JOBFASO_ADMIN_TOKEN`.
- Donnees runtime ignorees par Git : `data/runtime/`.
- Aucun secret ne doit etre commite.
