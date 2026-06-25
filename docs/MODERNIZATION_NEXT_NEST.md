# Modernisation Next.js + NestJS

Derniere mise a jour : 24 juin 2026.

## Decision

Emplois Burkina evolue vers une architecture moderne en monorepo :

- `apps/web` : frontend Next.js App Router, React, TypeScript, UI mobile-first.
- `apps/api` : backend NestJS modulaire, TypeScript, validation DTO, REST API.
- `packages/domain` : types et logique metier partagees.
- racine historique : application legacy HTML/CSS/JS/Node conservee pendant la migration.

L'objectif n'est plus de rester sur un site statique enrichi. L'objectif est une
plateforme produit moderne, maintenable, scalable et prete pour PWA/mobile.

## Pourquoi migrer progressivement

Le code existant contient deja de la valeur : donnees d'offres, sources,
scripts de scraping, SEO, social, automation, admin local, moderation, alertes
et analytics. On conserve cette valeur pendant que les ecrans et endpoints sont
remplaces par Next/Nest.

## Cible technique

Frontend :

- Next.js App Router.
- Server Components pour les pages SEO et listings rapides.
- Client Components pour filtres, favoris, alertes et formulaires.
- Design system Emplois Burkina : boutons, cartes, filtres, dashboards, dock mobile.
- PWA installable.
- Plus tard : React Native/Expo en reutilisant `packages/domain`.

Backend :

- NestJS par modules : `jobs`, `platform`, `leads`, `health`, puis `auth`,
  `employers`, `payments`, `admin` et `notifications`.
- DTO + validation.
- API REST stable.
- Etape suivante : Prisma + PostgreSQL/Supabase.

## Donnees

Phase actuelle :

- lecture des JSON existants ;
- ecriture temporaire des leads modernes dans `data/runtime/leads-modern.json`.

Phase suivante :

- schema Prisma ;
- migration PostgreSQL ;
- seed depuis `data/curated-jobs.json`, `data/sources.json` et
  `data/product-modules.json`.

## Commandes

Installer les dependances :

```bash
pnpm install
```

Lancer web + API :

```bash
pnpm dev
```

Lancer seulement le frontend :

```bash
pnpm dev:web
```

Lancer seulement l'API :

```bash
pnpm dev:api
```

Ancienne app :

```bash
pnpm legacy:start
```

## Ordre recommande

1. Finaliser la home Next et la page catalogue `/jobs`.
2. Brancher Next sur Nest via `NEXT_PUBLIC_API_URL`.
3. Ajouter Prisma/PostgreSQL avec seed.
4. Migrer l'admin vers Next + Nest.
5. Ajouter auth recruteur/admin.
6. Ajouter publication annonce + paiement mobile money.
7. Ajouter PWA avancee et preparer mobile Expo.
