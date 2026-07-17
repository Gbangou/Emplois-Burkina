# Lancement gratuit Emplois Burkina

Objectif : mettre le site en ligne sans frais fixes, garder les mises a jour
automatiques, puis payer seulement quand le site commence a prouver sa valeur.

## Decision recommandee

Lancer maintenant en beta publique gratuite.

Ne pas attendre que tout soit parfait. Le produit doit commencer a generer :

- trafic SEO ;
- inscriptions WhatsApp ;
- demandes CV/lettre ;
- leads recruteurs ;
- preuves pour vendre sponsors et annonces premium.

## Architecture gratuite de depart

### Site web

Option simple :

- Vercel Hobby avec le projet racine du repo ;
- framework Next.js ;
- build command : `pnpm --filter @emplois-burkina/web build` ;
- output gere par Vercel automatiquement.

Alternative :

- Cloudflare Pages si le build Next est compatible avec l'adapter choisi ;
- Cloudflare Workers plus tard si besoin d'execution edge.

### Base de donnees

Recommandation : Neon Free.

Pourquoi :

- PostgreSQL gratuit pour demarrer ;
- adapte aux acces intermittents ;
- bon choix pour offres, leads, commandes, alertes et stats.

Supabase Free est aussi possible, surtout si l'auth, le dashboard et le stockage
fichiers deviennent prioritaires.

### Automation scraping et SEO

Recommandation gratuite :

- GitHub Actions ;
- workflow planifie toutes les 6 heures au depart ;
- commit automatique des fichiers publics regeneres ;
- deploiement automatique par Vercel/Cloudflare apres push.

Commencer a 6 heures evite de bruler les quotas gratuits et limite les risques
sur les sources. Passer a 1 heure seulement quand le trafic et les revenus le
justifient.

## Variables de production minimum

Configurer dans l'hebergeur web :

```bash
NODE_ENV=production
NEXT_PUBLIC_API_URL=https://votre-domaine/api
EMPLOIS_BURKINA_BASE_URL=https://votre-domaine
EMPLOIS_BURKINA_ADMIN_TOKEN=long-secret-aleatoire
EMPLOIS_BURKINA_EVENT_SALT=autre-long-secret-aleatoire
DATABASE_URL=postgresql://...
EMPLOIS_BURKINA_PAYMENT_MODE=manual_mobile_money
EMPLOIS_BURKINA_PAYMENT_PROVIDER="Orange Money / Moov Money"
EMPLOIS_BURKINA_PAYMENT_ACCOUNT_NAME="Emplois Burkina"
EMPLOIS_BURKINA_PAYMENT_NUMBER=+226...
```

Variables a ajouter plus tard :

```bash
NEXT_PUBLIC_ADSENSE_CLIENT=ca-pub-...
ADSENSE_CLIENT=ca-pub-...
PAWAPAY_API_TOKEN=...
PAWAPAY_CALLBACK_SECRET=...
WHATSAPP_PHONE_NUMBER_ID=...
WHATSAPP_ACCESS_TOKEN=...
FACEBOOK_PAGE_ID=...
FACEBOOK_PAGE_ACCESS_TOKEN=...
```

## Ordre de lancement

1. Creer un repo GitHub et pousser le code.
2. Creer une base Neon Free.
3. Copier `DATABASE_URL` dans les variables de production.
4. Deployer le site sur Vercel Hobby.
5. Ajouter les variables minimum.
6. Verifier `/`, `/jobs`, `/services`, `/annonceurs`, `/privacy`, `/contact`.
7. Activer les workflows GitHub Actions.
8. Ajouter le domaine dans Google Search Console et Bing Webmaster Tools.
9. Soumettre `sitemap.xml`.
10. Publier le lien sur WhatsApp, Facebook, LinkedIn et groupes emploi.

## Ce qui reste manuel au debut

Pour rester gratuit, certaines operations restent semi-manuelles :

- validation des offres sensibles ;
- verification des paiements Mobile Money ;
- livraison des services CV/lettre ;
- prospection sponsors et recruteurs ;
- reponse aux messages WhatsApp.

Le but est de garder ces actions courtes et rentables, pas de les supprimer trop
tot. Automatiser d'abord ce qui se repete souvent.

## Regle de depense

Ne pas payer tant que le site ne prouve pas au moins un de ces signaux :

- 100 visiteurs/jour ;
- 10 leads recruteurs/candidats ;
- 1 sponsor interesse ;
- 5 commandes de service candidat ;
- trafic SEO qui augmente chaque semaine.

Quand un de ces signaux est atteint, un budget technique de 5 a 25 USD/mois
devient acceptable si le revenu attendu est superieur.

## Revenus prioritaires sans budget

1. Services candidats : CV ATS, lettre, entretien, pack ONG.
2. Annonces recruteurs premium.
3. Sponsors categorie ou WhatsApp digest.
4. Affiliation formation/outils.
5. AdSense apres contenu et trafic.
6. Rapports marche anonymises quand l'historique devient credible.

## Rythme hebdomadaire minimal

- Lundi : verifier les offres et dates.
- Mardi : publier ou ameliorer un guide SEO.
- Mercredi : contacter recruteurs et centres de formation.
- Jeudi : partager les meilleures offres sur WhatsApp/Facebook/LinkedIn.
- Vendredi : regarder trafic, leads, commandes et erreurs automation.

Ce rythme peut prendre moins de 2 heures par semaine si les workflows tournent
correctement.
