# Feuille de route developpement Emplois Burkina

Genere le : 2026-06-23

## Vision produit

Emplois Burkina doit devenir un moteur emploi fiable pour le Burkina Faso : offres locales,
concours, ONG, missions terrain, stages, teletravail et opportunites
internationales utiles. La promesse n'est pas seulement d'avoir une belle page :
la valeur doit venir de sources citees, dates visibles, liens reels, moderation,
alertes WhatsApp et recherche simple.

## Benchmarks a retenir

Les meilleurs sites inspirent des blocs differents :

- Indeed : recherche rapide, filtres lisibles, volume d'offres, pages SEO.
- LinkedIn Jobs : profil candidat, candidature rapide, signal professionnel.
- Boss Zhipin : contact direct recruteur-candidat et conversation rapide.
- FlexJobs : confiance, verification, tri des opportunites remote.
- ZipRecruiter : matching et distribution intelligente des offres.
- Glassdoor : contexte employeur, salaire, reputation et decision mieux informee.

Pour le Burkina Faso, Emplois Burkina doit combiner ces idees avec des usages locaux :
WhatsApp, Mobile Money, concours publics, ONG, petits metiers, villes claires et
sources officielles.

## Regles non negociables

1. Une offre publique doit avoir un lien source reel.
2. Une offre expiree ne doit pas rester dans la liste publique active.
3. Une offre sans date de cloture doit etre marquee "a verifier" et envoyee en
   file de revue.
4. Les informations doivent citer la source, la date de collecte et le niveau de
   confiance.
5. Les donnees scrapees ne doivent pas etre publiees automatiquement sans filtre
   de qualite.
6. Le design doit rester elegant, mais la lisibilite et la confiance passent
   avant l'effet visuel.

## Phases de developpement

### Phase 1 - Qualite des offres

Objectif : rendre le catalogue fiable avant d'ajouter plus d'effets visuels.

- Calculer pour chaque offre : expiration, date manquante, incoherence,
  confiance source, lien source, priorite de revue.
- Produire un rapport machine dans `data/runtime/offer-quality-report.json`.
- Produire un rapport humain dans `docs/OFFER_VERIFICATION_AUDIT.md`.
- Masquer les offres expirees dans les APIs publiques.
- Afficher les offres douteuses dans le back-office.

### Phase 2 - Scraping serieux et diversifie

Objectif : alimenter Emplois Burkina avec des sources utiles et stables.

- Separar collecte brute, curation et publication.
- Prioriser sources Burkina Faso, ONG, concours, institutions, remote tech et
  opportunites regionales.
- Respecter robots.txt, flux RSS, sitemaps et conditions des sites.
- Ajouter un historique d'erreurs par source.
- Dedoublonner avec empreinte stable.

### Phase 3 - Recherche et matching

Objectif : permettre au candidat de trouver vite.

- Recherche titre, metier, ville, source, categorie.
- Filtres deadline, teletravail, ONG, concours, informel, stage.
- Score de pertinence explique.
- Tri par urgence, confiance et fraicheur.

### Phase 4 - Frontend elegant et fonctionnel

Objectif : avoir une experience inspiree des meilleurs sites sans sacrifier le
serieux.

- Animation douce des sections du bas vers le haut.
- Images en bandes ou collages qui passent sous les textes au scroll.
- Cartes d'offres compactes, lisibles et sans surcharge.
- Mobile-first, rapide, accessible.
- Aucun texte superpose de facon illisible.

### Phase 5 - Back-office de moderation

Objectif : controler la qualite avant publication.

- File "dates a verifier".
- File "sources a probleme".
- Correction date ouverture/cloture.
- Validation, rejet, note moderateur.
- Tableau de bord sources, fraicheur, erreurs et couverture.

### Phase 6 - WhatsApp, profils et revenus

Objectif : convertir l'audience en usage regulier et revenus.

- Alertes WhatsApp par ville/metier.
- Formulaire recruteur simple.
- Annonces sponsorisees clairement identifiees.
- Paiement Mobile Money.
- CV, lettre et aide candidature assistees par IA.

## Suite immediate

La prochaine etape prioritaire est la Phase 1 : renforcer le systeme de qualite
des offres. Tant que les dates, sources et expirations ne sont pas solides, une
nouvelle couche visuelle risque seulement de cacher un probleme de fond.
