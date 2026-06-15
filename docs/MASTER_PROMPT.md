# Master prompt JobFaso

Ce document sert de prompt maitre pour relancer le developpement de JobFaso avec
une vision claire : construire un media emploi rentable au Burkina Faso, base sur
des donnees propres, une distribution WhatsApp forte et des offres commerciales
vendables des le lancement.

## Prompt maitre a donner a Codex

Tu es mon CTO, product strategist et growth engineer pour JobFaso.

Contexte produit :

- JobFaso est un site web mobile-first pour centraliser les emplois, concours,
  stages, missions locales et profils de metiers terrain au Burkina Faso.
- JobFaso doit se comporter comme un vrai portail emploi moderne inspire des
  meilleurs sites africains : moteur de recherche central, offres recentes,
  entreprises qui recrutent, emploi par metier, emploi par region, CVtheque,
  pages recruteurs, conseils candidats, carrousels dynamiques et emplacements
  sponsorises.
- Le produit doit rester gratuit pour consulter les informations essentielles :
  titre, recruteur, ville, deadline, lien source officiel et resume utile.
- Le revenu doit venir des recruteurs, sponsors, services optionnels, formations
  partenaires, profils verifies, publicite directe, AdSense et rapports agreges.
- WhatsApp est le canal principal d'acquisition, d'alerte, de vente et de
  relation client. L'application mobile native vient plus tard.
- La confiance est l'actif principal : sources citees, moderation humaine,
  anti-arnaque, transparence des contenus sponsorises, respect des robots.txt et
  conditions des sites.

Mission :

Construis JobFaso comme une plateforme professionnelle capable de generer du
revenu rapidement, sans attendre une grosse application. A chaque decision,
priorise ce qui peut apporter de l'argent, de la confiance ou de la distribution
dans les 30 prochains jours.

Direction UX actuelle :

- Accueil type portail emploi : topbar candidat/recruteur, hero de recherche,
  carrousel des sources/entreprises, carrousel des offres a la une, blocs
  metiers, regions, dernieres offres, CVtheque illustrative et espace sponsor.
- Listing offres : filtres rapides, sidebar de recherche, cards avec source,
  ouverture, cloture, countdown, ville et lien source officiel.
- Fiche offre : fil d'Ariane, date d'ouverture, date de cloture, countdown,
  extrait court, checklist candidature, offres similaires et rail sponsorise.
- Admin : pipeline collecte, moderation, leads, reseaux sociaux, exports et
  etat des sources.
- Etat actuel : backend Node securise, SQLite locale prioritaire pour les
  lectures API, fallback JSON, moderation persistante, analytics anonymisees,
  moteur visibility/backlinks, SEO statique et automation runnable en local.

Contraintes :

- Ne pas copier massivement le contenu des sites tiers.
- Preferer les sources officielles, RSS, sitemaps, APIs publiques, pages
  carrieres autorisees et partenariats.
- Toujours garder un lien source visible.
- Publier seulement apres moderation humaine quand la source est nouvelle ou
  risquee.
- Ne jamais vendre de donnees personnelles sans consentement explicite.
- Marquer clairement les contenus sponsorises.
- Concevoir le systeme pour le Burkina Faso d'abord, puis l'UEMOA ensuite.

Inspiration technique :

- Crawl4AI : produire du Markdown propre, LLM-ready, avec controle fin,
  sessions, cache, hooks et extraction structuree.
- Firecrawl : offrir plus tard une API simple de scrape/crawl/search pour les
  donnees emploi propres.
- Scrapy : penser le collecteur en spiders/adaptateurs robustes, pipelines de
  nettoyage, dedoublonnage et logs.
- Crawlee : gerer les files d'URLs, retries, proxy-ready, stockage de datasets,
  execution planifiee et crawlers HTTP ou navigateur selon le besoin.
- Playwright : traiter les sources dynamiques, tester les parcours critiques,
  capturer screenshots/traces quand une source casse.
- ScrapeGraphAI : utiliser l'IA pour extraire du JSON selon schema, classifier,
  resumer, detecter les deadlines et scorer les risques.
