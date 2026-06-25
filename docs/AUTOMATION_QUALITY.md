# Qualite automation Emplois Burkina

Genere le : 2026-06-25T12:23:39.721Z

Score : 89/100
Statut : warning

## Checks

| Severite | Check | Etat | Detail | Recommandation |
| --- | --- | --- | --- | --- |
| critical | sources_minimum | OK | 87 sources configurees | Garder une base de sources large et diversifiee. |
| critical | raw_items_minimum | OK | 418 items bruts | Verifier les crawlers si ce nombre chute brutalement. |
| critical | jobs_minimum | OK | 58 offres curees (seuil actuel 10) | Ne pas publier un catalogue vide ou trop faible. Un seuil plus bas n'est accepte que si les dates sont bien confirmees. |
| critical | sitemap_exists | OK | 104 URLs sitemap | Executer npm run growth. |
| critical | sitemap_files_exist | OK | 0 fichiers sitemap manquants | Regenerer les pages SEO. |
| critical | seed_exists | OK | 906752 octets | Executer npm run db:export. |
| critical | sqlite_exists | OK | 868352 octets | Executer npm run db:sqlite. |
| warning | source_diversity | OK | 6 sources publiees | Ameliorer les sources actives si le catalogue depend trop d'un site. |
| warning | category_diversity | OK | 10 categories publiees | Continuer a capter informel, BTP, ONG, finance et logistique. |
| warning | opening_dates | A corriger | 8/58 avec date d'ouverture confirmee | Continuer a capter et confirmer les dates de publication. |
| warning | closing_dates | A corriger | 16/58 avec date de cloture | Renforcer extraction detail et moderation dates. |
| warning | social_queue | OK | 76 posts en file | Executer npm run social:queue. |
| warning | visibility_engine | OK | rapport visibilite present | Executer npm run visibility. |
| warning | outreach_targets | OK | cibles prospection presentes | Executer npm run visibility. |
| warning | project_audit | OK | audit projet passed | Executer npm run audit:project. |
| info | indexnow_urls | OK | 8526 octets | Executer npm run growth. |
| info | llms_txt | OK | llms.txt present | Executer npm run growth. |
| info | manifest | OK | manifest present | Executer npm run growth. |

## Fichiers sitemap manquants

Aucun.
