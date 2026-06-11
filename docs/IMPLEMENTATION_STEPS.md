# Procedure d'implementation

## Maintenant

1. Garder le site statique comme prototype commercial.
2. Alimenter `data/sources.json` avec les sources prioritaires.
3. Lancer `node scripts/jobfaso-scraper.mjs` une fois par jour.
4. Lancer `node scripts/curate-raw-items.mjs`.
5. Examiner `data/curated-jobs.json`.
6. Copier uniquement les offres propres dans le site ou une base.

## Version web application

1. Creer une app Next.js.
2. Ajouter Supabase/PostgreSQL.
3. Importer `database/schema.sql`.
4. Connecter les formulaires a l'API.
5. Ajouter une page admin :
   - offres brutes ;
   - validation ;
   - rejet ;
   - edition ;
   - publication.
6. Ajouter une page publique par offre.
7. Ajouter un systeme de recherche serveur.

## Automatisation

1. Planifier le collecteur toutes les 2 a 6 heures.
2. Inserer les nouveaux `raw_items`.
3. Curater en `curated_jobs`.
4. Appeler l'IA pour normaliser les donnees.
5. Mettre les offres en `needs_review`.
6. Envoyer les alertes seulement apres validation.

## WhatsApp

1. Demarrer avec un canal WhatsApp public.
2. Creer un groupe VIP premium.
3. Plus tard, brancher WhatsApp Business Platform.
4. Utiliser des templates approuves pour les alertes.

## Paiements

1. Demarrer avec preuve de paiement manuelle.
2. Ajouter un tableau admin pour suivre sponsors, recruteurs et services optionnels.
3. Brancher un agregateur mobile money.
4. Automatiser l'activation apres paiement confirme.

## Publicite et sponsors

1. Ajouter mentions legales, confidentialite et page contact.
2. Publier du contenu original : guides metiers, conseils candidature, pages ville.
3. Demander AdSense quand le site est propre et a du contenu suffisant.
4. Ajouter les emplacements publicitaires sans nuire a la lecture.
5. Creer un kit sponsor :
   - audience ;
   - formats ;
   - tarifs ;
   - exemples de campagnes ;
   - contact commercial.
6. Vendre directement aux ecoles, formations, recruteurs, fintech et telecoms.
7. Marquer tous les contenus sponsorises.

## Scraping source par source

Chaque site doit avoir un adaptateur dedie quand le volume augmente.

Exemple :

- `bfemploi`: parser les pages `annonce-details-*`.
- `travail-burkina`: ignorer les categories, parser les articles.
- `rmo`: parser les cartes d'offres.
- `concours`: privilegier les pages officielles et les communiques.

Le collecteur actuel est volontairement generique. Il sert a prouver le flux,
puis les adaptateurs ameliorent la precision.