- Browser Use : ajouter des agents navigateur uniquement pour les workflows
  legitimes et controles, pas pour contourner les protections.
- Katana : decouvrir proprement des URLs utiles avec scope, profondeur,
  exclusions et respect des limites.
- Maxun : viser une experience no-code/admin ou l'operateur peut creer une
  "source robot", enregistrer une extraction, planifier une collecte et exporter
  vers API, CSV, Google Sheets ou Airtable.

Objectif business :

Lancer avec une offre vendable en moins de 14 jours :

- 100 a 300 opportunites propres et moderees.
- Un canal WhatsApp ou liste de diffusion active.
- Une page annonceurs claire.
- Un kit sponsor avec prix simples.
- Un formulaire recruteur.
- Une offre "Annonce mise en avant" a 25 000 FCFA.
- Une offre "Sponsor categorie" a 100 000 FCFA/mois.
- Un service "CV + lettre" a 2 000 ou 3 000 FCFA.
- Une offre "Profil artisan verifie" a 1 500 FCFA/mois.

Quand tu travailles sur le code :

- Inspecte le depot avant d'editer.
- Respecte les fichiers existants : HTML/CSS/JS statique, docs, scripts Node,
  schema SQL et donnees JSON.
- Si tu ajoutes une fonctionnalite, relie-la a un revenu, une confiance ou une
  acquisition mesurable.
- Si tu ajoutes du scraping, ajoute aussi conformite, logs, dedoublonnage,
  statut de moderation et source originale.
- Si tu proposes une architecture, donne aussi le plan MVP concret.
- Si tu proposes une monetisation, donne le prix, le client cible, le script de
  vente et le livrable.

Definition de succes :

- Un visiteur comprend en moins de 10 secondes que JobFaso aide a trouver un
  emploi, un concours, une mission ou un professionnel local.
- Un recruteur peut demander une publication payante facilement.
- Un sponsor peut comprendre les formats et prix.
- Un moderateur peut verifier les offres avant diffusion.
- Le collecteur peut produire des opportunites candidates sans violer les regles.
- Les premiers revenus peuvent venir de ventes directes avant meme AdSense.

## Vision produit

JobFaso ne doit pas etre seulement un agregateur d'offres. Le produit doit
devenir un systeme d'acquisition d'opportunites et de mise en relation :

- Pour les candidats : offres fiables, alertes rapides, aide CV, lettres,
  preparation concours et entretiens.
- Pour les recruteurs : diffusion ciblee, publication assistee, preselection,
  shortlists et visibilite WhatsApp.
- Pour les sponsors : audience locale orientee emploi, formation, jeunesse,
  finance, telecom, concours et metiers.
- Pour les artisans : profil verifie, visibilite locale, demandes clients et
  badge de confiance.
- Pour les institutions : tendances anonymisees sur les metiers, villes,
  competences et secteurs qui recrutent.

La promesse courte :

> JobFaso aide les Burkinabe a trouver des revenus et aide les organisations a
> toucher les bons profils.

## Positionnement rentable

Le meilleur angle n'est pas "un autre site d'emploi". Le meilleur angle est :

1. Media emploi local avec alertes WhatsApp.
2. Source de confiance contre les fausses offres.
3. Canal de distribution recruteur.
4. Marketplace de competences terrain.
5. Intelligence de donnees emploi Burkina.

Cela permet de gagner de l'argent avec une audience encore petite, parce que les
clients B2B paient pour de la visibilite qualifiee et des candidats interesses.

## Architecture cible inspiree des meilleurs crawlers

### 1. Source registry

Un registre de sources versionne dans `data/sources.json` puis en base :

- `id`, `name`, `url`, `type`, `priority`
- `collection`: `manual_only`, `official_link`, `review_required`,
  `partner_api`, `rss`, `sitemap`, `playwright`
- `allowedPaths`, `blockedPaths`, `includeKeywords`, `excludeKeywords`
- `robotsStatus`, `termsStatus`, `lastCheckedAt`
- `ownerContact`, `partnershipStatus`

### 2. Crawl planner

Un planificateur qui choisit la bonne strategie :

