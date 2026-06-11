# Plan concret JobFaso

## Decision produit

JobFaso doit commencer comme un site web mobile-first, connecte a WhatsApp.
L'application mobile native arrive plus tard, quand l'audience et les revenus
justifient le cout.

Le systeme complet est donc :

1. Site web public pour consulter, chercher et indexer les offres sur Google.
2. Back-office pour valider les offres avant publication.
3. Collecteur automatique pour detecter les nouvelles opportunites.
4. IA pour nettoyer, classer, resumer et scorer les annonces.
5. WhatsApp pour envoyer les alertes, distribuer les sponsors et vendre aux recruteurs.
6. Paiement mobile money pour convertir rapidement.
7. Application mobile plus tard pour fideliser les utilisateurs actifs.

## Ce que l'utilisateur voit

- Une page d'accueil avec recherche rapide.
- Des categories : bureau, ONG, concours, stages, metiers terrain.
- Une fiche detaillee par opportunite.
- Un bouton WhatsApp pour recevoir les alertes.
- Un bouton optionnel pour generer CV et lettre avec IA.
- Une page pour les recruteurs.
- Une page pour les artisans et professionnels terrain.

## Ce qui tourne derriere

1. Le collecteur lit les sources configurees.
2. Il recupere les nouvelles pages/offres autorisees.
3. Il extrait : titre, source, ville, deadline, categorie, contact, URL.
4. Il dedoublonne avec une empreinte stable.
5. L'IA classe et resume l'offre.
6. Une file de moderation attend validation humaine.
7. Apres validation, l'offre est publiee sur le site.
8. Les abonnes WhatsApp pertinents recoivent une alerte gratuite ou sponsorisee clairement identifiee.

## Procedure etape par etape

### Etape 1 - MVP commercial

- Lancer le site web.
- Creer un canal WhatsApp "JobFaso Alertes".
- Collecter les inscriptions.
- Publier les offres manuellement ou semi-automatiquement.
- Vendre aux recruteurs, sponsors et partenaires formation.

Objectif : 500 a 2 000 contacts WhatsApp.

### Etape 2 - Collecte automatique

- Ajouter 10 a 20 sources prioritaires.
- Respecter robots.txt et les conditions de chaque site.
- Recuperer les flux RSS/sitemaps quand ils existent.
- Scraper seulement les pages autorisees.
- Stocker les annonces brutes.
- Ajouter une moderation humaine.

Objectif : 50 a 150 opportunites propres par semaine.

### Etape 3 - IA et personnalisation

- Classer automatiquement les offres.
- Detecter les doublons.
- Extraire les deadlines.
- Generer un resume simple.
- Envoyer les alertes par profil utilisateur.
- Ajouter CV IA et lettre IA.

Objectif : augmenter la valeur du premium.

### Etape 4 - Revenus publicite, recruteurs et artisans

- Vendre les annonces sponsorisees.
- Ajouter AdSense quand le site a assez de contenu original et respecte les politiques.
- Vendre la mise en avant d'artisans verifies.
- Ajouter des pages profils pour professionnels terrain.
- Ajouter des badges : verifie, disponible, recommande.

Objectif : revenus B2B et marketplace.

### Etape 5 - Scale

- Passer de Burkina a UEMOA.
- Ajouter app mobile.
- Ajouter matching candidat/offre.
- Ajouter scoring de candidats pour recruteurs.

## Priorite technique

1. Next.js ou Remix pour la vraie app web.
2. Supabase ou PostgreSQL pour les donnees.
3. n8n pour orchestration de collecte.
4. OpenAI pour classification, resume, CV et lettre.
5. WhatsApp Business Platform pour alertes.
6. Paiement mobile money via agregateur local.

## Regle importante

Ne jamais publier automatiquement une offre inconnue sans moderation. Le vrai
avantage concurrentiel de JobFaso sera la confiance : offres propres, sources
citees, arnaques filtrees, deadlines claires.
