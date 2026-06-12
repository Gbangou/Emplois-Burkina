# Bases de donnees JobFaso

JobFaso fonctionne en local avec une base SQLite generee dans `data/runtime/`
et dispose aussi d'un schema PostgreSQL/Supabase pour la production cloud.

## Fichiers

- `schema.sql` : tables, colonnes et index.
- `seed.sql` : donnees exportees depuis les JSON locaux.
- `data/runtime/jobfaso.sqlite` : vraie base locale generee, ignoree par Git.

`seed.sql` est regenerable :

```bash
npm run db:export
```

La base SQLite locale est regenerable :

```bash
npm run db:sqlite
```

Elle contient les tables `sources`, `jobs`, `raw_items`, `rate_cards`,
`leads`, `page_events`, `site_config` et `sync_metadata`.

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
npm run db:sqlite
```

Pour inspecter rapidement SQLite :

```bash
node -e "import('node:sqlite').then(({DatabaseSync})=>{const db=new DatabaseSync('data/runtime/jobfaso.sqlite'); console.log(db.prepare('select count(*) as jobs from jobs').get()); db.close();})"
```