- HTTP simple pour pages statiques.
- RSS/sitemap quand disponible.
- Playwright pour pages dynamiques autorisees.
- Surveillance manuelle pour LinkedIn, Facebook, aggregateurs sensibles et sites
  avec login.
- API officielle ou partenariat quand c'est possible.

### 3. Fetch layer

Comportement attendu :

- user-agent clair avec contact.
- rate limit par domaine.
- cache pour eviter les requetes inutiles.
- retries avec backoff.
- timeout strict.
- logs par source.
- capture HTML brut limitee et horodatee.

### 4. Extraction layer

Ordre de preference :

1. JSON-LD `JobPosting`.
2. RSS ou sitemap.
3. Selecteurs CSS par source.
4. Extraction heuristique de liens.
5. Extraction IA vers schema JSON si autorisee et utile.

Schema minimal d'une opportunite candidate :

```json
{
  "title": "",
  "company": "",
  "city": "",
  "category": "",
  "type": "",
  "salary": "",
  "deadline": "",
  "sourceName": "",
  "sourceUrl": "",
  "canonicalUrl": "",
  "excerpt": "",
  "riskScore": 0,
  "confidenceScore": 0,
  "status": "needs_review"
}
```

### 5. Normalization and deduplication

Le systeme doit calculer :

- empreinte forte : `title + company + city + deadline + canonicalUrl`
- empreinte souple : similarite titre, meme entreprise, meme deadline
- detection de reposts
- versioning des changements importants

### 6. AI enrichment

L'IA ne publie pas seule. Elle assiste :

- classification : Bureau, ONG, Concours, Stage, Metier terrain, Formation
- extraction ville, deadline, salaire, niveau, diplome, contrat
- resume court en francais simple
- tags utiles
- detection arnaque : frais, urgence excessive, email suspect, salaire irrealiste
- score de confiance
- generation de messages WhatsApp courts

### 7. Human review

Back-office minimal :

- file `needs_review`
- fiche source + lien original
- boutons : Valider, Rejeter, Doublon, A verifier, Sponsorise
- champs editables
- historique moderation
- raison de rejet
- implementation actuelle : `moderation_overrides` dans SQLite, statuts
  `needs_review`, `validated`, `rejected`, exclusion publique des offres
  rejetees et conservation des decisions apres regeneration SQLite.
- edition actuelle : `job_edit_overrides` conserve les corrections humaines
  sur titre, entreprise, ville, categorie, type, dates, source et tags.

### 8. Publishing and distribution

Sorties :

- site web
- pages SEO par categorie, ville et source
- alerte WhatsApp par segment
- email digest
- post Facebook/LinkedIn
- flux JSON/API plus tard
- export CSV pour partenaires

### 9. Monetization layer

Tables ou collections a prevoir :

- `sponsors`
- `campaigns`
- `ad_slots`
- `employer_orders`
- `cv_orders`
- `trade_profiles`
- `payments`
- `invoices`
- `lead_events`
- `whatsapp_broadcasts`

Deja en place :

- `rate_cards`
- `leads`
- `page_events`
- analytics anonymisees via `/api/events`
- moteur visibilite via `npm run visibility`
- rapport backlinks/prospection dans `docs/VISIBILITY_ENGINE.md`

## Propositions monetisables prioritaires

### Pack 0 : inventaire media et publicite

Client : annonceur local, centre de formation, banque, telecom, cabinet RH,
assurance, fintech, ecole, outil candidat.

Prix indicatifs : 50 000 a 250 000 FCFA/mois selon l'emplacement.

Livrable :

- emplacement homepage ou categorie
- rail sponsorise sur fiches offres
- carrousel partenaire
- lien tracke UTM
- rapport clics/leads
- compatibilite Google AdSense quand le trafic le permet

Regle : les publicites directes et sponsors doivent etre vendus avant de
dependre fortement d'AdSense.

### Pack 1 : annonce recruteur assistee

Client : PME, ONG, cabinet RH, commerce, ecole, projet.

Prix de lancement : 10 000 FCFA standard, 25 000 FCFA mise en avant.

Livrable :

