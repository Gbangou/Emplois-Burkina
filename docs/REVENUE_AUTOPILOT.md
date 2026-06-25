# Autopilote revenu Emplois Burkina

Derniere generation : 2026-06-25T13:45:01.554Z

## Reponse courte

Oui, une base de donnees est necessaire pour une app permanente, rentable et
quasi autonome. Le bon choix est une base managee PostgreSQL, pas une base a
administrer manuellement. Les fichiers JSON/SQLite restent utiles en local, mais
la production doit stocker durablement offres, leads, alertes, paiements,
partenaires, logs d'envoi et historiques de moderation.

## Objectif zero interaction

- Automatisation toutes les 30 a 60 minutes en production.
- Base PostgreSQL managee pour conserver offres, leads, paiements et logs.
- Alertes healthcheck si aucun run reussi dans la fenetre attendue.
- Moderation humaine seulement pour les offres a risque ou les partenaires payants.
- Rapport revenu genere a chaque run pour guider prospection, sponsors et contenus.

## Score revenu

- Score preparation : 90/100
- Offres actives : 58
- Offres fiables : 15
- Objectif mensuel : 1 000 000 FCFA
- Revenu mensuel initial estime : 398 200 FCFA
- Ecart a combler : 601 800 FCFA

## Canaux a activer

| Canal | Offre | Clients | Objectif | Prix | Conversion | Action suivante |
| --- | --- | --- | ---: | ---: | ---: | --- |
| Annonces recruteurs premium | Publication + mise en avant + diffusion WhatsApp/Facebook + rapport simple | Entreprises, ONG, cabinets RH, PME locales | 12 | 25 000 FCFA | 35% | Prospecter 30 recruteurs lies a Bureau et Burkina Faso. |
| Sponsoring categorie | Sponsor mensuel de la categorie Bureau | Centres de formation, fintech, telecoms, ecoles professionnelles | 4 | 100 000 FCFA | 25% | Envoyer 20 propositions sponsor avec preuve trafic/offres et placement clair. |
| Digest WhatsApp sponsorise | Sponsor discret du digest hebdomadaire d'offres | Formations, banques, telecoms, assurance, mobile money | 4 | 50 000 FCFA | 30% | Preparer un kit sponsor WhatsApp avec limites de frequence et mention sponsorisee. |
| Services candidats optionnels | CV ATS, lettre, traduction FR/EN, preparation entretien | Candidats actifs, jeunes diplomes, profils ONG/tech | 120 | 2 000 FCFA | 18% | Ajouter CTA service CV sur fiches offres fortes et guides candidats. |
| Rapports marche agreges | Rapport mensuel secteurs, villes, sources, competences et tendances | Ecoles, ONG, cabinets RH, investisseurs, institutions | 3 | 150 000 FCFA | 20% | Generer un exemple PDF/HTML de rapport marche avec donnees non personnelles. |
| Partenariats sources et backlinks | Flux propre, attribution, backlink, page partenaire | Sites RH, medias, institutions, ecoles, cabinets | 10 | 0 FCFA | 40% | Demander flux RSS/API ou autorisation explicite aux sources prioritaires. |

## Segments chauds

Categories :
- Bureau : 21
- ONG : 12
- Finance et administration : 5
- Informatique, data et systemes : 4
- Metiers terrain et informels : 4

Villes :
- Burkina Faso : 27
- Ouagadougou : 18
- RDC : 4
- Senegal : 3
- Bagassi : 1

Sources :
- Emploiburkina : 20
- UN Talent Burkina Faso : 16
- HumanitaireHub : 10
- BFemploi : 6
- LeFaso.net Recrutement : 3
- UNjobs Burkina Faso : 3

## Integrations indispensables

- PostgreSQL manage Supabase ou Neon
- WhatsApp Business Cloud API
- Paiement Mobile Money via aggregateur local/regional
- AdSense apres validation Google
- Email transactionnel pour factures et relances
- Analytics produit et erreurs

## Priorite maintenant

1. Mettre PostgreSQL manage en production.
2. Garder le daemon automation actif toutes les 30 a 60 minutes.
3. Brancher WhatsApp Business et opt-in/desinscription.
4. Vendre manuellement les 3 premiers sponsors avant d'attendre AdSense.
5. Ajouter paiement Mobile Money pour offres sponsorisees.
