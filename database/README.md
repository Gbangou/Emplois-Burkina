# Base PostgreSQL JobFaso

Ce dossier contient la base cible pour migrer JobFaso des fichiers JSON locaux
vers PostgreSQL, Supabase ou Neon.

## Fichiers

- `schema.sql` : tables, colonnes et index.
- `seed.sql` : donnees exportees depuis les JSON locaux.

`seed.sql` est regenerable :

```bash
npm run db:export
```

## Ordre d'application

Dans Supabase SQL Editor, Neon ou `psql` :

```sql
\i database/schema.sql
\i database/seed.sql
```

Sur Supabase SQL Editor, copier/coller d'abord `schema.sql`, executer, puis
copier/coller `seed.sql`.

## Tables principales

- `sources` : registre des sources et regles de collecte.
- `raw_items` : elements collectes avant moderation.
- `jobs` : offres nettoyees et publiables.
- `seo_pages` : pages indexables et canoniques.
- `indexing_submissions` : suivi IndexNow/Search submission.
- `source_runs` : historique des collectes.
- `lead_events`, `employer_orders`, `sponsors`, `campaigns` : monetisation.
- `page_events` : analytics produit.

## Verification locale

```bash
npm run check
node scripts/check-schema.mjs
npm run db:export
```