- correction et mise en forme de l'annonce
- publication site
- badge "mise en avant" si payant
- diffusion WhatsApp
- mini rapport : vues, clics, contacts

Script commercial :

> Bonjour, JobFaso diffuse les offres d'emploi et concours aux candidats au
> Burkina. Pour 25 000 FCFA, on met votre offre en avant et on la diffuse sur
> notre canal WhatsApp cible. Vous recevez un lien propre a partager et un mini
> rapport de visibilite.

### Pack 2 : sponsor categorie

Client : centre de formation, fintech, telecom, ecole, auto-ecole, cabinet RH.

Prix : 100 000 FCFA/mois au lancement.

Livrable :

- logo dans une categorie
- mention sponsorisee claire
- 4 placements WhatsApp dans le mois
- lien tracking
- rapport fin de mois

Categories vendables :

- Concours
- ONG
- Stages et jeunes diplomes
- Metiers terrain
- Formations
- IT et digital

### Pack 3 : service CV et lettre

Client : candidat.

Prix : 2 000 a 3 000 FCFA pour IA assistee, 5 000 a 15 000 FCFA avec humain.

Livrable :

- CV corrige
- lettre adaptee a une offre
- checklist candidature
- version PDF

Important : garder les offres gratuites pour ne pas casser la confiance.

### Pack 4 : profil artisan verifie

Client : macon, electricien, plombier, chauffeur, frigoriste, mecanicien,
technicien solaire, vigile, nounou.

Prix : 1 500 FCFA/mois, 500 FCFA boost 24h, commission si mission facilitee.

Livrable :

- profil public
- badge verifie
- ville et disponibilite
- photos facultatives
- numero WhatsApp protege par consentement

### Pack 5 : shortlist recruteur

Client : recruteur qui veut gagner du temps.

Prix : 25 000 a 100 000 FCFA selon volume.

Livrable :

- formulaire candidat
- tri par criteres
- 5 a 20 profils qualifies
- export CSV
- consentement candidat

### Pack 6 : rapport tendances emploi

Client : ONG, ecole, institution, cabinet RH.

Prix : 50 000 a 250 000 FCFA par rapport mensuel.

Livrable :

- secteurs qui recrutent
- villes actives
- competences demandees
- categories en hausse
- donnees anonymisees uniquement

## Backlog 30 jours

### Semaine 1 : vendre avant de construire trop gros

- Finaliser page annonceurs avec tarifs simples.
- Ajouter bouton WhatsApp commercial visible.
- Preparer un PDF ou HTML "Kit sponsor".
- Remplir 100 opportunites propres avec moderation manuelle.
- Creer une liste de 50 prospects sponsors/recruteurs.
- Contacter 10 prospects par jour.
- Objectif : 1 a 3 ventes manuelles.

### Semaine 2 : fiabiliser l'offre

- Ajouter statut de moderation visible en admin.
- Ajouter formulaire recruteur plus complet.
- Ajouter export CSV des demandes recruteurs.
- Ajouter tracking simple des clics sortants.
- Ajouter pages SEO : concours, ONG, stages, metiers terrain, Ouagadougou,
  Bobo-Dioulasso.
- Objectif : 300 offres/concours propres et 500 inscrits WhatsApp.

### Semaine 3 : automatiser sans perdre la qualite

- Consolider SQLite puis migrer vers Supabase/PostgreSQL quand le deploiement
  cloud est pret.
- Garder `raw_items`, `jobs`, `sources`, leads, events et moderation alignes
  entre SQLite, seed PostgreSQL et JSON de secours.
- Etendre le back-office moderation avec edition detaillee.
- Ajouter collecteur planifie par source.
- Ajouter logs, dedoublonnage, risk score et confidence score.
- Objectif : 80% du travail de collecte assiste, 100% publication moderee.

### Semaine 4 : monetisation mesurable

- Creer emplacements sponsors dans le site.
- Ajouter campagne sponsor avec date debut/fin.
- Ajouter facture simple.
- Ajouter paiement mobile money manuel puis automatisable.
- Ajouter rapport sponsor PDF/HTML.
- Lancer 3 offres commerciales : recruteur, sponsor categorie, CV.
- Objectif : 100 000 a 500 000 FCFA encaisses ou signes.

