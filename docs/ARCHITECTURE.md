# Architecture cible

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

## Modules

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
