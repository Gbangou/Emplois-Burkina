# Plan de lancement JobFaso

Objectif : mettre JobFaso en ligne rapidement, avec assez de contenu et une
offre commerciale vendable avant de construire une grosse plateforme.

## Etat actuel apres nettoyage

- Site statique mobile-first.
- Page annonceurs avec offres commerciales.
- Mini admin local : `admin.html`.
- Capture locale des leads via formulaires.
- Export CSV des leads.
- Collecteur Node simple.
- Curateur plus strict pour eviter les offres hors Burkina.
- Schema SQL pret pour Supabase/PostgreSQL.
- Master prompt produit et business.

## Delai realiste pour lancer live

### Lancement vitrine vendable : 1 a 2 jours

Ce niveau permet de partager le lien, contacter des sponsors et collecter des
demandes.

Travail restant :

- choisir domaine et hebergement ;
- remplacer les emails `.local` par les vrais contacts ;
- mettre un numero WhatsApp officiel ;
- relire confidentialite, mentions et contact ;
- ajouter 30 a 50 opportunites verifiees minimum ;
- publier sur Netlify, Vercel ou un VPS statique.

### Lancement public serieux : 5 a 7 jours

Ce niveau permet de faire une vraie campagne WhatsApp et commencer a vendre.

Travail restant :

- 100 a 300 opportunites propres ;
- 30 a 50 prospects recruteurs/sponsors ;
- page annonceurs finalisee avec WhatsApp direct ;
- premiers visuels et messages de prospection ;
- verification manuelle des sources sensibles ;
- fichier de suivi commercial ;
- plan de publication quotidien.

### Lancement avec base de donnees et admin reel : 2 a 3 semaines

Ce niveau permet de remplacer le localStorage par Supabase/PostgreSQL.

Travail restant :

- connecter les formulaires a une API ;
- migrer `database/schema.sql` ;
- creer login admin ;
- moderation en base ;
- paiements mobile money manuels puis automatises ;
- analytics et tracking ;
- premiers rapports sponsor.

## Automatisation apres domaine

Option simple VPS :

```bash
node scripts/run-automation.mjs
```

Planifier cette commande avec cron toutes les 6 heures, puis redeployer le site
statique.

Option GitHub Actions :

- executer `node scripts/run-automation.mjs` sur planning ;
- committer les fichiers `data/`, `pages/`, `sitemap.xml`, `robots.txt` ;
- deployer automatiquement vers Netlify, Vercel ou Cloudflare Pages.

Option n8n :

- cron ;
- HTTP/source checks ;
- lancer collecteur ou worker ;
- moderation ;
- generation SEO ;
- message WhatsApp ;
- rapport sponsor.

Apres chaque publication :

- soumettre le sitemap dans Google Search Console ;
- tester quelques fiches avec Rich Results Test ;
- surveiller erreurs d'indexation ;
- contacter les sponsors avec les nouvelles pages categorie/ville comme preuve
  d'inventaire publicitaire.

## Checklist avant mise en ligne

- Domaine configure.
- Email et WhatsApp officiels remplaces partout.
- `privacy.html`, `terms.html`, `contact.html` relus.
- Donnees de demo remplacees par opportunites verifiees.
- Sources sensibles marquees `manual_only`.
- Page annonceurs testee.
- `admin.html` teste en local.
- Export CSV teste.
- Liens sortants ouverts dans un nouvel onglet.
- Aucun contenu sponsorise non marque.
- Aucun acces payant aux offres essentielles.

## Plan commercial 7 jours

Jour 1 :

- mettre le site live ;
- publier 30 a 50 opportunites ;
- creer canal WhatsApp ;
- preparer message de lancement.

Jour 2 :

- contacter 10 recruteurs/cabinets RH ;
- contacter 5 centres de formation ;
- demander 3 retours utilisateurs.

Jour 3 :

- publier 20 nouvelles opportunites ;
- envoyer premier digest WhatsApp ;
- proposer pack annonce mise en avant.

Jour 4 :

- contacter 10 sponsors potentiels ;
- proposer sponsor categorie ;
- publier un post LinkedIn/Facebook.

Jour 5 :

- lancer service CV/lettre ;
- collecter les premieres commandes ;
- ameliorer les pages selon retours.

Jour 6 :

- creer premier mini rapport : categories, villes, sources ;
- l'envoyer aux prospects B2B.

Jour 7 :

- bilan : trafic, leads, ventes, objections ;
- prioriser Supabase ou vente manuelle selon traction.
