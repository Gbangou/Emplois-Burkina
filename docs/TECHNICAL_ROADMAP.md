# Roadmap technique senior

## Phase 0 - Prototype statique

Etat actuel :

- site HTML/CSS/JS ;
- collecteur Node generique ;
- sources JSON ;
- docs business et conformite ;
- schema SQL.

Objectif : valider le positionnement et vendre les premiers sponsors.

## Phase 1 - Web app

Stack :

- Next.js ;
- TypeScript ;
- Supabase/PostgreSQL ;
- Vercel ou serveur VPS ;
- domaine propre ;
- analytics respectueux.

Fonctions :

- offres dynamiques ;
- pages detail ;
- inscription WhatsApp ;
- formulaire recruteur ;
- pages SEO ;
- admin moderation.

## Phase 2 - Pipeline collecte

Stack :

- Node workers ;
- n8n pour orchestration ;
- cron toutes les 2 a 6 heures ;
- adaptateurs par source ;
- stockage raw_items ;
- logs.

Fonctions :

- collecte autorisee ;
- dedoublonnage ;
- extraction source par source ;
- statut `needs_review`.

## Phase 3 - IA

Fonctions :

- classification ;
- resume court ;
- extraction ville/deadline/salaire ;
- score anti-arnaque ;
- suggestion de tags ;
- generation CV et lettre.

Regle :

- l'IA assiste, mais ne publie pas seule les offres inconnues.

## Phase 4 - Monetisation

Fonctions :

- AdSense ;
- emplacements sponsors ;
- rate card admin ;
- factures simples ;
- suivi paiement ;
- rapports sponsor.

## Phase 5 - Marketplace

Fonctions :

- profils artisans ;
- verification ;
- demandes client ;
- commission mission ;
- avis moderes ;
- disponibilite.
