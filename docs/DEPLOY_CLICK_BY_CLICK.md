# Mise en ligne clic par clic

Ce guide est volontairement tres concret. Il part du principe que le lancement
doit couter 0 FCFA en frais mensuels au depart, hors achat eventuel d'un nom de
domaine.

Sources officielles utiles :

- GitHub repository : https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository
- Vercel Git deploy : https://vercel.com/docs/git
- Vercel variables : https://vercel.com/docs/environment-variables
- Neon connection pooling : https://neon.com/docs/connect/connection-pooling
- Google Search Console : https://support.google.com/webmasters/answer/34592
- Bing Webmaster Tools : https://www.bing.com/webmasters/help/add-and-verify-site-12184f8b
- IndexNow : https://www.indexnow.org/documentation

## 1. Creer le repo GitHub

1. Aller sur https://github.com.
2. Se connecter ou creer un compte.
3. En haut a droite, cliquer sur le bouton `+`.
4. Cliquer sur `New repository`.
5. Dans `Repository name`, mettre `emplois-burkina`.
6. Choisir `Public` si tu veux profiter au maximum des quotas gratuits GitHub
   Actions. Choisir `Private` si tu preferes garder le code cache.
7. Ne pas cocher `Add a README file`, car le projet en a deja un.
8. Cliquer sur `Create repository`.

Ensuite, dans le terminal local :

```bash
git remote add origin https://github.com/VOTRE_COMPTE/emplois-burkina.git
git branch -M main
git push -u origin main
```

Si `origin` existe deja :

```bash
git remote set-url origin https://github.com/VOTRE_COMPTE/emplois-burkina.git
git push -u origin main
```

## 2. Creer la base gratuite Neon

1. Aller sur https://neon.com.
2. Cliquer sur `Sign up`.
3. Se connecter avec GitHub ou email.
4. Cliquer sur `New Project`.
5. Nom du projet : `emplois-burkina`.
6. Region : choisir une region proche ou par defaut.
7. Cliquer sur `Create Project`.
8. Dans le dashboard du projet, cliquer sur `Connect`.
9. Activer l'option `Connection pooling` si elle est proposee.
10. Copier la connection string PostgreSQL.

La valeur ressemble a :

```bash
postgresql://user:password@host-pooler.region.aws.neon.tech/dbname?sslmode=require
```

Garder cette valeur pour `DATABASE_URL`.

## 3. Deployer sur Vercel gratuitement

1. Aller sur https://vercel.com.
2. Cliquer sur `Sign up`.
3. Se connecter avec GitHub.
4. Autoriser Vercel a acceder au repo `emplois-burkina`.
5. Dans le dashboard Vercel, cliquer sur `Add New`.
6. Cliquer sur `Project`.
7. Choisir le repo `emplois-burkina`.
8. Cliquer sur `Import`.
9. Dans `Framework Preset`, choisir `Next.js`.
10. Dans `Root Directory`, choisir `apps/web`.
11. Verifier les commandes :
    - Install Command : `pnpm install --frozen-lockfile`
    - Build Command : `pnpm --filter @emplois-burkina/web build`
12. Ouvrir `Environment Variables`.
13. Ajouter les variables minimum de la section suivante.
14. Cliquer sur `Deploy`.

## 4. Variables Vercel minimum

Dans Vercel :

1. Ouvrir le projet.
2. Cliquer sur `Settings`.
3. Cliquer sur `Environment Variables`.
4. Ajouter chaque variable.
5. Cocher `Production`, `Preview` et `Development` si Vercel le propose.
6. Cliquer sur `Save`.

Variables :

```bash
NODE_ENV=production
NEXT_PUBLIC_API_URL=https://VOTRE-URL-VERCEL/api
EMPLOIS_BURKINA_BASE_URL=https://VOTRE-URL-VERCEL
DATABASE_URL=postgresql://...
EMPLOIS_BURKINA_ADMIN_TOKEN=mettre-un-long-secret
EMPLOIS_BURKINA_EVENT_SALT=mettre-un-autre-long-secret
EMPLOIS_BURKINA_PAYMENT_MODE=manual_mobile_money
EMPLOIS_BURKINA_PAYMENT_PROVIDER=Orange Money / Moov Money
EMPLOIS_BURKINA_PAYMENT_ACCOUNT_NAME=Emplois Burkina
EMPLOIS_BURKINA_PAYMENT_NUMBER=+226XXXXXXXX
```

Optionnel au lancement :

