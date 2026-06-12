# Qualite automation JobFaso

Genere le : 2026-06-12T14:04:16.497Z

Score : 92/100
Statut : warning

## Checks

| Severite | Check | Etat | Detail | Recommandation |
| --- | --- | --- | --- | --- |
| critical | sources_minimum | OK | 38 sources configurees | Garder une base de sources large et diversifiee. |
| critical | raw_items_minimum | OK | 394 items bruts | Verifier les crawlers si ce nombre chute brutalement. |
| critical | jobs_minimum | OK | 20 offres curees | Ne pas publier un catalogue vide ou trop faible. |
| critical | sitemap_exists | OK | 47 URLs sitemap | Executer npm run growth. |
| critical | sitemap_files_exist | OK | 0 fichiers sitemap manquants | Regenerer les pages SEO. |
| critical | seed_exists | OK | 741098 octets | Executer npm run db:export. |
| warning | source_diversity | OK | 5 sources publiees | Ameliorer les sources actives si le catalogue depend trop d'un site. |
| warning | category_diversity | OK | 7 categories publiees | Continuer a capter informel, BTP, ONG, finance et logistique. |
| warning | closing_dates | A corriger | 2/20 avec date de cloture | Renforcer extraction detail et moderation dates. |
| warning | social_queue | OK | 47 posts en file | Executer npm run social:queue. |
| info | indexnow_urls | OK | 3145 octets | Executer npm run growth. |
| info | llms_txt | OK | llms.txt present | Executer npm run growth. |
| info | manifest | OK | manifest present | Executer npm run growth. |

## Fichiers sitemap manquants

Aucun.
