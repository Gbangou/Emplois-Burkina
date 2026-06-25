# Architecture cible

## Orientation moderne

Depuis le 24 juin 2026, la cible technique de Emplois Burkina est un monorepo
Next.js + NestJS :

- `apps/web` : nouvelle web app Next.js, React et TypeScript.
- `apps/api` : nouvelle API NestJS modulaire.
- `packages/domain` : types et logique metier partages.
- racine historique : app HTML/CSS/JS/Node conservee comme legacy pendant la
  migration.

Le detail de la migration est documente dans
`docs/MODERNIZATION_NEXT_NEST.md`.

## Vue d'ensemble

```text
Sources web autorisees
  -> Collecteur
  -> Donnees brutes
  -> Nettoyage + dedoublonnage
  -> IA classification/resume
  -> Moderation humaine
  -> Publication site
  -> Alertes WhatsApp/email
  -> Paiement premium
```

## Modules produit professionnels

Le fichier `data/product-modules.json` est la source de pilotage des modules.
Le backend expose cette feuille de route via `/api/product/modules` et le
back-office l'affiche pour suivre les priorites.

### 1. Catalogue offres

Responsable de publier uniquement les offres actives, avec lien source reel,
date de cloture exploitable, statut d'expiration et niveau de confiance.

Etat actuel :

- API `/api/jobs` ;
- filtrage expiration et date de cloture ;
- audit `scripts/audit-offers.mjs` ;
- rapport `docs/OFFER_VERIFICATION_AUDIT.md`.

### 2. Collecte et scraping

Responsable de lire les sources, collecter les items bruts, dedoublonner,
enrichir les dates/villes/categories, puis separer le brut des offres
publiables.

Etat actuel :

- `scripts/emplois-burkina-scraper.mjs` ;
- `scripts/international-feeds-scraper.mjs` ;
- `scripts/curate-raw-items.mjs` ;
- `data/raw-items.json` et `data/curated-jobs.json`.

### 3. Back-office moderation

Responsable de valider, rejeter, corriger les offres, suivre les dates
manquantes et afficher les scores qualite.

Etat actuel :

- `admin.html` ;
- routes `/api/admin/jobs/*` ;
- file `docs/DATE_REVIEW_QUEUE.md`.

### 4. Recherche et matching

Responsable de la recherche par metier, ville, categorie et source, puis du tri
par pertinence, urgence et confiance.

Etat actuel :

- score de pertinence cote client ;
- tri `Pertinence` dans le catalogue ;
- raisons de matching visibles sur les cartes et dans la fiche detail ;
- synonymes metiers locaux dans `app.js`.

Prochaine etape : deplacer l'index dans une couche persistante pour ponderer
les champs, auditer les synonymes et stabiliser le ranking entre sessions.

### 5. Alertes WhatsApp

Responsable des abonnements par ville/metier, alertes gratuites ou sponsorisees,
journal d'envoi et desinscription claire.

Etat actuel :

- formulaire alerte candidat ;
- creation d'alerte depuis la recherche courante ;
- criteres de recherche conserves dans les leads ;
- segments persistants dans `data/runtime/alert-segments.json` ;
- suivi admin des segments candidats ;
- synchronisation serveur via `/api/leads` quand le serveur dynamique est actif.

Prochaine etape : opt-in clair, templates WhatsApp Business et journal d'envoi.

### 6. Espace recruteur

Responsable de la soumission d'annonce, verification recruteur, sponsorisation,
paiement Mobile Money et suivi des leads.

### 7. Profil candidat

Responsable des favoris, preferences, CV, documents et historique de
candidatures.

### 8. Assistance IA

Responsable de l'aide CV, lettres, analyse ATS, recommandations formation et
garde-fous contre les inventions.

### 9. Analytics et qualite

Responsable des KPI offres, sources, leads, revenus, audits liens, audits projet,
audits automation et audits offres.

## Modules techniques existants

### Web app

Responsable de :

- afficher les offres ;
- capturer les inscriptions WhatsApp ;
- recevoir les publications recruteurs ;
- afficher les profils metiers terrain ;
- vendre le premium.

Stack recommandee : Next.js, TypeScript, Tailwind ou CSS modules.

### API

Responsable de :

- gerer offres, utilisateurs, alertes, paiements ;
- recevoir les donnees du collecteur ;
- exposer le back-office ;
- appeler l'IA.

Stack recommandee : Next.js API routes au debut, puis NestJS si le backend
devient plus gros.

### Base de donnees

PostgreSQL via Supabase ou Neon.

Tables minimales :

- `sources`
- `raw_items`
- `jobs`
- `subscribers`
- `employers`
- `trade_profiles`
- `payments`
- `alerts`
- `moderation_events`

### Collecteur

Responsable de :

- lire `data/sources.json` ;
- verifier si la collecte est autorisee ;
- recuperer les pages ;
- extraire les donnees ;
- produire des annonces brutes normalisees.

Au debut : script Node.
Ensuite : n8n + workers planifies.

### IA

Taches :

- classifier la categorie ;
- detecter ville et deadline ;
- extraire salaire et niveau ;
- resumer l'offre ;
- detecter les risques d'arnaque ;
- generer CV et lettre.

### WhatsApp

Deux niveaux :

1. Debut : canal WhatsApp + groupes VIP geres manuellement.
2. Scale : WhatsApp Business Platform avec templates approuves.

## Flux de donnees

1. Une source publie une annonce.
2. Le collecteur la detecte.
3. Le systeme calcule une empreinte.
4. Si l'offre existe deja, elle est ignoree ou mise a jour.
5. L'IA enrichit l'annonce.
6. Un moderateur valide.
7. L'offre devient publique.
8. Les abonnes correspondants recoivent l'alerte.

## Strategie anti-doublons

Empreinte recommandee :

```text
normalize(title + company + city + deadline)
```

Puis comparaison souple :

- titre similaire ;
- meme source ;
- meme deadline ;
- meme recruteur ;
- meme URL canonique.

## Strategie anti-arnaque

Score de risque base sur :

- frais de dossier demandes ;
- contact Gmail/Yahoo seulement ;
- salaire trop eleve sans details ;
- source inconnue ;
- absence d'entreprise ;
- urgence excessive ;
- demande d'argent avant entretien.

Les offres a risque doivent passer en validation manuelle.
