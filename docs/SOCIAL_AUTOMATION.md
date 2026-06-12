# Automatisation reseaux sociaux JobFaso

## Objectif

Publier regulierement les offres JobFaso vers une page Facebook ou un outil
d'automatisation, sans faire payer les chercheurs d'emploi et sans exposer les
secrets dans le code.

## Flux recommande

1. `npm run automate` collecte, nettoie, regenere les pages SEO et prepare les assets.
2. `npm run social:queue` cree `data/social/queue.json` avec les offres a publier.
3. `npm run social:dry` teste les posts sans publier.
4. `npm run social:publish` publie uniquement si les variables d'environnement sont configurees.

## Variables d'environnement

```env
JOBFASO_BASE_URL=https://jobfaso.com
FACEBOOK_PAGE_ID=
FACEBOOK_PAGE_ACCESS_TOKEN=
SOCIAL_WEBHOOK_URL=
SOCIAL_PUBLISH_LIVE=false
SOCIAL_PUBLISH_LIMIT=3
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

## Securite

- Les fichiers `data/social/*.json` ne sont pas servis publiquement par `server.mjs`.
- La publication en direct demande `SOCIAL_PUBLISH_LIVE=true` ou `--live`.
- L'admin serveur doit rester protege par `JOBFASO_ADMIN_TOKEN`.
- Garder une frequence raisonnable : 1 a 3 posts par jour au lancement.