```bash
INDEXNOW_KEY=une-cle-aleatoire-de-8-a-128-caracteres
NEXT_PUBLIC_ADSENSE_CLIENT=
ADSENSE_CLIENT=
```

Apres avoir ajoute ou modifie des variables :

1. Aller dans `Deployments`.
2. Cliquer sur les trois points du dernier deployment.
3. Cliquer sur `Redeploy`.

## 5. Activer GitHub Actions

1. Aller dans le repo GitHub.
2. Cliquer sur `Actions`.
3. Si GitHub demande confirmation, cliquer sur `I understand my workflows, go ahead and enable them`.
4. Ouvrir le workflow `CI`.
5. Cliquer sur `Run workflow` pour tester.
6. Ouvrir le workflow `Content Automation`.
7. Cliquer sur `Run workflow` pour tester une premiere automation.

Le workflow automation tourne ensuite toutes les 6 heures.

## 6. Ajouter les secrets GitHub utiles

1. Dans GitHub, ouvrir le repo.
2. Cliquer sur `Settings`.
3. Cliquer sur `Secrets and variables`.
4. Cliquer sur `Actions`.
5. Cliquer sur `New repository secret`.
6. Ajouter :

```bash
INDEXNOW_KEY=la-meme-cle-que-sur-vercel
EMPLOIS_BURKINA_BASE_URL=https://VOTRE-URL-VERCEL
```

Ces secrets permettent la soumission automatique des URLs.

## 7. Verifier le site public

Ouvrir :

```text
https://VOTRE-URL-VERCEL/
https://VOTRE-URL-VERCEL/jobs
https://VOTRE-URL-VERCEL/services
https://VOTRE-URL-VERCEL/annonceurs
https://VOTRE-URL-VERCEL/privacy
https://VOTRE-URL-VERCEL/sitemap.xml
https://VOTRE-URL-VERCEL/robots.txt
https://VOTRE-URL-VERCEL/feed.xml
https://VOTRE-URL-VERCEL/indexnow-key.txt
```

Si `/indexnow-key.txt` affiche `IndexNow key not configured`, verifier
`INDEXNOW_KEY` dans Vercel.

## 8. Google Search Console

1. Aller sur https://search.google.com/search-console.
2. Cliquer sur `Add property`.
3. Si tu as un vrai domaine, choisir `Domain`.
4. Si tu utilises seulement l'URL Vercel, choisir `URL prefix`.
5. Entrer l'URL exacte du site.
6. Suivre la verification proposee.
7. Une fois verifie, ouvrir `Sitemaps`.
8. Entrer `sitemap.xml`.
9. Cliquer sur `Submit`.

Google peut prendre plusieurs jours avant d'afficher les donnees.

## 9. Bing Webmaster Tools

1. Aller sur https://www.bing.com/webmasters.
2. Se connecter.
3. Si Google Search Console est deja configure, choisir `Import from Google Search Console`.
4. Sinon, cliquer sur `Add a site`.
5. Entrer l'URL du site.
6. Suivre la verification.
7. Aller dans `Sitemaps`.
8. Cliquer sur `Submit sitemaps`.
9. Ajouter `https://VOTRE-URL/sitemap.xml`.

Bing recommande IndexNow pour notifier automatiquement les URLs.

## 10. Premier lancement public

Le jour ou le site est en ligne :

1. Publier le lien sur ton statut WhatsApp.
2. Publier dans 5 groupes Facebook emploi Burkina.
3. Publier sur LinkedIn.
4. Envoyer le lien a 10 recruteurs ou cabinets RH.
5. Envoyer le lien a 5 centres de formation.
6. Proposer le pack sponsor beta a prix simple.

Message court :

```text
Bonjour, je lance Emplois Burkina, un site gratuit pour retrouver offres,
concours, stages et opportunites au Burkina Faso.

Lien : https://VOTRE-URL

Les recruteurs peuvent publier ou sponsoriser une offre.
Les candidats peuvent aussi demander un CV ATS ou une lettre.
```

## 11. Apres lancement

Chaque semaine :

1. Verifier que GitHub Actions passe.
2. Verifier Search Console.
3. Verifier Bing Webmaster Tools.
4. Ajouter ou ameliorer un guide SEO.
5. Contacter 20 prospects sponsors/recruteurs.
6. Suivre les demandes via `/operations` avec le token admin.

Le but n'est pas de toucher a la technique tous les jours, mais de garder la
machine visible, fiable et commercialisable.