## Priorites techniques immediates

1. Ajouter comptes recruteurs/admin et sessions securisees.
2. Ajouter paiement mobile money manuel puis automatisable.
3. Ajouter validation automatique de liens morts et dates expirees.
4. Ajouter segments WhatsApp : concours, ONG, stages, terrain, IT, finance.
5. Ajouter anti-arnaque plus fin : emails suspects, frais, doublons, vieux posts.
6. Ajouter exports commerciaux : CSV prospects, CSV candidats, rapport sponsor.
7. Ajouter tests Playwright des parcours critiques.
8. Brancher Search Console/Bing apres deploiement.
9. Preparer migration PostgreSQL/Supabase depuis `database/schema.sql`.
10. Transformer l'edition rapide en page detail admin si le volume augmente.

## Sources et conformite

Regle d'or : JobFaso doit etre vu comme un partenaire, pas comme un copieur.

Pour chaque source :

- verifier robots.txt
- verifier conditions si possible
- privilegier resume court + lien officiel
- eviter les longues descriptions non autorisees
- respecter les limites techniques
- fournir contact retrait
- mettre `manual_only` pour les plateformes sensibles

Sources prioritaires :

- concours officiels
- ministeres et agences publiques
- pages carrieres d'ONG
- cabinets RH
- portails emploi locaux ouverts
- medias locaux seulement avec moderation stricte
- partenaires directs

## Experience admin ideale

L'admin JobFaso doit avoir une interface simple :

- tableau de bord revenus
- offres a moderer
- sources en erreur
- prospects recruteurs
- commandes CV
- campagnes sponsors
- inscrits WhatsApp
- profils artisans
- exports et rapports

La logique Maxun/no-code a viser : un operateur non developpeur doit pouvoir
ajouter une source, tester une extraction, voir les resultats, corriger et
planifier.

## Messages de vente prets a utiliser

### Recruteur

Bonjour, je lance JobFaso, un media d'offres d'emploi et concours au Burkina
avec diffusion WhatsApp. Nous pouvons publier et mettre en avant votre offre
pour toucher des candidats actifs. Le pack de lancement est a 25 000 FCFA avec
publication, diffusion WhatsApp et mini rapport de visibilite.

### Sponsor formation

Bonjour, JobFaso regroupe les candidats qui cherchent emploi, concours, stages
et formations utiles. Je propose de sponsoriser la categorie qui correspond a
votre audience pendant un mois : visibilite site, placements WhatsApp et lien de
suivi. Le tarif de lancement est 100 000 FCFA/mois.

### Artisan

Bonjour, JobFaso prepare aussi un annuaire de professionnels verifies :
electriciens, plombiers, chauffeurs, macons, mecaniciens et techniciens. Le
profil verifie de lancement est a 1 500 FCFA/mois pour etre visible et recevoir
des demandes locales.

## Indicateurs a suivre

Trafic :

- visiteurs
- pages vues
- recherches
- clics vers sources
- pages SEO indexees

Audience :

- inscrits WhatsApp
- segments
- taux de clic WhatsApp
- demandes candidats

Confiance :

- offres validees
- offres rejetees
- doublons
- signalements
- sources fiables

Revenu :

- sponsors signes
- annonces payantes
- commandes CV
- profils verifies
- revenus par canal
- panier moyen

## Anti-patterns a eviter

- Faire payer l'acces aux offres essentielles.
- Copier integralement les annonces de sources tierces.
- Scraper agressivement LinkedIn, Facebook ou des sites avec login.
- Lancer trop tot une application mobile native.
- Dependre uniquement d'AdSense.
- Publier sans moderation.
- Vendre des donnees personnelles.
- Construire une plateforme complexe avant les premieres ventes.

## Phrase de direction

Construire JobFaso comme une petite machine media + data + WhatsApp : utile aux
candidats, rentable pour les recruteurs, credible pour les sponsors, propre dans
la collecte, et assez simple pour encaisser les premiers francs avant de devenir
une grande plateforme.
