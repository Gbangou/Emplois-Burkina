# SEO, Social et Monetisation - Mise en ligne propre JobFaso

## Objectif

Faire de JobFaso une plateforme :

- bien indexable sur Google, Bing et les moteurs IA ;
- facile a partager sur Facebook, LinkedIn, WhatsApp et outils d'automation ;
- monetisable proprement sans nuire a la confiance des candidats.

## Ce qui est deja en place dans le code

- sitemap XML ;
- robots.txt ;
- pages SEO par offre, ville, categorie et mots-cles utiles ;
- balises canonical, Open Graph, Twitter Cards, hreflang ;
- JSON-LD `WebSite`, `CollectionPage`, `Article`, `JobPosting` ;
- `SearchAction` sur la page d'accueil ;
- `ads.txt` genere automatiquement si `adsenseClient` est renseigne ;
- `feed.xml` et `feed.json` pour syndication et automation ;
- `.well-known/security.txt` pour la confiance technique ;
- file d'attente sociale avec messages par canal et URLs UTM ;
- publication Facebook ou webhook d'automatisation.

## Variables a configurer avant production

### SEO / site

```env
JOBFASO_BASE_URL=https://jobfaso.com
NODE_ENV=production
```

### Social automation

```env
FACEBOOK_PAGE_ID=
FACEBOOK_PAGE_ACCESS_TOKEN=
SOCIAL_WEBHOOK_URL=
SOCIAL_PUBLISH_LIVE=false
SOCIAL_AUTOPUBLISH=false
```

### WhatsApp Business

```env
WHATSAPP_PHONE_NUMBER_ID=
WHATSAPP_ACCESS_TOKEN=
```

## Comptes et plateformes a ouvrir

1. Google Search Console
2. Bing Webmaster Tools
3. Google AdSense
4. Meta Business Manager
5. Facebook Page JobFaso
6. WhatsApp Business
7. LinkedIn Page JobFaso

## Ce qu'il faut faire juste apres le deploiement

1. Deployer le site sur le vrai domaine.
2. Verifier que ces URLs repondent :
   - `/`
   - `/sitemap.xml`
   - `/robots.txt`
   - `/ads.txt`
   - `/feed.xml`
   - `/feed.json`
   - `/.well-known/security.txt`
3. Soumettre le sitemap dans Search Console et Bing Webmaster Tools.
4. Creer la page Facebook et renseigner les URLs sociales dans
   `data/site-config.json`.
5. Lancer la generation sociale :

```bash
npm run social:queue
npm run social:dry
```

6. Quand les tokens sont prets :

```bash
npm run social:publish
```

## Renseigner les liens sociaux dans la config

Dans `data/site-config.json` :

```json
{
  "social": {
    "facebook": "https://www.facebook.com/jobfaso",
    "linkedin": "https://www.linkedin.com/company/jobfaso",
    "whatsappChannel": "https://whatsapp.com/channel/..."
  }
}
```

Cela alimente les balises schema `sameAs` et renforce la coherence de marque.

## Monetisation : realite business

Il faut separer clairement deux choses :

- `Google Ads` et `Facebook Ads` : ce sont surtout des canaux d'acquisition
  payants. Vous depensez pour attirer du trafic.
- `AdSense`, sponsors, packs recruteurs, native ads, leads partenaires :
  ce sont des canaux de revenus.

Donc pour JobFaso, le plan le plus sain est :

1. Sponsors et packs recruteurs
2. Mises en avant marquees
3. Partenariats formation / coaching / RH
4. AdSense apres validation du site et trafic stable

## Recommandation Burkina Faso

Pour ne pas dependre trop tot d'un seul reseau publicitaire :

- lancer d'abord les revenus directs en FCFA ;
- garder AdSense comme couche complementaire ;
- utiliser Facebook Ads / Google Ads seulement pour amplifier des pages qui
  convertissent deja.

## Publication sociale automatique recommande

Cadence de depart :

- matin : 1 offre chaude ;
- midi : 1 offre secteur terrain / informel ;
- soir : 1 recap ONG / ONU / consultance ou 1 guide candidat.

## Garde-fous importants

- ne jamais promettre "argent garanti" avec Google/Meta ;
- ne jamais acheter de faux clics ni de faux visiteurs ;
- marquer clairement les offres sponsorisees ;
- conserver la source officielle de chaque offre ;
- demander le consentement avant diffusion WhatsApp ou relance marketing.

## Commandes utiles

```bash
npm run growth
npm run visibility
npm run social:queue
npm run social:dry
npm run automate:daemon
```

## Niveau de readiness

Le code peut etre prepare tres serieusement, mais la vraie performance SEO et
revenu dependra ensuite de :

- volume d'offres reelles ;
- regularite de publication ;
- backlinks propres ;
- verification Search Console ;
- configuration reelle Google/Meta/WhatsApp ;
- qualite du trafic recurent.
