# Marketing IA et automatisation Emplois Burkina

Objectif : rendre Emplois Burkina visible, utile et monetisable avec un minimum de
travail manuel apres la mise en ligne.

## Ce qui peut etre automatise

- Collecte des sources autorisees.
- Curation stricte des offres candidates.
- Generation de pages SEO : offres, categories, villes et guides.
- Generation du sitemap.
- Publication planifiee via cron, GitHub Actions, n8n ou serveur VPS.
- Creation de brouillons WhatsApp, Facebook, LinkedIn et email.
- Rapports sponsors : vues, clics, leads, meilleures categories.
- Relances commerciales semi-automatiques pour recruteurs et sponsors.

## Ce qui doit rester controle

- Validation des sources sensibles.
- Verification des offres suspectes.
- Approbation des messages sponsorises.
- Transmission de contacts candidats.
- Paiements et factures tant que le systeme mobile money n'est pas branche.

## Pipeline quotidien recommande

Frequence : 2 a 4 fois par jour.

1. `node scripts/run-automation.mjs`
2. Verifier les offres `needs_review` dans `admin.html`.
3. Publier ou deployer les fichiers generes.
4. Soumettre les URLs importantes a Google Search Console.
5. Envoyer un digest WhatsApp par segment.
6. Generer un mini rapport commercial.

## SEO automatise

Pages generees :

- `pages/jobs/*.html`
- `pages/categories/*.html`
- `pages/villes/*.html`
- `pages/guides/*.html`
- `sitemap.xml`
- `robots.txt`

Regles :

- Chaque fiche offre cite la source officielle.
- Les longues descriptions ne sont pas copiees.
- Les pages emplois utilisent JSON-LD `JobPosting`.
- Les pages guides ajoutent du contenu original.
- Les pages categories/villes regroupent les opportunites recentes.

Apres mise en ligne :

- Ajouter le domaine dans Google Search Console.
- Soumettre `sitemap.xml`.
- Tester quelques fiches avec Rich Results Test.
- Utiliser l'Indexing API pour les URLs d'offres si l'architecture backend le
  permet.

## AdSense et publicite directe

Ordre recommande :

1. Lancer avec publicite directe et sponsors.
2. Ajouter AdSense quand le site a assez de contenu original.
3. Garder plus de contenu utile que de publicites.
4. Ne jamais encourager les clics.
5. Marquer les blocs sponsorises.

Emplacements :

- Home sous les offres.
- Pages categories.
- Pages villes.
- Fiches offres en colonne laterale.
- Guides candidats.
- Digest WhatsApp sponsorise.

## Offres commerciales a automatiser

### Sponsor categorie

Client : centre de formation, fintech, telecom, ecole, cabinet RH.

Automatisation :

- formulaire annonceurs ;
- lead local puis CRM ;
- facture ;
- activation du bloc sponsor ;
- rapport fin de mois.

### Annonce mise en avant

Client : recruteur, PME, ONG, cabinet.

Automatisation :

- formulaire publication ;
- paiement ;
- badge mise en avant ;
- diffusion WhatsApp ;
- rapport clics.

### Pack CV

Client : candidat.

Automatisation :

- formulaire commande ;
- paiement ;
- generation brouillon IA ;
- validation humaine optionnelle ;
- livraison PDF/email/WhatsApp.

### Rapport data

Client : ONG, institution, ecole, cabinet RH.

Automatisation :

- aggregation anonymisee ;
- graphiques par categorie, ville, source ;
- PDF mensuel ;
- envoi commercial.

## Prompts IA utiles

### Digest WhatsApp quotidien

Tu es redacteur Emplois Burkina. A partir de cette liste d'offres validees, cree un
message WhatsApp court en francais simple. Regroupe par categorie, ajoute les
deadlines quand disponibles, garde un ton utile et ne promets jamais un emploi.
Ajoute un appel a s'inscrire aux alertes.

### Post LinkedIn/Facebook

Tu es community manager Emplois Burkina. Cree un post court pour annoncer les nouvelles
opportunites du jour au Burkina Faso. Mentionne les categories, invite les
recruteurs a publier leurs offres, et ajoute un appel a rejoindre les alertes
WhatsApp.

### Relance sponsor

Tu es commercial Emplois Burkina. Redige une relance professionnelle pour une
organisation qui n'a pas encore repondu. Objectif : vendre un sponsor categorie
ou une annonce mise en avant. Message court, concret, avec prix et benefice.

### Rapport sponsor

Tu es analyste marketing Emplois Burkina. A partir des vues, clics et leads, redige un
rapport clair pour un sponsor : resultats, interpretation, recommandations et
prochaine action commerciale.

## Architecture cible apres le domaine

Phase 1 : statique automatise

- cron ou GitHub Actions ;
- fichiers JSON ;
- pages HTML generees ;
- deploiement automatique ;
- Search Console + sitemap.

Phase 2 : Supabase

- formulaires en base ;
- admin securise ;
- moderation ;
- sponsors dynamiques ;
- analytics evenements ;
- exports commerciaux.

Phase 3 : IA + n8n

- workflow collecte ;
- enrichissement IA ;
- generation posts ;
- emails et WhatsApp ;
- rapports sponsors ;
- relances commerciales.

## Limite importante

L'automatisation ne doit pas publier aveuglement des offres inconnues. Pour
gagner de l'argent regulierement, Emplois Burkina doit proteger la confiance : meilleur
filtrage, sources autorisees, moderation et retrait rapide si une source demande
correction.
