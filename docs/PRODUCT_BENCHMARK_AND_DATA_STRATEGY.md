# Benchmark produit et strategie data

Derniere mise a jour : 24 juin 2026.

## References observees

- Indeed / ZipRecruiter : recherche simple, enorme catalogue, alertes, UX rapide.
- LinkedIn Jobs : profil, reseau, signaux candidats, relation recruteur.
- Glassdoor : confiance, transparence entreprise, avis, salaires et reputation.
- FlexJobs / Remote : remote, flexible, segmentation claire.
- HiringCafe : index direct des pages carrieres et filtres IA.
- Greenhouse / Workable / Freshteam : ATS, pipeline recruteur, automatisation et analytics.

## Ce que Emplois Burkina doit reprendre

1. Recherche d'abord : un champ central, mots simples, synonymes locaux.
2. Filtres progressifs : ville, domaine, source, urgence, remote, concours.
3. Confiance visible : source, date, score, risque, statut de verification.
4. Mobile-first : dock d'action, favoris, alertes WhatsApp, PWA.
5. Recruteur : publier, sponsoriser, suivre les leads, exporter un rapport.
6. Candidat : favoris, preferences, CV, historique, alertes.
7. Data : sources propres, dedoublonnage, moderation et audit.

## Backend cible

- API publique rapide : jobs, platform, benchmark, modules, leads.
- API admin protegee : moderation, sources, analytics, automation.
- Stockage court terme : JSON + SQLite.
- Stockage cible : PostgreSQL via Prisma.
- Workers : collecte, curation, audit liens, audit dates, social queue.
- Notifications : WhatsApp Business, email plus tard.

## Scraping responsable

Le scraping doit rester defensable :

- verifier robots.txt et conditions de la source ;
- preferer API, RSS, pages carrieres officielles et partenariats ;
- utiliser un user-agent clair ;
- appliquer des delais par source ;
- conserver l'URL source et l'attribution ;
- separer raw items, offres candidates et offres publiees ;
- rejeter ou mettre en moderation les offres douteuses ;
- supprimer/corriger une source sur demande legitime.

## Priorites design

- Interface dense mais calme, pas marketing.
- Premiere vue utile : recherche, preuves, actions.
- Cards lisibles : titre, entreprise, ville, deadline, source, score.
- Mobile : boutons tactiles, dock fixe, pas de texte coupe.
- Admin : KPI relies a une action corrective.

## Prochaine vague

1. Finaliser `/jobs` Next avec filtres client.
2. Ajouter favoris synchronises et recherches recentes.
3. Ajouter signalement public d'offre douteuse.
4. Ajouter workflow recruteur : soumission, validation, sponsorisation.
5. Brancher Prisma/PostgreSQL et seed propre.

## Cadence de benchmark

Toutes les deux semaines avant une nouvelle vague produit :

1. Revoir 3 job boards grand public : Indeed, LinkedIn Jobs, Glassdoor.
2. Revoir 2 produits specialises : FlexJobs/Remote, HiringCafe ou equivalent.
3. Revoir 2 ATS recruteurs : Greenhouse, Workable, Freshteam, Lever ou Zoho Recruit.
4. Comparer 5 criteres : recherche, confiance, mobile, recruteur, data/automation.
5. Convertir chaque observation en une action Emplois Burkina mesurable.

Chaque benchmark doit produire :

- une decision UI ;
- une decision backend/data ;
- une decision de monetisation ou retention ;
- un risque a surveiller ;
- un test ou audit a executer.
