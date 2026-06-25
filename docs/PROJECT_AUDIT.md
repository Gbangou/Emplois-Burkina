# Audit projet Emplois Burkina

Genere le : 2026-06-25T13:45:13.402Z

Score : 100/100
Statut : passed

## Resume

- Checks critiques en echec : 0
- Warnings : 0
- Fichiers verifies : 23
- Routes API attendues : 13
- Scripts npm attendus : 11

## Checks

| Severite | Check | Etat | Detail | Recommandation |
| --- | --- | --- | --- | --- |
| critical | file:index.html | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:jobs.html | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:admin.html | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:contacts.html | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:conseils.html | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:grille-tarifaire.html | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:app.js | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:server.mjs | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:styles.css | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:sitemap.xml | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:robots.txt | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:llms.txt | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:site.webmanifest | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:database/schema.sql | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:database/seed.sql | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:docs/MASTER_PROMPT.md | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:docs/PROJECT_STATUS_AND_OPERATIONS.md | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:docs/VISIBILITY_ENGINE.md | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:docs/AUTOMATION_REPORT.md | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:scripts/run-automation.mjs | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:scripts/sync-sqlite-db.mjs | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:scripts/generate-visibility-engine.mjs | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | file:scripts/automation-quality-gate.mjs | OK | Fichier requis | Restaurer ou regenerer le fichier. |
| critical | script:automate | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:automate:daemon | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:automate:quality | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:automate:report | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:visibility | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:db:sync | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:db:sqlite | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:db:export | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:growth | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:social:queue | OK | Script package.json attendu | Ajouter le script npm. |
| critical | script:check | OK | Script package.json attendu | Ajouter le script npm. |
| critical | route:/api/health | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/platform | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/db/status | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/jobs | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/leads | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/events | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/admin/db/sqlite/sync | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/admin/jobs/moderation | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/admin/jobs/edit | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/admin/analytics/summary | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/admin/growth/visibility | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/admin/automation | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | route:/api/admin/social/queue | OK | Route API attendue | Ajouter ou documenter la route. |
| critical | sqlite_runtime | OK | SQLite sert de lecture API et conserve les overrides de moderation | Verifier server.mjs et scripts/sync-sqlite-db.mjs. |
| critical | security_baseline | OK | Headers, rate limit, origine et token admin | Ne pas retirer les garde-fous serveur. |
| warning | admin_surfaces | OK | Admin expose analytics, visibilite, moderation et SQLite | Completer app.js/admin.html si un panneau manque. |
| warning | seo_assets | OK | 104 URLs sitemap | Enrichir le corpus avec plus d'offres et de pages SEO utiles. |
| warning | master_prompt_current_state | OK | Le master prompt doit refleter l'etat actuel | Mettre a jour docs/MASTER_PROMPT.md. |
| warning | operations_current_state | OK | Le guide operationnel couvre SQLite, visibilite et moderation | Mettre a jour docs/PROJECT_STATUS_AND_OPERATIONS.md. |
| warning | readme_no_stale_next_steps | OK | README ne doit pas presenter des acquis comme a faire | Actualiser les prochaines etapes. |
| info | visibility_score_documented | OK | Rapport de visibilite genere | Executer npm run visibility. |
