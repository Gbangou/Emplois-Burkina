# Automatisation trafic et visibilite

Objectif : augmenter la visibilite partout ou c'est sain, gratuit et durable,
sans faux trafic, spam, incitation au clic publicitaire ou scraping abusif.

## Ce qui est deja automatise

Le projet genere deja :

- pages offres ;
- pages guides ;
- pages marches ;
- pages formations ;
- sitemap XML ;
- robots.txt ;
- feeds RSS/JSON ;
- llms.txt ;
- Open Graph ;
- social queue ;
- rapports revenus ;
- cibles backlinks et prospection ;
- rapport AdSense/contenu ;
- rapport business.

Workflows ajoutes :

- `CI` : verification et build a chaque push.
- `Content Automation` : collecte + SEO + rapports toutes les 6 heures.
- `IndexNow Submission` : soumission automatique quotidienne si `INDEXNOW_KEY`
  est configure.

## Canaux automatisables proprement

### Google

Automatisation possible :

- sitemap permanent ;
- pages indexables ;
- schema.org ;
- Search Console manuel au depart ;
- contenu evergreen regulier.

Non automatisable proprement :

- forcer Google a indexer toutes les pages ;
- simuler des recherches ou des clics ;
- generer de faux signaux.

### Bing et moteurs IndexNow

Automatisation possible :

- soumettre les URLs via IndexNow ;
- garder `robots.txt` et `sitemap.xml` propres ;
- surveiller Bing Webmaster Tools.

Le script :

```bash
INDEXNOW_KEY=cle pnpm run seo:indexnow
```

Le workflow GitHub `indexnow.yml` le fait automatiquement si le secret existe.

### WhatsApp

Automatisation prudente :

- generer les messages ;
- preparer un digest ;
- segmenter les alertes ;
- envoyer via WhatsApp Business Cloud API plus tard.

Au depart, utiliser manuel ou semi-manuel pour eviter le spam et verifier la
qualite.

### Facebook et LinkedIn

Automatisation prudente :

- generer les posts avec UTM ;
- publier manuellement au debut ;
- connecter API plus tard si les comptes sont propres et autorises.

Ne pas poster en masse dans des groupes sans contexte.

### Backlinks et partenariats

Automatisation possible :

- generer les cibles ;
- generer les emails/messages ;
- suivre les relances ;
- proposer pages partenaires.

Action humaine utile :

- envoyer les premiers messages ;
- negocier sponsors ;
- verifier les partenariats.

### AdSense

Automatisation possible :

- emplacements propres ;
- pages longues ;
- ads.txt apres approbation ;
- suivi des pages les plus rentables.

Interdit/dangereux :

- acheter du trafic douteux ;
- demander aux gens de cliquer ;
- placer des pubs comme boutons de candidature ;
- creer des pages faibles juste pour afficher des pubs.

## Plan d'automatisation recommande

### Phase 1 : lancement gratuit

- Automation toutes les 6 heures.
- IndexNow quotidien.
- Posts sociaux generes, publication manuelle.
- Search Console et Bing configures.
- Prospection sponsors semi-manuelle.

### Phase 2 : traction

Declencheur :

- 100 visiteurs/jour ;
- ou 10 leads/semaine ;
- ou premiers revenus.

Actions :

- automation toutes les 3 heures ;
- WhatsApp Business ;
- suivi conversion services ;
- rapports hebdomadaires sponsors ;
- affiliation formation/outils.

### Phase 3 : revenus

Declencheur :

- revenus superieurs a 25 USD/mois ;
- ou sponsor mensuel signe.

Actions :

- base Postgres plus complete ;
- paiement automatique ;
- relances recruteurs ;
- publication sociale API ;
- rapports marche B2B.

## Checklist visibilite

Chaque semaine :

- Search Console : pages indexees, erreurs, requetes.
- Bing : sitemap, IndexNow, URL Inspection.
- GitHub Actions : automation OK.
- Vercel : dernier deploy OK.
- Top pages : offres, guides, marches.
- Leads : recruteurs, candidats, services.
- Revenus : commandes, sponsors, affiliation.

## Commandes locales utiles

```bash
pnpm run growth
pnpm run visibility
pnpm run ads:autopilot
pnpm run revenue:autopilot
pnpm run business:roadmap
pnpm run social:queue
pnpm run seo:indexnow
```

## Regle importante

La visibilite doit venir de contenu utile, distribution propre, partenariats et
indexation technique. Les faux clics, le spam et le trafic artificiel peuvent
detruire AdSense, le SEO et la reputation du projet.
