# Workflow de mises a jour

Ce document explique comment ameliorer le site apres lancement sans manipuler
la production a la main.

## Principe

La production est reconstruite depuis GitHub.

Flux normal :

```text
modifier le code localement
-> tester
-> commit
-> push GitHub
-> build automatique
-> deploiement automatique
```

Le site public n'est pas modifie directement. Chaque changement passe par Git,
ce qui permet de revenir en arriere si une mise a jour pose probleme.

## Verification avant push

Commandes minimales :

```bash
pnpm run check:modern
pnpm run check:legacy
pnpm run build
```

Si ces commandes passent, la mise a jour est candidate au deploiement.

## Automation contenu

Le workflow GitHub Actions `automation.yml` peut :

- collecter les sources ;
- curer les offres ;
- regenerer les pages SEO ;
- mettre a jour sitemap, feeds, rapports et social queue ;
- committer les fichiers modifies.

La cadence recommandee au lancement est toutes les 6 heures. C'est assez frais
pour un portail emploi, sans devenir agressif pour les sources ni gaspiller les
quotas gratuits.

## Mise a jour urgente

Pour une correction urgente :

1. Corriger localement.
2. Lancer `pnpm run check:modern`.
3. Lancer `pnpm run build`.
4. Commit + push.
5. Verifier le deploiement.

## Rollback

Si une version publiee pose probleme :

- revenir au commit precedent dans l'hebergeur ;
- ou faire un commit correctif ;
- ou utiliser `git revert` sur le commit fautif, puis push.

Eviter les modifications directes dans l'interface de l'hebergeur, car elles ne
seront pas reproduites dans le repo.

## Ce qu'il faut suivre

Chaque semaine :

- trafic par page ;
- pages indexees ;
- clics vers candidatures ;
- demandes CV/lettre ;
- leads recruteurs ;
- commandes payees ;
- sources en erreur ;
- offres sans date de cloture.

Le developpement doit suivre ces signaux. On ajoute ce qui augmente le trafic,
le revenu ou l'autonomie.
