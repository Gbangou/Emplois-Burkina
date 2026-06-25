# Automatisation reseaux sociaux Emplois Burkina

## Objectif

Publier regulierement les offres Emplois Burkina vers une page Facebook ou un outil
d'automatisation, sans faire payer les chercheurs d'emploi et sans exposer les
secrets dans le code.

## Flux recommande

1. `npm run automate` collecte, nettoie, regenere les pages SEO et prepare les assets.
2. `npm run social:queue` cree `data/social/queue.json` avec les offres a publier.
3. `npm run social:dry` teste les posts sans publier.
4. `npm run social:publish` publie uniquement si les variables d'environnement sont configurees.

## Variables d'environnement

```env
EMPLOIS_BURKINA_BASE_URL=https://emplois-burkina.com
FACEBOOK_PAGE_ID=
FACEBOOK_PAGE_ACCESS_TOKEN=
SOCIAL_WEBHOOK_URL=
SOCIAL_PUBLISH_LIVE=false
SOCIAL_PUBLISH_LIMIT=3
SOCIAL_AUTOPUBLISH=false
WHATSAPP_PHONE_NUMBER_ID=
WHATSAPP_ACCESS_TOKEN=
```

## Facebook

Pour publier sur une page Facebook, il faut une app Meta, un Page Access Token
et les permissions Pages necessaires. La publication se fait via l'endpoint
Graph API de la page. Ne stocke jamais le token dans GitHub.

Sources officielles :

- https://developers.facebook.com/docs/pages-api/posts/
- https://developers.facebook.com/docs/permissions/reference/pages_manage_posts/
- https://developers.facebook.com/docs/graph-api/reference/page/feed/

## Webhook

`SOCIAL_WEBHOOK_URL` permet d'envoyer les posts vers Make, Zapier, n8n, Buffer,
Publer ou un autre outil. C'est souvent plus simple pour publier aussi vers
LinkedIn, Telegram, WhatsApp Channel ou X selon les autorisations de chaque
plateforme.

Le payload webhook contient maintenant :

- `item.shareUrls` avec URLs tracees `utm_source`
- `item.channels.facebook`
- `item.channels.linkedin`
- `item.channels.whatsapp`
- `platformPayloads` prets a router vers vos outils d'automatisation

## Publication automatique

Si vous voulez publier automatiquement apres chaque run d'automation :

```env
SOCIAL_AUTOPUBLISH=true
SOCIAL_PUBLISH_LIVE=true
```

Puis lancer le daemon :

```bash
npm run automate:daemon
```

## WhatsApp

Important : WhatsApp n'offre pas un mode universel "poster partout" comme une
page Facebook. En pratique :

- pour des messages 1:1 ou listes de diffusion conformes, passer par WhatsApp
  Business Platform ;
- pour un canal ou une communaute, utiliser un outil tiers/automation autorise
  ou une action humaine assistee ;
- pour le partage simple, Emplois Burkina prepare deja les textes et URLs tracees.

Source officielle utile :

- https://business.whatsapp.com/developers/developer-hub

## Reseaux a privilegier au lancement

1. Facebook Page
2. WhatsApp Business / canal
3. LinkedIn Page
4. Groupes partenaires et medias emploi

Commencer par 1 a 3 publications par jour, avec :

- 1 nouvelle offre chaude ;
- 1 recap secteur ou ville ;
- 1 guide utile candidat.

## Securite

- Les fichiers `data/social/*.json` ne sont pas servis publiquement par `server.mjs`.
- La publication en direct demande `SOCIAL_PUBLISH_LIVE=true` ou `--live`.
- L'admin serveur doit rester protege par `EMPLOIS_BURKINA_ADMIN_TOKEN`.
- Garder une frequence raisonnable : 1 a 3 posts par jour au lancement.
