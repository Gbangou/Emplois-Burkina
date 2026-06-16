-- JobFaso seed generated from local JSON data.
-- Generated at 2026-06-15T16:33:11.873Z.
-- Apply database/schema.sql first.
begin;

-- Sources
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'job_board', 1, 'review_required', array['annonce-details', 'emplois-annonces', 'examens-concours']::text[], array['inscription', 'connexion', 'newsletter', 'depot-annonce', 'repertoire', 'telechargements', 'cupc']::text[], 'Source locale prioritaire. La page d''accueil annonce les offres recentes, concours et appels d''offre.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'job_board', 1, 'review_required', array['recherche-jobs-burkina', 'emploi', 'job', 'offre']::text[], array['inscription', 'login', 'cv', 'formation', 'freelance', 'recruteur']::text[], 'Grosse source locale avec offres par region, metier et secteur.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'job_board', 2, 'review_required', array['emploi', 'job', 'offre', 'recrutement']::text[], array['inscription', 'login', 'cv', 'formation', 'recruteur']::text[], 'A surveiller pour offres privees et alertes emploi Burkina.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'recruiter', 2, 'review_required', array['offre', 'emploi', 'job']::text[], array['candidature-spontanee', 'login', 'contact']::text[], 'Cabinet de recrutement avec offres Burkina et Afrique de l''Ouest.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'ngo', 1, 'review_required', array['emploi', 'job', 'offre', 'recrutement', 'stage']::text[], array['formation', 'login', 'contact', 'ressources']::text[], 'Offres ONG, ONU et humanitaires Afrique francophone. Filtrer Burkina et Sahel a la moderation.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'ngo', 1, 'review_required', array['jobs', 'vacancies', 'burkina', 'ouagadougou', 'bobo', 'dori', 'kaya']::text[], array['privacy', 'cookie']::text[], 'Source internationale utile pour ONU, ONG et developpement. Page verifiee avec offres Burkina.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('reliefweb-burkina', 'ReliefWeb Burkina Faso', 'https://reliefweb.int/jobs?advanced-search=%28C162%29', 'ngo', 1, 'review_required', array['/job/']::text[], array['training', 'reports', 'updates', '/jobs?', '#main-content']::text[], 'Source humanitaire mondiale. Collecter seulement titres, deadlines et liens officiels.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('impactpool-burkina', 'Impactpool Burkina Faso', 'https://www.impactpool.org/search?countries=Burkina%20Faso', 'ngo', 2, 'manual_only', array['jobs', 'burkina']::text[], array['login', 'signup']::text[], 'Plateforme internationale. Souvent dynamique, donc surveillance manuelle/API si disponible.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('devex-burkina', 'Devex Burkina Faso', 'https://www.devex.com/jobs/search?filter%5Bcountries%5D%5B%5D=Burkina%20Faso', 'ngo', 2, 'manual_only', array['jobs', 'burkina']::text[], array['login', 'membership']::text[], 'Developpement international. Peut necessiter compte, donc lien et veille manuelle.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'ngo', 2, 'review_required', array['jobs', 'burkina', 'ouagadougou']::text[], array['login']::text[], 'Offres ONU et volontariat liees au Burkina.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('unicef-careers-burkina', 'UNICEF Careers Burkina Faso', 'https://jobs.unicef.org/en-us/search/?search-keyword=Burkina%20Faso', 'organization', 2, 'manual_only', array['jobs', 'burkina']::text[], array['login']::text[], 'Source officielle UNICEF. Utiliser comme verification des offres UNICEF.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('undp-careers-burkina', 'UNDP Jobs Burkina Faso', 'https://estm.fa.em2.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1/requisitions?keyword=Burkina', 'organization', 2, 'manual_only', array['Burkina', 'requisitions']::text[], array['login']::text[], 'Source officielle PNUD/UNDP, souvent dynamique.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('iucn-careers-burkina', 'IUCN Careers Burkina Faso', 'https://www.iucn.org/about/jobs', 'organization', 3, 'manual_only', array['jobs', 'burkina']::text[], array['login']::text[], 'Verification manuelle des offres environnement et conservation.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('nrc-careers', 'NRC Careers', 'https://www.nrc.no/jobs/', 'organization', 3, 'manual_only', array['jobs', 'burkina', 'ouagadougou', 'dori']::text[], array['login']::text[], 'Norwegian Refugee Council. Verifier les postes Burkina cites par UNjobs.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('drc-careers', 'DRC Careers', 'https://drc.ngo/about-us/careers/vacancies/', 'organization', 3, 'manual_only', array['careers', 'vacancies', 'burkina']::text[], array['login']::text[], 'Danish Refugee Council. Source officielle de verification.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('plan-international-careers', 'Plan International Careers', 'https://jobs.plan-international.org/', 'organization', 3, 'manual_only', array['job', 'burkina']::text[], array['login']::text[], 'Source officielle pour offres Plan International.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('save-children-careers', 'Save the Children Careers', 'https://www.savethechildren.net/careers', 'organization', 3, 'manual_only', array['career', 'job', 'burkina']::text[], array['login']::text[], 'Source officielle Save the Children.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('action-contre-la-faim-careers', 'Action Contre la Faim Careers', 'https://recrutement.actioncontrelafaim.org/', 'organization', 3, 'manual_only', array['emploi', 'job', 'burkina']::text[], array['login']::text[], 'Source officielle ACF.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('humanity-inclusion-careers', 'Humanity & Inclusion Careers', 'https://www.hi.org/en/jobs', 'organization', 3, 'manual_only', array['jobs', 'burkina']::text[], array['login']::text[], 'Source officielle HI / Handicap International.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('fhi360-careers', 'FHI 360 Careers', 'https://www.fhi360.org/careers/', 'organization', 3, 'manual_only', array['careers', 'burkina']::text[], array['login']::text[], 'Source officielle FHI 360, complement pour offres sante/projets.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('world-vision-careers', 'World Vision Careers', 'https://www.wvi.org/careers', 'organization', 3, 'manual_only', array['careers', 'burkina']::text[], array['login']::text[], 'Source officielle World Vision.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('crs-careers', 'Catholic Relief Services Careers', 'https://www.crs.org/about/careers', 'organization', 3, 'manual_only', array['career', 'burkina']::text[], array['login']::text[], 'Source officielle CRS.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('econcours-pro', 'eConcours Pro', 'https://econcours-pro.gov.bf/', 'government', 1, 'official_link', array['concours', 'communique', 'resultat']::text[], array['login', 'connexion']::text[], 'Concours professionnels. Preferer resume court + lien officiel.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('fonction-publique-bf', 'Ministere des Serviteurs du Peuple', 'https://www.fonction-publique.gov.bf/accueil', 'government', 1, 'official_link', array['concours', 'avis', 'selection', 'recrutement', 'communique']::text[], array['contact', 'mediatheque']::text[], 'Source officielle publique. Page verifiee avec communiques et concours.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('econcours-direct', 'eConcours Direct', 'https://www.econcours.gov.bf/', 'government', 1, 'official_link', array['concours', 'communique', 'resultat']::text[], array['login', 'connexion']::text[], 'Inscription en ligne aux concours directs. A utiliser comme lien officiel.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('fasomebo', 'Agence Faso Mebo', 'https://fasomebo.gov.bf/', 'government', 2, 'official_link', array['recrutement', 'emploi', 'concours', 'communique']::text[], array['login']::text[], 'Source publique a surveiller pour recrutements infrastructure et terrain.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'media', 3, 'review_required', array['emploi.lefaso.net', '.html']::text[], array['forum', 'commentaire', 'spip.php', 'contactez-nous']::text[], 'Section emploi dediee de LeFaso.net. Extraire titre, depot, cloture et contenu, puis moderer strictement.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('burkina24-emploi', 'Burkina24 Emploi', 'https://burkina24.com/', 'media', 3, 'review_required', array['recrutement', 'emploi', 'concours', 'stage']::text[], array['politique', 'sport']::text[], 'Media national a surveiller pour annonces publiques et communiques.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('jooble-burkina', 'Jooble Burkina Faso', 'https://jooble.org/SearchResult?ukw=&rgns=Burkina%20Faso', 'aggregator', 2, 'manual_only', array['emploi', 'job', 'burkina']::text[], array['login']::text[], 'Agregateur mondial. Utile pour veille, a eviter en extraction massive.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('optioncarriere-burkina', 'Optioncarriere Burkina Faso', 'https://www.optioncarriere.com/emploi?s=&l=Burkina+Faso', 'aggregator', 2, 'manual_only', array['emploi', 'offre', 'burkina']::text[], array['login']::text[], 'Agregateur emploi. Lier les offres vers les sources originales quand possible.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('facebook-emploi-burkina-veille', 'Facebook Groupes Emploi Burkina', 'https://www.facebook.com/search/groups/?q=emploi%20burkina%20faso', 'social_group', 1, 'manual_only', array['emploi', 'recrutement', 'burkina', 'ouagadougou', 'bobo']::text[], array['login', 'checkpoint']::text[], 'Veille humaine/API uniquement. Ne pas scraper Facebook sans autorisation; capter les opportunites via posts publics soumis ou partenaires.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('facebook-artisans-burkina-veille', 'Facebook Artisans et Services Burkina', 'https://www.facebook.com/search/groups/?q=artisans%20services%20burkina%20faso', 'social_group', 1, 'manual_only', array['artisan', 'plombier', 'macon', 'soudeur', 'electricien', 'menuisier']::text[], array['login', 'checkpoint']::text[], 'Canal important pour metiers informels. Validation admin obligatoire avant publication.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('linkedin-posts-burkina', 'LinkedIn Posts Recrutement Burkina', 'https://www.linkedin.com/search/results/content/?keywords=recrutement%20Burkina%20Faso', 'social_jobs', 2, 'manual_only', array['recrutement', 'job', 'burkina', 'ouagadougou']::text[], array['login']::text[], 'Veille reseau professionnel pour offres partagees en posts. Utiliser API/partenariats ou saisie admin.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('telegram-whatsapp-community-watch', 'Communautes WhatsApp Telegram Emploi', 'https://jobfaso.com/contacts/', 'social_group', 1, 'manual_only', array['emploi', 'recrutement', 'artisan', 'service']::text[], '{}', 'Source indirecte: collecter via formulaires, admins de groupes et partenariats, puis verifier avant publication.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('siao-artisanat', 'SIAO Artisanat', 'https://siao.bf/', 'marketplace', 3, 'official_link', array['artisan', 'formation', 'emploi', 'communique']::text[], array['login']::text[], 'Source officielle utile pour ecosysteme artisanat, formations et opportunites liees aux metiers manuels.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('linkedin-burkina', 'LinkedIn Jobs Burkina Faso', 'https://www.linkedin.com/jobs/search/?keywords=&location=Burkina%20Faso', 'social_jobs', 2, 'manual_only', array['jobs', 'burkina']::text[], array['login']::text[], 'Important pour cadres et entreprises, mais collecte automatisee a eviter sans API/accord.', now())
on conflict (id) do update set
  name = excluded.name,
  url = excluded.url,
  type = excluded.type,
  priority = excluded.priority,
  collection = excluded.collection,
  include_url = excluded.include_url,
  exclude_url = excluded.exclude_url,
  notes = excluded.notes,
  updated_at = now();

-- Raw collected items
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0a823de0f1a9beae68fc625e77b86577523cff4ec19f8c3b0958db47b614da8e', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Liste des annonces', 'BFemploi', 'Administration-Gestion', '2026-06-21', '2026-06-12', '2026-06-21', false, 'https://www.bfemploi.com/emplois-annonces.html', 'A classer', 'needs_review', 'Liste des annonces - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours', 'https://www.bfemploi.com/emplois-annonces.html', '2026-06-15T14:52:06.767Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('13d18bc699b8f81821d2385d49b19a04ca2bb5c12153c05e0debad252e0e4c80', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'BFemploi.com', 'BFemploi', 'Burkina Faso', null, null, null, false, 'https://www.bfemploi.com/examens-concours', 'A classer', 'needs_review', 'BFemploi.com - Liste des pages - Infos Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Con', 'https://www.bfemploi.com/examens-concours', '2026-06-15T14:52:07.496Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('aca4c3653df020e64c88f764b32fce4deb50f0fafb7c2879670cd13d18cc1c80', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'BFemploi.com', 'BFemploi', 'Burkina Faso', null, null, null, false, 'https://www.bfemploi.com/examens-concours', 'A classer', 'needs_review', 'BFemploi.com - Liste des pages - Infos Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Con', 'https://www.bfemploi.com/examens-concours', '2026-06-15T14:52:08.124Z', 0, 0, '2026-06-15T14:52:06.123Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e05b148dd6adcaf86461ccc0c28b34a570a5838beaa18635d365ab219b1f8df6', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a', 'BFemploi', 'Burkina Faso', '2026-06-21', '2026-06-12', '2026-06-21', false, 'https://www.bfemploi.com/annonce-details-3876.html', 'A classer', 'needs_review', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche C', 'https://www.bfemploi.com/annonce-details-3876.html', '2026-06-15T14:52:08.760Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b511815ecc63b96528e92d1dc57c70a84d96bba339499d4479ed34c313701920', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Cash Academy Program Coordinator', 'BFemploi', 'Burkina Faso', '2026-06-16', '2026-06-11', '2026-06-16', false, 'https://www.bfemploi.com/annonce-details-3875.html', 'A classer', 'needs_review', 'Cash Academy Program Coordinator - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Ex', 'https://www.bfemploi.com/annonce-details-3875.html', '2026-06-15T14:52:09.403Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('085b3a6f88412be227a0ad7cab435ebb74a788f01ccf518af6e1668bf4bc59f7', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Responsable Relations Bailleurs H/F Tout Pays', 'BFemploi', 'Burkina Faso', '2026-06-22', '2026-06-09', '2026-06-22', false, 'https://www.bfemploi.com/annonce-details-3874.html', 'A classer', 'needs_review', 'Responsable Relations Bailleurs H/F Tout Pays - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Info', 'https://www.bfemploi.com/annonce-details-3874.html', '2026-06-15T14:52:10.327Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('dd10c6132fdffff7f47de0af4e4f1e2e289b31fa9e98b4753c3d5fa94c7ff271', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Programme Officer - School Meals', 'BFemploi', 'Burkina Faso', '2026-06-16', '2026-06-08', '2026-06-16', false, 'https://www.bfemploi.com/annonce-details-3873.html', 'A classer', 'needs_review', 'Programme Officer - School Meals - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Ex', 'https://www.bfemploi.com/annonce-details-3873.html', '2026-06-15T14:52:10.969Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5114bd3206f770cea9589ae9281ad2010314447a0fd584998f1f9d722af673b0', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Responsable de Recherche', 'BFemploi', 'Ouagadougou', '2026-06-30', '2026-06-04', '2026-06-30', false, 'https://www.bfemploi.com/annonce-details-3871.html', 'A classer', 'needs_review', 'Responsable de Recherche - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Co', 'https://www.bfemploi.com/annonce-details-3871.html', '2026-06-15T14:52:11.876Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ac8e8a256b510daa371cf72207a33bceea3a9c2e12142b2e5a3035a07c01d797', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Enquêteurs / Chercheurs de terrain', 'BFemploi', 'Burkina Faso', '2026-06-26', '2026-06-03', '2026-06-26', false, 'https://www.bfemploi.com/annonce-details-3870.html', 'A classer', 'needs_review', 'Enquêteurs / Chercheurs de terrain - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides ', 'https://www.bfemploi.com/annonce-details-3870.html', '2026-06-15T14:52:12.510Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7f08c84ad3f5e743609f4a14aa4637642de5902afa4b9b359f66f390ddd15775', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Specialiste Safeguarding Regional', 'BFemploi', 'Burkina Faso', '2026-06-15', '2026-06-01', '2026-06-15', false, 'https://www.bfemploi.com/annonce-details-3869.html', 'A classer', 'needs_review', 'Specialiste Safeguarding Regional - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides E', 'https://www.bfemploi.com/annonce-details-3869.html', '2026-06-15T14:52:13.462Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a8c215957c183ce487b40f2097393bea1adc9878e69ca349579b0b1235bd2dcb', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Coordinateur Administratif et Logistique', 'BFemploi', 'Burkina Faso', '2026-08-17', '2026-05-18', '2026-08-17', false, 'https://www.bfemploi.com/annonce-details-3866.html', 'A classer', 'needs_review', 'Coordinateur Administratif et Logistique - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - G', 'https://www.bfemploi.com/annonce-details-3866.html', '2026-06-15T14:52:14.128Z', 0, 0, '2026-06-15T14:52:06.124Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4b6b5059e62eb218f3838b1d66a2287dd6e7ba1e19d5cd4e257db158522b89fa', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Rechercher un emploi', 'Emploiburkina', 'actif', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', 'Emplois au Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Rechercher un emploi Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filter Production, maintenance, qualité (6) Apply Production,', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', '2026-06-15T14:52:27.368Z', 0, 0, '2026-06-15T14:52:25.946Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a67deb385f61f41bace8e9f895ddd1a56021f53399f3af93662fb1e58d86900e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Commande d''annonces', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recrutement/annonce', 'A classer', 'needs_review', 'Recrutement entreprise : l''annonce pour une offre d''emploi au Burkina Faso Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV 0 Se connecter S´inscrire Commande d''annonces Publiez maintenant vos offres d´emploi et trouvez les bonnes compétences pour vos projets. Nos packs annonces 1 annonce Basic Publiez gratuitement jusqu´à 3 annonces Basic par mois ! Gratuit Publier une annonce Basic Logo gratuit sur votre annonce Restez visible auprès des candidats. Votre logo est inséré gratuitement sur vos annonces et dans l´annuaire des recruteurs. Alerte par email des candidatures reçues Soyez informé à tout moment par email de la réception de nouvelles candidatures à vos annonces. Réception de candidatures de profils non-inscrits sur le site Recevez plus de candidatures : Recevez des candidatures de profil', 'https://www.emploiburkina.com/recrutement/annonce', '2026-06-15T14:52:28.005Z', 0, 0, '2026-06-15T14:52:25.946Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3ddb7b293fa18699660073da852bc2615bf07c0b8dc3b7220fecf855a9ff1f9a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Informatique, nouvelles technologies Burkina Faso', 'Emploiburkina', 's Kelétude Nous sommes à la recherche d', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A31', 'A classer', 'needs_review', 'Emplois Informatique, nouvelles technologies Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Informatique, nouvelles technologies Burkina Faso Mes critères de recherche Informatique, nouvelles technologies ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) A', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A31', '2026-06-15T14:52:29.866Z', 0, 0, '2026-06-15T14:52:25.946Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('523378de962f436d309ca57fdad9a2967ffc4d8e4a70ee4ac1931f51b0438d85', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Commercial, vente Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A29', 'A classer', 'needs_review', 'Emplois Commercial, vente Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Commercial, vente Burkina Faso Mes critères de recherche Commercial, vente ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filter Production,', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A29', '2026-06-15T14:52:31.052Z', 0, 0, '2026-06-15T14:52:25.946Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5b8eb74ff8fea606aa8b69b2b87e98db5bcdd5b9df8ea6b1c89e1c3089204781', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Marketing, communication Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A33', 'A classer', 'needs_review', 'Emplois Marketing, communication Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Marketing, communication Burkina Faso Mes critères de recherche Marketing, communication ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filt', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A33', '2026-06-15T14:52:32.414Z', 0, 0, '2026-06-15T14:52:25.946Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d7693dbf660bf28a3c229ece986e960b561f9f2ad9abd058e75e8ac890449f02', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Gestion, comptabilité, finance Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A30', 'A classer', 'needs_review', 'Emplois Gestion, comptabilité, finance Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Gestion, comptabilité, finance Burkina Faso Mes critères de recherche Gestion, comptabilité, finance ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métier', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A30', '2026-06-15T14:52:33.384Z', 0, 0, '2026-06-15T14:52:25.946Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4c45aa00d0e2415e4e9db47f1a0a752c9e4ebf107f8fb7eb3f33fafd1c4ac06a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Transport, logistique Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A28', 'A classer', 'needs_review', 'Emplois Transport, logistique Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Transport, logistique Burkina Faso Mes critères de recherche Transport, logistique ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A28', '2026-06-15T14:52:34.236Z', 0, 0, '2026-06-15T14:52:25.946Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7b460570a93eec41715bfe6c55f29ad0cc458d5e528699eb4efdebf49884389b', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Production, maintenance, qualité Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A37', 'A classer', 'needs_review', 'Emplois Production, maintenance, qualité Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Production, maintenance, qualité Burkina Faso Mes critères de recherche Production, maintenance, qualité ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métie', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A37', '2026-06-15T14:52:35.424Z', 0, 0, '2026-06-15T14:52:25.946Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3fe82482fd6b4469c83ed41bc6d6934b9899ff6ac995bf0da7bcf71767f1f3a4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Métiers des services Burkina Faso', 'Emploiburkina', 's Kelétude Nous sommes à la recherche d', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A35', 'A classer', 'needs_review', 'Emplois Métiers des services Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Métiers des services Burkina Faso Mes critères de recherche Métiers des services ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services Métiers du BTP (4) Apply Métiers du BTP filter Prod', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A35', '2026-06-15T14:52:36.359Z', 0, 0, '2026-06-15T14:52:25.946Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a45c98c242ad9c0a39a5c279e891da7281bbc2f3c426d39c2220bd51e5cb2d94', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Métiers du BTP Burkina Faso', 'Emploiburkina', 'actif', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A36', 'A classer', 'needs_review', 'Emplois Métiers du BTP Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Métiers du BTP Burkina Faso Mes critères de recherche Métiers du BTP ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP Production, main', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A36', '2026-06-15T14:52:37.204Z', 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5ed0a783fae604d77488dbf07224d58286acf339730e8dd9e3ba630e5f7c1ab2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Management, direction générale Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A32', 'A classer', 'needs_review', 'Emplois Management, direction générale Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Management, direction générale Burkina Faso Mes critères de recherche Management, direction générale ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métier', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A32', '2026-06-15T14:52:37.970Z', 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('01af70fdcad7bfbb296b09f4fd90a6afe2231bbaa1bd1490cfb2ddbf1cd9b77f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Secrétariat, assistanat Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A40', 'A classer', 'needs_review', 'Emplois Secrétariat, assistanat Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Secrétariat, assistanat Burkina Faso Mes critères de recherche Secrétariat, assistanat ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Méti', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A40', '2026-06-15T14:52:38.698Z', 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3fbe3b42ecfc6b5dc7ed2fbe6d00834c00f3677df50cb0d7f6d00042c0f6fc93', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Rechercher un emploi', 'Emploiburkina', 'actif', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', 'Emplois au Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Rechercher un emploi Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (7) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filter Production, maintenance, qualité (6) Apply Production,', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', '2026-06-15T14:52:39.393Z', 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('83854165d8ac8570fa73c67c7092f1acb30fb487d1b74a6b8f0581fe68ffa293', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Informatique, SSII, Internet Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A133', 'A classer', 'needs_review', 'Emplois Informatique, SSII, Internet Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Informatique, SSII, Internet Burkina Faso Mes critères de recherche Informatique, SSII, Internet ⤫ Métiers Achats (0) Commercial, vente (4) Apply Commercial, vente filter Gestion, comptabilité, finance (2) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (46) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (1) Apply Management, direction générale filter Marketing, communication (4) Apply Marketing, communication filter Métiers de la santé et du social (0) Métiers des services (0) Métiers du BTP (0) Production, maintenance, qualité (0) R&D, gestion de projets (0) RH, for', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A133', '2026-06-15T14:52:40.804Z', 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('194a17d0e3fbf76d77a61d91dc89c72d62dd44494619ee87d782fc571a1b1389', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Equip. électriques, électroniques, optiques, précision Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A123', 'A classer', 'needs_review', 'Emplois Equip. électriques, électroniques, optiques, précision Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Equip. électriques, électroniques, optiques, précision Burkina Faso Mes critères de recherche Equip. électriques, électroniques, optiques, précision ⤫ Métiers Achats (0) Commercial, vente (5) Apply Commercial, vente filter Gestion, comptabilité, finance (0) Informatique, nouvelles technologies (1) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (0) Marketing, communication (3) Apply Marketing, communication filter Métiers de la santé et du social (0) Métiers des services (0) Métiers du BTP (1) Apply Métiers du BTP filter Production, maintenance, qualité (0) R&D, gestion de pr', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A123', '2026-06-15T14:52:41.807Z', 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('af7cae31ac826b856f58ae5bd76e621b82b24b56369edfcc21e3ec2bd8ec220c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Ingénierie, études développement Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A134', 'A classer', 'needs_review', 'Emplois Ingénierie, études développement Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Ingénierie, études développement Burkina Faso Mes critères de recherche Ingénierie, études développement ⤫ Métiers Achats (0) Commercial, vente (1) Apply Commercial, vente filter Gestion, comptabilité, finance (1) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (2) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (0) Marketing, communication (0) Métiers de la santé et du social (0) Métiers des services (1) Apply Métiers des services filter Métiers du BTP (0) Production, maintenance, qualité (1) Apply Production, maintenance, qualité filter R&D, gestion de projets (0', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A134', '2026-06-15T14:52:42.716Z', 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('80d21b0fb43ae64e5e52921e929e9e269c9a8cd8c0f4b38217a90d99db5e9771', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Agroalimentaire Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A22', 'A classer', 'needs_review', 'Emplois Agroalimentaire Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Agroalimentaire Burkina Faso Mes critères de recherche Agroalimentaire ⤫ Métiers Achats (0) Commercial, vente (0) Gestion, comptabilité, finance (0) Informatique, nouvelles technologies (0) Juridique (0) Management, direction générale (0) Marketing, communication (0) Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (0) Métiers du BTP (0) Production, maintenance, qualité (4) Apply Production, maintenance, qualité filter R&D, gestion de projets (0) RH, formation (0) Secrétariat, assistanat (0) Télémarketing, téléassistance (0) Tourisme, hôtellerie, restauration (0) Transport, logistique (0) Secteurs d''activi', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A22', '2026-06-15T14:52:43.501Z', 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f9ff469b9b9c6e79da688dfe7673bbfd7f8b59fe0b0c1b1a96e999137360cd12', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Automobile, matériels de transport, réparation Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A24', 'A classer', 'needs_review', 'Emplois Automobile, matériels de transport, réparation Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Automobile, matériels de transport, réparation Burkina Faso Mes critères de recherche Automobile, matériels de transport, réparation ⤫ Métiers Achats (0) Commercial, vente (3) Apply Commercial, vente filter Gestion, comptabilité, finance (1) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (0) Juridique (0) Management, direction générale (0) Marketing, communication (2) Apply Marketing, communication filter Métiers de la santé et du social (0) Métiers des services (1) Apply Métiers des services filter Métiers du BTP (0) Production, maintenance, qualité (0) R&D, gestion de projets (0) RH, formation ', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A24', '2026-06-15T14:52:44.381Z', 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d0420a8bbaef2622b3b8f6f28e9df21e43d291c400463e0c849b802233ba86e5', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'BTP, construction', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A26', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A26', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ecc872bdb48876b6abc0baf4501146f88d4c892caa562b974aa58519e5003b9a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Conseil, audit, comptabilité', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A116', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A116', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c4b9faa691c7944eaa719afdc9a0dfcc408770387f77b3359e18638b1ee53fd1', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Distribution, vente, commerce de gros', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A117', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A117', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c80ddd55eadc78df8e3c8b1df53e1e9e060e936c3ca03ba41d3bb9f24888017f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Tous les secteurs d''activité', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('710a42581afc48703044d349dc4d03731b87d099b0585c5dd661d297cac6c858', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A943', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A943', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1c80a1b59018ab8065e05838b237053b3d26b299b4bf6322df4e19834a6d9792', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'International', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A947', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A947', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f0310208920f717dac3da5bf8d7351f9d8477a03c3d44e37f8c1504c524622ef', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Bobo Dioulasso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A58', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A58', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ec843539b2135058e164cabc150f706edbad13e37ff6e912f2f20db01b3a215', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Dédougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A59', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A59', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('73b2eed0fc72888286dadece5c5924f13e9e968853e4c71a43c450aeebcf0250', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Fada N''Gourma', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A61', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A61', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0f8cf7e9b6c7f7c7d4d6fbd7e5e24fb701770634cb962b8cba0f7601ae25c918', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Toutes les régions', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a1ec186344a99a0fe4622a72b0da387d2849a7d6663710e71ce89b523e804c2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2461574f4c28cc0774747a147ae16deb1127b766675b6b01253e185a78e535a0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Courtier(ère) en Énergie B2B- France', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/courtierere-energie-b2b-france-291557', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/courtierere-energie-b2b-france-291557', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ea6a30c7451c86ed0fea05f411b14c25be3a42a4596e7e0ea03d816c687fe661', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Sécretaire Comptable- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-303588', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-303588', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('55269b4fca460f79148fbb8c606d39713477605c18ae35263b0fba5a645c0927', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Executive Secretary- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/executive-secretary-ouagadougou-303736', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/executive-secretary-ouagadougou-303736', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('dd07b60720e6a48b03e5f25fb941efa31fdc58338bc343c11ad3633f55d780af', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ba382968d247e7208a4a40ece1747c1b22ff367900788d1ad421a342b748a14', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Offre de Stage- BTP, Architecture- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/offre-stage-btp-architecture-ouagadougou-304056', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/offre-stage-btp-architecture-ouagadougou-304056', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('416c39ed141e3c248a2d74ed7a393055a000647a7b5f0af202dd0a05509eee00', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Manager- Work From Home', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('562f67805435acedf337c043c78a3122ae7eda45732a33ce03d7e387e7d814c0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Secrétaire- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-ouagadougou-304085', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-ouagadougou-304085', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('db86e6a3396863c8983e2d1bb0d497e701884b8e6e3798465e0547d19e140cb3', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'ANGULAR Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d433d18d7103fb188e21a11f668c33673d04aefe11eec7c9f87d529363abf6a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Toutes les offres d´emploi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-15T14:52:25.947Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fe2b148138f77d8260ff59e653965606d78c6e30e5abbf15b45e7f2e22dfee06', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Qui sommes-nous ?', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/qui-sommes-nous', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/qui-sommes-nous', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fb31aea5641f7b4206fc30bd0f6377895daebaa7f02138bf88b15ed6c2b643d4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Plan du site', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/plan-site', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/plan-site', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a6148d1f633c866e32f86493c5ae7ef1099d3517e4ef21837a774fc8f876fca5', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Achats Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1127', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1127', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9cb4a6e41a10c742d21e6076caa209f18e4ddd349c1253bdb7961825c2d484ab', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Commercial, vente Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A29', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A29', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('359c3adc9fdccb2f58552da79a7f65e56c771ed9609772ebfd6e4efe925844eb', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Gestion, comptabilité, finance Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A30', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A30', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1d4f9fc71e0b8f0cb623c074c855b0483bfdc04e81ba0554dd4bda0cf295b8a4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Informatique, nouvelles technologies Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A31', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A31', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('aa1bee8d42bef13890cf9d153be72aa031a7c27d471dc05a95ae0252d23926b0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Juridique Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1115', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1115', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('634e1ddb3ea86a1d131c0522fdb31f85b0d0c90fc6997ad27dabb466d9f262fe', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Management, direction générale Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A32', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A32', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6e00c135a458dfe06f2db5973b3cd4b816f4bf6e631b15717ad5aa2d6b23d659', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Marketing, communication Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A33', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A33', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('871c5797c16bc0ac8a467e3f803866605ea308a52b53cef20886c9e8356d6a2f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Métiers de la santé et du social Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A34', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A34', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('60e9e1d2a3de05dd934d8d74dfb78a014414f373516c299794b13f455f0dd8bc', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Métiers des services Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A35', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A35', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7534521dde6336d819dfa1fc08fbc8139c16b288e6cab8f8b21ccbd44ef6e7d0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Métiers du BTP Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A36', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A36', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8f6825eb59f5de18cc0ed6fa2ddddfc05bfa3450920d490be049a671f797afea', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Production, maintenance, qualité Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A37', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A37', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5a3f2891c05efeb70309c238967bf647e2210f2dfbbf786420be25c416799a9f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'R&D, gestion de projets Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A39', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A39', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bade8806cea03af221a439ec86bea2c518fd190d0a846560831092a20d563e8d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Secrétariat, assistanat Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A40', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A40', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8d34e7590459d34d1545b3986d7a64a7825fe4354bac7892ca05865acc328988', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Télémarketing, téléassistance Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A525', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A525', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2084593a4d55b4a9fa9dc95b90aaeebeb360439a62cc44999caba92537168fd7', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Tourisme, hôtellerie, restauration Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A41', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A41', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d6c7850ce3af5142612a42f753d9b5f4bbcbe4aea3ec05edd8b584a3756d2a5a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Transport, logistique Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A28', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A28', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3b5d1fd0a7ed2607c818bebb82d079310f58950fa3c68b51aeb9541b95653514', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Banfora Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A57', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A57', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5000ff5b3af87660a0d1ec14ede82ab51d0a87bf590a9c189e75f1089ca66ff0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Bobo Dioulasso Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A58', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A58', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9d7b6032505f1bd8ac06fc13634baf96c30a68e75114c3d2908c1f507c01c816', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Dédougou Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A59', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A59', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ce3167fe23bc786eee8dcd193b77963aafb79620fa87dd7ecc13ea8588ab88bf', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Dori Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A60', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A60', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ed7f28c845f35710df2c302dff347d6c90dec01cad0761cd83bae9412ea01a6e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Fada N''Gourma Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A61', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A61', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0cb977e378cfa0b17a9f52c1d1b6e4c7e30c010f316ad314c8d27f5457385921', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Gaoua Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A62', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A62', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bf5eb8b52a3c828ca5425fe6e09130dc9337eca48ccf16e0d147e5e443784909', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Kaya Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A63', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A63', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('24d44f57fc7f5f9b28523bdc9ca25d1364b79ff1e4ceed65255ed8acfe0ad740', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Koudougou Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A64', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A64', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('52b3c9662113ab39036d30c613e53a98aa9b99724be30fe3a9d8580dcf917d1c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Manga Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A65', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A65', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('507ed5b68b866b48a4876a9b309bd8209bb88ff0bbd11efc3fbd0fdbcb04888d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ouagadougou Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A943', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A943', now(), 0, 0, '2026-06-15T14:52:25.948Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('87fcffd33952406df861c06b54095d952a83fabe54b219473fdca74256912120', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ouahigouya Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A944', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A944', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9344a5538cb558ca901b37062e5856778a15eed30379c1fdc82e5b64399e2bcd', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Tenkodogo Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A945', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A945', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8cebf9906683e3d089bf1b50e606e9f9cf3b3b9b3279b546fe56a51407dc2856', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ziniaré Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A946', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A946', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('234d3df03926e110efee4f796ddc5d3d6ebbf7bd9f22d84d2c4d8c326c77b68c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ingénieurs', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/emplois-actifs/ingenieurs', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/emplois-actifs/ingenieurs', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ea082bf4cd1006738689f92973bb8a3889ffba4e4e3a721713a30008a7bc2c00', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois actifs', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/emplois-actifs', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/emplois-actifs', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c206193d3b0bbe21f7248a2e64dbbae1179c696c5b041de23d7f0b7dad7ed145', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ingénieurs', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recrutements-permanents/ingenieurs', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recrutements-permanents/ingenieurs', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2999d8c01d620d99550f50c5cb932b6fddcc169095f2c7be39f81369a96d610d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Recrutements permanents', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recrutements-permanents', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recrutements-permanents', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c232c5a7b77ac7f8b38bd62f5c7d4ae9d8b3ed11c4dfa2cdbd67463df581fb8d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Maroc', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.ma/', 'A classer', 'needs_review', null, 'https://www.emploi.ma/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e01b6d95403fb0baa1e742e2d0064be5fd5516d761a4913dae2f0b4279b3152d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Côte d’Ivoire', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.ci/', 'A classer', 'needs_review', null, 'https://www.emploi.ci/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('def39cf101ad8eb9f972a5a738419c39d96a3495d8033d9129558ade98cf1b05', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Congo', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cg/', 'A classer', 'needs_review', null, 'https://www.emploi.cg/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('71f746e1c8958e589a5e56d37466646c69095f0b7e87a7e408921a706fe1a9de', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Cameroun', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cm/', 'A classer', 'needs_review', null, 'https://www.emploi.cm/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('095f5cf1a656012f19e6f61e56bf58e20ce974fb241c1ddf760b876ce357037d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Sénégal', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploisenegal.com/', 'A classer', 'needs_review', null, 'https://www.emploisenegal.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4e19b80358354197d729caeca3148520990cdbe3f37ae9eafc437053a5736d44', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0063f82b586801f66a9213033a19f3be972b01974f5d875917bbec6b035dfca0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Guinée', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiguinee.com/', 'A classer', 'needs_review', null, 'https://www.emploiguinee.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6218771d455ca3ee68df23bff407d0f69a1a67db85166b2a3aecc8d221161238', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Togo', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.tg/', 'A classer', 'needs_review', null, 'https://www.emploi.tg/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('70cb0d16b85094d0fea05512d4aaca4035d316aeb2662940e16d8c75286763fd', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Gabon', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.ga/', 'A classer', 'needs_review', null, 'https://www.emploi.ga/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a690540c614f6ba7146721715e833048adaf9a1da645ea2c42a6d2aec064fcdb', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Mauritanie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploimauritanie.com/', 'A classer', 'needs_review', null, 'https://www.emploimauritanie.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9d9cdd4192106a5ba2389a482c32497e420a57c6ab14a536e9fd9a1e872fc24c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Bénin', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploibenin.com/', 'A classer', 'needs_review', null, 'https://www.emploibenin.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1d92e7bf0bacc9b8ed7b74349c1f760365558a3476f79a9a9efc990e8cbbd7ff', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Mali', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploimali.com/', 'A classer', 'needs_review', null, 'https://www.emploimali.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e120ec35b514b0baf425176472b7d3f156c1b0b54468392f32840888ddd6ad94', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Congo RDC', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cd/', 'A classer', 'needs_review', null, 'https://www.emploi.cd/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7b31d59f897e374b34890e8f8ceb171a523c57144ee1d6155732dafa5fcedfc2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Algérie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.algeriejob.com/', 'A classer', 'needs_review', null, 'https://www.algeriejob.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f4943b501811685abd8caf6b0bc5c68e5a8c4a27dff9651b779525a8e4a1de3c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Tunisie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploitunisie.com/', 'A classer', 'needs_review', null, 'https://www.emploitunisie.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('10d60900e28075b6cb304488c372392e828fcfbb4b8d272019def046372fc523', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Niger', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.nigerjob.net/', 'A classer', 'needs_review', null, 'https://www.nigerjob.net/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1623526900bf377c95fffd9dd1f133143a8bac6282e5fc6dbf66d5c2d7765da7', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Tchad', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.td/', 'A classer', 'needs_review', null, 'https://www.emploi.td/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7e78216c20b625819e745686893bfd669a04196f6ae279f0614688ce69af57b6', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Burundi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.bi/', 'A classer', 'needs_review', null, 'https://www.emploi.bi/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f6864d2693995c1576df2d2a07c45dad046cb336d7441c5ecbd1fcbd6003123e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Ghana', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.ghanajob.com/', 'A classer', 'needs_review', null, 'https://www.ghanajob.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c74711399d85c41568e1280308d2fb000148176831fd569bc2e96ae4dcf76639', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Nigeria', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.nigeriajob.com/', 'A classer', 'needs_review', null, 'https://www.nigeriajob.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f8be71c45636291279405cf57e30a85d6216ddb4c1c37791123b45350cd41005', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Kenya', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.kenyajob.com/', 'A classer', 'needs_review', null, 'https://www.kenyajob.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7ca0b3b220078eeda86eb0b74e46bab6a10bdc9d0798b915e159d973501db5ef', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Ouganda', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.ugandajob.com/', 'A classer', 'needs_review', null, 'https://www.ugandajob.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('30453f4fbaa2d2b7a85103081b341abd8178f20def42545a73ab7ceb0e167a51', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Rwanda', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.rwandajob.com/', 'A classer', 'needs_review', null, 'https://www.rwandajob.com/', now(), 0, 0, '2026-06-15T14:52:25.949Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a5d0c9cdd55fc62812c5cf2fbddf39fd0770b9f9aa60be8656ccbcd448ad50ad', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Tanzanie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.tanzajob.com/', 'A classer', 'needs_review', null, 'https://www.tanzajob.com/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c98ecd5ded490eff2c04886180588217adb996dd98ec66cbdb1a08922661e2e3', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Botswana', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.botswajob.com/', 'A classer', 'needs_review', null, 'https://www.botswajob.com/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b088c0adaa209b4d5266bf497a2c9bd50e838022c4db67927e7b9990f38e3686', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Malawi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.malawijob.com/', 'A classer', 'needs_review', null, 'https://www.malawijob.com/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4b00d395bf5e6c452f11ba5e15b1c41c66fbc97a6570a431fa172c9019e863e4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Namibie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.namijob.com/', 'A classer', 'needs_review', null, 'https://www.namijob.com/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('739e3e1d6fd86d9ea7aa0e5efb373d00fd1ce626c2dcf65d59c86d6aebb85c90', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Zambie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.zambiajob.com/', 'A classer', 'needs_review', null, 'https://www.zambiajob.com/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('834c3f5226266842c092ada46c0e0f7e786bdea4db26da5942de4070ab315ca0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Zimbabwe', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.zimbajob.com/', 'A classer', 'needs_review', null, 'https://www.zimbajob.com/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f660c9ce71ee45e8bf617334cec53b4ccf4bbfa8bff7cab5f621bcb34d167413', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Sierra Leone', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.sierraleonejob.com/', 'A classer', 'needs_review', null, 'https://www.sierraleonejob.com/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1492447d76e90aa9075e6e56d2ded993e7acf31d0a8db490c54f1b24eed40d1a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Afrique du Sud', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.zajob.com/', 'A classer', 'needs_review', null, 'https://www.zajob.com/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d00300f29858c8188798ecf763b29d9bc38c029cf238ffcaec852836c180607', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Soudan du Sud', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.southsudanjob.com/', 'A classer', 'needs_review', null, 'https://www.southsudanjob.com/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2cda0bc49f3549a025932ca713163c9096334099a7da3576934f47711cb777be', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Centrafrique', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cf/', 'A classer', 'needs_review', null, 'https://www.emploi.cf/', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5fbf3fc41b08fa029c4a4853ed9bddc18231580fdec8c2d424a1e59210a43d4d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Mentions légales', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/mentions-legales', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/mentions-legales', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('659b22d65aa34a5ec1df9b81a6f9912775bcb230412ff7e5aad1b4495a7c3f52', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Propriété Intellectuelle', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/propriete-intellectuelle', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/propriete-intellectuelle', now(), 0, 0, '2026-06-15T14:52:25.950Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d1453f891616480538c060abf7fc0b7efad29c925b19af7e7fde6df7259fab8c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Recherche', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-15T14:52:25.951Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2606e9b64dbd3a1ad7e814233a4f3ea16d827dd8702f0ef5d697f4882f73ceb2', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/offres-emploi/', 'A classer', 'needs_review', 'Archives des Offres d’emploi - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer ', 'https://www.travail-burkina.com/offres-emploi/', '2026-06-15T14:52:59.046Z', 0, 0, '2026-06-15T14:52:57.452Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8c20818700b5ade57167862b4ba4153565111c0cdeff4af0eacbfe3fcd93ccef', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Offres de stages', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/offres-de-stages/', 'A classer', 'needs_review', 'Archives des Offres de stages - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer', 'https://www.travail-burkina.com/offres-de-stages/', '2026-06-15T14:53:00.232Z', 0, 0, '2026-06-15T14:52:57.453Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ff6ce7fd04032bddb70f76dfe068eb4c001fdd38460f17ed9f1e4ffeda97b4c', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Administration', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/administration/', 'A classer', 'needs_review', 'Archives des Administration - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer u', 'https://www.travail-burkina.com/category/offres-emploi/administration/', '2026-06-15T14:53:01.422Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2cec55b044d44f5082901b560bd7c72d354b0802258ee00a3a3c0bb6b66fd726', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Agriculture – Agro-alimentaire', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/agriculture-agro-alimentaire/', 'A classer', 'needs_review', 'Archives des Agriculture – Agro-alimentaire - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer u', 'https://www.travail-burkina.com/category/offres-emploi/agriculture-agro-alimentaire/', '2026-06-15T14:53:02.562Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c2712d4612083df4d3f04a591ef17ecff3cb86a09c7b791b2f42c0005338d4b9', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Architecture', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/architecture/', 'A classer', 'needs_review', 'Archives des Architecture - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer un ', 'https://www.travail-burkina.com/category/offres-emploi/architecture/', '2026-06-15T14:53:03.790Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f20e69aa364282b4bc7305236f00eada7c6429d9b1bb8811206b2f743563a36a', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Assistance – Secrétariat', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/assistance-secretariat/', 'A classer', 'needs_review', 'Archives des Assistance – Secrétariat - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un comp', 'https://www.travail-burkina.com/category/offres-emploi/assistance-secretariat/', '2026-06-15T14:53:05.004Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3159461f5cc54be97e170fb9d05d25d943255d1dae5fdacddb18880261940d6e', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Audiovisuel- Infographie – Graphisme', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/audiovisuel-infographie-graphisme/', 'A classer', 'needs_review', 'Archives des Audiovisuel- Infographie – Graphisme - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat C', 'https://www.travail-burkina.com/category/offres-emploi/audiovisuel-infographie-graphisme/', '2026-06-15T14:53:06.148Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d31bfa13faba5196c4d1d9433bcd8af4fe38f02e97bd801cecbc47fed03061d3', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Biologie – Chimie', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/biologie-chimie/', 'A classer', 'needs_review', 'Archives des Biologie – Chimie - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Crée', 'https://www.travail-burkina.com/category/offres-emploi/biologie-chimie/', '2026-06-15T14:53:07.313Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f3400ad62f5d10cde8d27f03b5792bcde14477b444c7e7981fd9eeb70d689116', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Chargé de clientèle – Communication', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/charge-de-clientele-communication/', 'A classer', 'needs_review', 'Archives des Chargé de clientèle – Communication - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Cr', 'https://www.travail-burkina.com/category/offres-emploi/charge-de-clientele-communication/', '2026-06-15T14:53:08.550Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0135cb95bb2ef40b893ab6c3532c14fedd8a868ec8d46141a40dc7e703c812b6', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Commerce – Marketing – Vente', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/commerce-marketing-vente/', 'A classer', 'needs_review', 'Archives des Commerce – Marketing – Vente - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un ', 'https://www.travail-burkina.com/category/offres-emploi/commerce-marketing-vente/', '2026-06-15T14:53:09.699Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cebbafb153a3d573082dc2b441e415cd7ed24fc641a5d9132659a076aaf9129d', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Comptabilité – Finance – Statistiques', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/comptabilite-finance-statistiques/', 'A classer', 'needs_review', 'Archives des Comptabilité – Finance – Statistiques - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat ', 'https://www.travail-burkina.com/category/offres-emploi/comptabilite-finance-statistiques/', '2026-06-15T14:53:10.949Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('be79c8ec34aacada1b1b651665bed2ce18da5e9e3bae43e4471f7f6e93a57b51', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Conseil – Consulting', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/conseil-consulting/', 'A classer', 'needs_review', 'Archives des Conseil – Consulting - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte C', 'https://www.travail-burkina.com/category/offres-emploi/conseil-consulting/', '2026-06-15T14:53:12.238Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('854447717663b1e9427f6a1765682baef93714b72fed9ae734c5156f8bef951c', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Direction – Management', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/direction-management/', 'A classer', 'needs_review', 'Archives des Direction – Management - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte', 'https://www.travail-burkina.com/category/offres-emploi/direction-management/', '2026-06-15T14:53:13.405Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('340b89197b9e2d18f4c3d9ab98a88a9da361ad09a9b3d1344ac187d265348ffa', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Informatique – Télécom – Internet', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/informatique-telecom-internet/', 'A classer', 'needs_review', 'Archives des Informatique – Télécom – Internet - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Crée', 'https://www.travail-burkina.com/category/offres-emploi/informatique-telecom-internet/', '2026-06-15T14:53:14.557Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('598b941894ed80f61eb269a10d1bedf9ee5c889f636b0c80effaa9f1aece3502', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Ingénierie – Industrie – Production', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/ingenierie-industrie-production/', 'A classer', 'needs_review', 'Archives des Ingénierie – Industrie – Production - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Cr', 'https://www.travail-burkina.com/category/offres-emploi/ingenierie-industrie-production/', '2026-06-15T14:53:15.749Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a4aa5dfccba8c80ba9642bb902c373dd45fabeeb62ce0a2bc5b20a4e600024d', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Journalisme – Rédaction – Traduction', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/journalisme-redaction-traduction/', 'A classer', 'needs_review', 'Archives des Journalisme – Rédaction – Traduction - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat C', 'https://www.travail-burkina.com/category/offres-emploi/journalisme-redaction-traduction/', '2026-06-15T14:53:17.054Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('870c4da5f9655c60e6fc503fc5dc83d5a4f8f1007e73e9966da752afa4e3e3fd', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Juridique', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/juridique/', 'A classer', 'needs_review', 'Archives des Juridique - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer un CV ', 'https://www.travail-burkina.com/category/offres-emploi/juridique/', '2026-06-15T14:53:18.391Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('413b393c6a6479f397530b1e5f7e56dc33a8cdcd745d0d753966595faaa509a9', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Mécanique – Electrique – Energétique', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/mecanique-electrique-energetique/', 'A classer', 'needs_review', 'Archives des Mécanique – Electrique – Energétique - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat C', 'https://www.travail-burkina.com/category/offres-emploi/mecanique-electrique-energetique/', '2026-06-15T14:53:19.534Z', 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7bd3b1a39a45995387a0037f637f2a8aa7e317311cb86e930bfa1d4718f4c50a', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Médical – Paramedical', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/medical-paramedical/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/medical-paramedical/', now(), 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3e73dc7a6b2f3acd9dc10b2346daceed9be2147178608a99622fdcb866dd8e48', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Ressources Humaines', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/ressources-humaines/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/ressources-humaines/', now(), 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9ec08520e0b5fc9d5419b89302ca7722bf9974c51bc5a47ebc57f5ce643775f5', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Restauration – Hôtellerie', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/restauration-hotellerie/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/restauration-hotellerie/', now(), 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('60e2e04b8a299683932bdb27646fb605efe05939c1a751d18b1a5a9c966fa0c4', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/teleoperateurs-teleconseillers-televendeurs-technicien-support/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/teleoperateurs-teleconseillers-televendeurs-technicien-support/', now(), 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b3ade13dc1018ecdb247b99399d2bf5ac01730d6d9ce29420509933bb7f49d42', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Textile – Styliste – Modéliste', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/textile-styliste-modeliste/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/textile-styliste-modeliste/', now(), 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c7516a022645af25d2aa3c96f60bfa28447df0d313a4c2e64adac32a7b831dcb', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Vendeur- Ouvrier – Chauffeur', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/vendeur-ouvrier-chauffeur/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/vendeur-ouvrier-chauffeur/', now(), 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1800cdc36f70be3dddb6fb64d6041f88cfc7832db08178bf884eb0300184f863', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'domaine d''activité', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/offres-emploi-par-secteur-activite/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/offres-emploi-par-secteur-activite/', now(), 0, 0, '2026-06-15T14:52:57.454Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('595c12809efecaa9f225d29d8a898cad82b845e90b6a0d3f726f1eb6ca9116c2', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Offres d''Emploi', 'RMO Job Center', 'Burkina Faso', null, '2026-06-12', null, false, 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html#', 'A classer', 'needs_review', 'Nos Offres d''Emploi - RMO C�te d''Ivoire C�te d''Ivoire S�n�gal Mali Burkina Faso Togo Se Connecter | Pas encore inscrit(e) ? cliquez ici C�te d''Ivoire Accueil A propos de RMO Offres d''Emploi Conseils Emploi Espace Candidat Espace Entreprises vous �tes ici : Accueil Nos Offres d''Emploi Nos Offres d''Emploi Espace PUB Formulaire de Recherche Mots Recherch�s / R�f�rence : Fonction : Toutes les Fonctions Achat / Logistique / Transport / Import / Export Administration - Secretariat / Services publics ADMINISTRATIVE AND FINANCE OFFICER Agent Technique Planification S�ret� Agriculture ASSISTANT COMPTABLE FINANCIER assistant financier comptable Association / ONG Audit et Conseil Auditeur Interne Junior Automobile Autres Banque / Assurances BTP / Architecture / Construction Caissier(e) Principal(e) Charg� de Client�le Charg� de Contr�le et V�rification Charg� de Recrutement CHARGE PROJET REBRANDING', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html#', '2026-06-15T14:53:21.332Z', 0, 0, '2026-06-15T14:53:20.749Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('27159b769dc7662c901aa77b83bbdf88e307ee419b678ca200959df8a6d09437', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Emploi et Recrutement avec RMO JOBCENTER Burkina Faso', 'RMO Job Center', 'Burkina Faso', null, '2026-05-07', null, false, 'https://www.rmo-jobcenter.com/fr/burkina-faso/', 'A classer', 'needs_review', 'Emploi et Recrutement avec RMO JOBCENTER Burkina Faso - Conseil actu emploi Burkina Faso S�n�gal Mali C�te d''Ivoire Togo Se Connecter | Pas encore inscrit(e) ? cliquez ici Burkina Faso Accueil A propos de RMO Offres d''Emploi Conseils Emploi Espace Candidat Espace Entreprises rmo recrutement Avec RMO, b�n�ficiez de l''accompagnement d''un expert pour toutes les �tapes de votre recrutement. En savoir plus rmo travail temporaire RMO, votre complice pour gagner en exp�rience, diversifier et d�velopper vos comp�tences professionnelles, enrichir votre r�seau. En savoir plus RMO Sous traitance RMO, l''assurance d''une externalisation r�ussie ! En savoir plus rmo formation Avec RMO faites de la formation professionelle un gage de r�ussite pour votre entreprise ! En savoir plus rmo Conseil RH B�n�ficiez de plus de 30 ann�es d''expertise pour une gestion de vos ressources humaines optimis�es. En savoir', 'https://www.rmo-jobcenter.com/fr/burkina-faso/', '2026-06-15T14:53:22.360Z', 0, 0, '2026-06-15T14:53:20.749Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8aa0682229b05b4f0b1c401713c2f480bb64b9695df4f43f706207c4927c6c46', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Emploi et Recrutement avec RMO', 'RMO Job Center', 'Burkina Faso', null, '2026-06-12', null, false, 'https://www.rmo-jobcenter.com/#', 'A classer', 'needs_review', 'Emploi et Recrutement avec RMO - plus de 35 ans de solutions R.H. Qui Sommes-Nous Notre Savoir Faire Nos Implantations Nos Clients Actualit�s RMO rmo recrutement Avec RMO, b�n�ficiez de l''accompagnement d''un expert pour toutes les �tapes de votre recrutement. En savoir plus rmo travail temporaire RMO, votre complice pour gagner en exp�rience, diversifier et d�velopper vos comp�tences professionnelles, enrichir votre r�seau. En savoir plus RMO Sous traitance RMO, l''assurance d''une externalisation r�ussie ! En savoir plus rmo formation Avec RMO faites de la formation professionelle un gage de r�ussite pour votre entreprise ! En savoir plus rmo Conseil RH B�n�ficiez de plus de 30 ann�es d''expertise pour une gestion de vos ressources humaines optimis�es. En savoir plus Acc�s Site Pays : S�n�gal Mali C�te d''Ivoire Burkina Faso Togo --> Offres d''emploi r�centes 12/06/2026 - Ref: #540662 Respon', 'https://www.rmo-jobcenter.com/#', '2026-06-15T14:53:23.231Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('37a2f75413afa9d29aedf6d74861fb4e0cfd0d249cea1c4e31a258342cc6b5c6', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Inscription Candidats', 'RMO Job Center', 'de R', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/inscription.html', 'A classer', 'needs_review', 'Inscription Candidats - RMO C�te d''Ivoire C�te d''Ivoire S�n�gal Mali Burkina Faso Togo Se Connecter | Pas encore inscrit(e) ? cliquez ici C�te d''Ivoire Accueil A propos de RMO Offres d''Emploi Conseils Emploi Espace Candidat Espace Entreprises vous �tes ici : Accueil Espace Candidat Inscription Espace Candidat Inscription D�p�t de CV Agent de recherche Tests RH Boite � outils Conseil juridique Contacts utiles Questions-r�ponses T�moignages Candidats Demande de documents Espace PUB R�seaux Sociaux Cr�er mon Compte Candidat Pourquoi cr�er un compte candidat ? Pour profiter pleinement des outils mis � votre disposition par RMO dans le cadre de votre recherche d''emploi, Il est important que vous ayez un compte candidat et que vous renseigniez votre CV . Vous pourrez ainsi postuler � nos offres en ligne et actualiser votre CV � tout moment. La cr�ation de votre profil fait �galement office de ', 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/inscription.html', '2026-06-15T14:53:24.067Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('126c2d5f4ddf243985b0f7ed38809e3920df89061c68223cf9c0aaf561a61c52', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo.html', '2026-06-15T14:53:24.818Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('002753c82a6446ee67252644b8480f0d53f6b67654391fee9ed18dbe11fc8ee5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'D�poser un dossier de candidature physique', 'RMO Job Center', 'Burkina Faso', null, '2026-06-11', null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi.html', 'A classer', 'needs_review', 'Emploi et Recrutement avec RMO JOBCENTER C�te d''Ivoire - Conseil actu emploi C�te d''Ivoire S�n�gal Mali Burkina Faso Togo Se Connecter | Pas encore inscrit(e) ? cliquez ici C�te d''Ivoire Accueil A propos de RMO Offres d''Emploi Conseils Emploi Espace Candidat Espace Entreprises rmo recrutement Avec RMO, b�n�ficiez de l''accompagnement d''un expert pour toutes les �tapes de votre recrutement. En savoir plus rmo travail temporaire RMO, votre complice pour gagner en exp�rience, diversifier et d�velopper vos comp�tences professionnelles, enrichir votre r�seau. En savoir plus RMO Sous traitance RMO, l''assurance d''une externalisation r�ussie ! En savoir plus rmo formation Avec RMO faites de la formation professionelle un gage de r�ussite pour votre entreprise ! En savoir plus rmo Conseil RH B�n�ficiez de plus de 30 ann�es d''expertise pour une gestion de vos ressources humaines optimis�es. En savo', 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi.html', '2026-06-15T14:53:25.723Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f3800719475969f39d51b4184a616e17f47b5f95b38fdaf5207afe35de987167', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/conseils-emploi.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/conseils-emploi.html', '2026-06-15T14:53:26.457Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8723b9817ecde5a2ebe2ab091631c9a521e1163340ac4fb9683100cc303e7633', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/entreprises.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/entreprises.html', '2026-06-15T14:53:27.073Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d1232ff115f1e5c79440c440a469a8268eae27491ae1bdae05ef322ffe1f8ca7', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/261-grand-jeu-intention-travailleurs.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/261-grand-jeu-intention-travailleurs.html', '2026-06-15T14:53:27.727Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2f6e8030eee2bd38df9fe8eb46da1a12a68f7461b2ab7f4f751de8c6affe957b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/260-arbre-noel-2021-ecole-maternelle.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/260-arbre-noel-2021-ecole-maternelle.html', '2026-06-15T14:53:28.333Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8b3ab8d7c33571efd46ebc042120be8f3ea3f4f4a557b9ffdd66d209751e2232', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/258-arbre-noel-2020-ecole-maternelle.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/258-arbre-noel-2020-ecole-maternelle.html', '2026-06-15T14:53:28.947Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b27f914f40f6738351911d54b304058a30695f4d6b3632afb1a3e57ede71e96e', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/257-cancer-sein-parlons-en.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/257-cancer-sein-parlons-en.html', '2026-06-15T14:53:29.584Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('df243d54723004075bb1a206d9f5d9947d408178785ce2977d93f5add8bf9fbe', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites.html', '2026-06-15T14:53:30.326Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('53cbf3198be98efaeb74542fd4a3fdbafa1f13969f26a4bd454baeadbf79efed', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'cliquez-ici.', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/includes/fonctions/outils/telecharger_docs.php?file=postuler-a-une-offre-sur-rmo-jobcenter.pdf', 'A classer', 'needs_review', '%PDF-1.5 %���� 1 0 obj >>> endobj 2 0 obj > endobj 3 0 obj >/XObject >/ExtGState >/Pattern >/ProcSet[/PDF/Text/ImageB/ImageC/ImageI] >>/MediaBox[ 0 0 595.32 841.92] /Contents 4 0 R/Group >/Tabs/S/StructParents 0>> endobj 4 0 obj > stream x��\[oǑ~��0/ �,G}�,%6�D��d��Hf@��Dz��Z��_l}U�sf�]$X"�5}��{�tϣ''��ߞ�]w�?zr}}z���M�ã�W~|���^��;� ��<>�>;鞾~��� �Yۛн~���� ��]6}q��5��t��?|`�w����~�u���_?|��wϿ=�mY��������˻��;�;^���Ƙ''��lLyz|�]������}��8=�.5[�x����]�½���g��L{u�ʫ[7ں''��|���v��j� ��E����X���a ��ჷ�cbp}-� �+]t�����}\ �ʾ�a�Z�t-Y.$�ƺԻH�S��ލy��,�ݣ��oO�z֙U�*�U`Ŋ�''/��ŗ�#kg��~��~��k��{�C?��9���|� �>�� �����S*l��&��dԓÖ��6��ؓ`N�a�e�����vրu���������`j���>�TH�>�p���3��K��Ž�k�˞�U� OQٶEkO���o�4��+-}�@�z�?c���-���Y�O}X��ϥǔ���M��:�%?z�H�E i� l�њ������H��P� Ÿ�>��]�vC_�fM�� ϶����4�A\���ȾMJ,�BS��������;�kS��U��� ��s��;� �mh�ud�-O�0)#L4��4{^�p', 'https://www.rmo-jobcenter.com/includes/fonctions/outils/telecharger_docs.php?file=postuler-a-une-offre-sur-rmo-jobcenter.pdf', '2026-06-15T14:53:31.728Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c0052d4ade0d2e79f2bb0c76ababbc20e02355feebdfe6ecef99c19ff083f36f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'RMO', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/flux-rss/filiales/cote-d-ivoire/offres.xml', 'A classer', 'needs_review', 'RMO - Cote d''Ivoire https://www.rmo-jobcenter.com/fr.html RMO - Cote d''Ivoire https://www.rmo-jobcenter.com/fr.html https://www.rmo-jobcenter.com/images/img/logo_mail.jpg Le numero 1 du recrutement en Afrique de l''Ouest Mon, 15 Jun 2026 14:53:32 GMT http://backend.userland.com/rss092 fr https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/ntic/3971-ingenieur-support-data-center.html https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/ntic/3971-ingenieur-support-data-center.html https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html https://www.rmo-jobcenter.com/fr/cote-d-i', 'https://www.rmo-jobcenter.com/flux-rss/filiales/cote-d-ivoire/offres.xml', '2026-06-15T14:53:32.217Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('69b37c0224f2ada497a590d9153523f4dbbff5a86d4dee2867ec61082206ed67', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html', '2026-06-15T14:53:32.823Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7fe22ca82eda080d3850b31e5d512cb3b1d4e3b9182506967abd9784e698a311', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html', '2026-06-15T14:53:33.447Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b953d987615dec3fba8135af05eabab48835efda4df0a940b0f2b61cdcc3d4bc', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/ntic/3971-ingenieur-support-data-center.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/ntic/3971-ingenieur-support-data-center.html', '2026-06-15T14:53:34.049Z', 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5ec91e09f99631ffbc01b1b300dbd1d67d2e50fa5c01c2d1b30558b8ce02b751', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/ntic/3971-ingenieur-support-data-center.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/ntic/3971-ingenieur-support-data-center.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eefeedc3fdcf4d4b6373b0aa216c18915023e8607051200d8e1be144a621d8dc', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Operations Manager (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4035-operations-manager.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4035-operations-manager.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1923d7d2eec6b481cc5731f7eec72fcd29a5482d12557e8b2d7c79af3564cc58', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4035-operations-manager.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4035-operations-manager.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eee428cf5817b0bb94044abab1ca98c9445072922734ee3fd1d9a1a477008731', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Commercial (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4036-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4036-commercial.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('46824602532214a47b7ffccb308169ffb3e70d1c028189b7c239d963450d494f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4036-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4036-commercial.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0769c5c57a32e2ef556f765166e4f93d95af222c6298eac3d5fb0d24281167ad', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'AGENT CONTROLE DRAFT (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4034-agent-controle-draft.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4034-agent-controle-draft.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('375ef20e9c9ad54c02beb82833be78b6c563a62b1f3ddb2b7562fd78cd3e9d39', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4034-agent-controle-draft.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4034-agent-controle-draft.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('76a313339992ae75e27e91cc7e06ea24568f13778f5c829e5aabe1237a73120f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Chef de Projet IT (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('49bf4a80b55c1dc95d9825d8963c86a80b37738cbbb01029c06266d23dbf4806', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3cb6e5c553386f7e251f12310c0f629563b82378170930542faeb9f1de08d684', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'HSE (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4033-hse.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4033-hse.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6971de5a8a04f7ddc53923e2a4e786863b8c907bdacb74929886677ca45fa847', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4033-hse.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4033-hse.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('09ebbff177ac7f9e195fe01f0fa05be936cbaf90f7cd7978376fac5948199911', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Infographe / Webdesigner (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4032-infographe-webdesigner.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4032-infographe-webdesigner.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9e63bb951eb7772a577a9d27692bd9a663c226846c791add35222ddb1fe9137a', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4032-infographe-webdesigner.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4032-infographe-webdesigner.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('565d6a2e9f57973024c3de485658f1971d50dfee048903e9a6081312cd0dafc3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Office Manager (F/H) (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('524b033183e18005a1f016adaf53112e75adabd3337b5e23b8265fb4323de5e2', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f8cb467a8c551912f288e5eff28ec7cb209be78607cbbbeb100cc0027e5920c3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Magasinier (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4027-magasinier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4027-magasinier.html', now(), 0, 0, '2026-06-15T14:53:20.750Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4767f91cbdcddfea01b0f2645d6690054224107a93c1d0f973b02bac311213a7', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4027-magasinier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4027-magasinier.html', now(), 0, 0, '2026-06-15T14:53:20.751Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c147cfb03b07e3cd661470d5685d0836d12fd02419b3f6ab4d785b188aada049', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Responsable Administratif et Financier (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4028-responsable-administratif.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4028-responsable-administratif.html', now(), 0, 0, '2026-06-15T14:53:20.751Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a2a5a391841c9805bfb15b47ff6f82be298461370c13f11a94c8a49dbfddcdf', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4028-responsable-administratif.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4028-responsable-administratif.html', now(), 0, 0, '2026-06-15T14:53:20.751Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('90596d58732b3b3e0db98cc8a82f40063f22051f65e40328798f120e955a9270', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Responsable D�veloppement (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4025-responsable-developpement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4025-responsable-developpement.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9b6af42b9e7d6b03f51fe67f6fa714591b4820df82d797077dacf82cc0a3ea6e', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4025-responsable-developpement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4025-responsable-developpement.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cc086f45df19efab7646d577b21daa899367ee86a03433e993f6e16dda4f49c8', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Assistant(e) Administratif(e) (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4024-assistant-administratif.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4024-assistant-administratif.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4655b457e409088acf9d568a7ff6dccbd2230b2e3b5e8903d44abb154a2cdcd6', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4024-assistant-administratif.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4024-assistant-administratif.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6c2cb145487b9b72eec6c3789144f035bb4f29d4557bd50cde9a05891c4bc10a', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'P�tissier (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4026-patissier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4026-patissier.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8a763e3f1175e9b42c73cba1d29fd1c3f547961280938e29d834cfed5d1ab197', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4026-patissier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4026-patissier.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bc075b55125c8e4a2d28c06f6a46abccfdf58c2c68514ea9bf7fba2fdfef2960', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Charg�(e) HSE (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/achat-logistique-transport/4023-charge-hse.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/achat-logistique-transport/4023-charge-hse.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('72e19d7b997b62b4d3d63bf5676336b8e56ccc2bde1383865b809440b927cebb', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/achat-logistique-transport/4023-charge-hse.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/achat-logistique-transport/4023-charge-hse.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a75b0f72f5ed7918da3ecde26ebc48dcc41e155c87d4739f7eeb5c2b43893fe', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Attach� Commercial (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/3985-attache-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/3985-attache-commercial.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7470eab2e57163417216e1b460376c32423893679ac347d546e252d04748b98b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/3985-attache-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/3985-attache-commercial.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('55cae252cacdc08a5c302d151b1d614b4338d2d3c3584dd7c40a5b168f3dc928', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Responsable Commercial (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3978-responsable-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3978-responsable-commercial.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('240f025c2b467bdda973352a5e4f9642504cabc8c7d2a67e55ea1d2a35061357', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3978-responsable-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3978-responsable-commercial.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4ccdcab04c94af27538cc862093f9f28a9ae3cf72e46ea8ce23cec7d8bc17b07', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Directeur Commercial (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/ntic/4008-directeur-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/ntic/4008-directeur-commercial.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5f9202a1604f464d5df41283951d94a81ae3093682db586516df1e24ad90400f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/ntic/4008-directeur-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/ntic/4008-directeur-commercial.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6bffdb3a0c8fff55ae63827aebd368d9ccf060af06c66d84cf231a45e29e314f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'G�rant de restauration collective (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3977-gerant-restauration-collective.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3977-gerant-restauration-collective.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f63a8ad98bb87276095f86d6484e2b3ef17ad39fba622868a6c4f4c5ddbfbe56', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3977-gerant-restauration-collective.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3977-gerant-restauration-collective.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('56b9cafccfff914e78e5dbdd1486d1017c74ed63d23f844f2ee960537bc58a48', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Responsable tr�sorerie (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/3960-responsable-tresorerie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/3960-responsable-tresorerie.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3942c1023f06cdc5730f6e3449a1f49cadc3612aec13743735d8d9add18efb18', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/3960-responsable-tresorerie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/3960-responsable-tresorerie.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5c70153af9b0e2c36d697c490b4fcc34c4af523b5c6d2415b042e63800063ef8', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'A propos de RMO', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('64b6bf1ff012f888c77cbea5b7a45abf12a36640dd3567c2b2dbd9435f728e87', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Qui Sommes-Nous', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/qui-sommes-nous.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/qui-sommes-nous.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2e01e3bb59e70e1398d65f4c9fb3893b9313025e16a0852aa398ad7754e1f300', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Savoir Faire', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/notre-savoir-faire.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/notre-savoir-faire.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('86538bb3a3258fe3b48dad8928009fb14e6de893fd4cff5c60cbd7791b2fb3e5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Implantations', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/nos-implantations.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/nos-implantations.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('03d7d2c51db439e517974c3510bd5da28c281fcbaebafdc1ee5edd7070ee5644', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Clients', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/nos-clients.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/nos-clients.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c5ede6653a75865a7be7286ee84bab9e5a5e3f7c787f9552850b663c00ec2b02', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Partenaires', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/nos-partenaires.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/nos-partenaires.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a3890ab04a272e66e465eb7fedd0d1e6befba4924c0136fa107fb60de95f99d1', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Actualit�s RMO', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/actualites.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/actualites.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('77d57f84d2ecf38bd22450731917b936026ab5f5b0b34aae40e2de0c3c3678ff', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Conseils Emploi', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('282fe02f6035ea1f78fb2b0bc0cbf8e86210075c72725ae8878627091aec6881', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'G�rer sa recherche d''emploi', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('357c96c279dc221d92aa94b39ff2dec4a04a2b0ba2a5c9db0e857b52e29ca368', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Pr�parer son entretien d''embauche', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('321b9dfdf23b0c459c9e6c49b5564508642605666d886fcbc3172b82324c2198', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Diff�rents types d''entretien', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/differents-types-entretien.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/differents-types-entretien.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('70e196b31209530b38915cfb9f7a4202659686ca84f8119c1d1b014e3e50c49a', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Le d�roulement de l''entretien', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/deroulement-entretien.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/deroulement-entretien.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8e0279c1c5e1c55cc532cb6398f962dc7adbbc9d65600cd19be108d4c6b5eb14', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les erreurs � �viter lors d''un entretien de recrutement', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/erreurs-eviter-entretien.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/erreurs-eviter-entretien.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fec13d0451c763854100f03faadacc25a45361265cd977ec3f3c14e812b76914', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Post-It � garder � ses c�t�s', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/post-it-entretien-embauche.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/post-it-entretien-embauche.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('393ffdc4f3042e02c10a41fd733ed2d949e295f4c6d65407706e1519197d8e04', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'L''entretien T�l�phonique', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('889c5590fbb070ed43958c289b81f81b4faf02cfd2550e23a0a08ed9361922c5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les appels � ne pas oublier', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique/appel-pas-oublier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique/appel-pas-oublier.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ee416029c9e876b550f55dfd2efb4f782e9153edab21509d60b8bb4d3754e6c7', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les attitudes � �viter', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique/attitudes-eviter.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique/attitudes-eviter.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6a2aab59fe77355a7c3ad8fd2eb9e7efa19b262f021432998f27d53cf507c716', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'R�daction de son CV', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c833c302f4b57c00629a4dbe7c458acccca4bf9694adadd189c203504a5c26ee', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Construire sa strat�gie professionnelle', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/strategie-professionnelle.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/strategie-professionnelle.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c0588b107110ad5907424439dddbc51082ff5b24c04bbb965d17c91bc1daa8f1', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les parties principales d''un CV', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/parties-principales-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/parties-principales-cv.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2a9356adf2e053184869443bd167c27b800c0154718146e21be352d4e7cadc4b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les Diff�rents types de CV', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/differents-types-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/differents-types-cv.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ec789ccf134bd51f25e93a07c38dcb1c890da2bc8d939f90be8bb18fd2eaf64f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Recommandations et erreurs � �viter', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/recommandations-erreurs-eviter.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/recommandations-erreurs-eviter.html', now(), 0, 0, '2026-06-15T14:53:20.752Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b53c7d39675b517726d8631b3fa6408adaa609a2e90458a592bb26e585a4c0b2', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les conseils � suivre', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/conseils-suivre.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/conseils-suivre.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a9e60924fa9d16ff60f425482d11a39d9d8774f8f6e682970af1462c66011863', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Post-It � garder � ses c�t�s', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/post-it-redaction-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/post-it-redaction-cv.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e78e997f40ce499b9eaa165c21b1b479277e6b76e8f6a7bdff9d8520aa892957', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'La lettre de motivation', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('196835397ab4308ce2344600245822a091a54d25b74ea81ebf32ab395105d044', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les erreurs � ne pas commettre', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation/erreurs-pas-commettre.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation/erreurs-pas-commettre.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d6969b7e1ac3f2789ebccef90f7a7d9656d5bf18b07358f7256b2d2003a945cc', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Floril�ge des formulations � �viter', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation/florilege-formulations-eviter.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation/florilege-formulations-eviter.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fb639a7e899d144cecb4550e87cda7b1d2445c3be02ea229e0680b1187e47c96', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Choisir des Annonces', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('54808a39ab1825345ae51762ee4b94c30d8b272f70e21b34f1324f07fc88f6c5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Analyser les annonces et bien les s�lectionner', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/analyser-annonces-selectionner.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/analyser-annonces-selectionner.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ec38ba91eae67481303eebed51641a3d1041da2bf2b30038396779a6e0e0d58c', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Quels sont les crit�res objectifs et subjectifs ?', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/criteres-objectifs-subjectifs.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/criteres-objectifs-subjectifs.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5ea34da7da2cfeb2dae0cc624e26179f83ed01b4108be3c267e14e4d3bd82e8c', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les erreurs � �viter', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/erreurs-eviter.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/erreurs-eviter.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eaed94471b59e6c1e96facb65eabb4f4d0892cc23b4f4a0c194ab8c2611a8596', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Quelques recommandations ?', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/quelques-recommandations.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/quelques-recommandations.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ce646558294e0d492806a1e4525c669f0461f4b47f5d39c970d843bb1981537', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Post-It � garder � ses c�t�s', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/post-it-choisir-annonce.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/post-it-choisir-annonce.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2abffdfd7d7357848b5ab7631261b9ebb29a1554b3a135cbd09cc5ae9c4ec417', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Conna�tre ses Droits', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('05d0e3697b57b34d9018c2e3a3132a9990e453a049552b7e8ca3f79bc19f97b5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Explication du Bulletin de Paie', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/explication-bulletin-paie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/explication-bulletin-paie.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('966a6473cb85ff338757aa10ba67a0ff7e5c987ed3d3f4a01862a2072c6e40e5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Le Contrat de Mission', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/contrat-mission.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/contrat-mission.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8516579301c555c46bd0811938e454bb3e3d93932f0814f1de0b547bcf8fde51', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Lexique Juridique', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/lexique-juridique.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/lexique-juridique.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a0f38934bb6c5af91992b353bb8481b254ec198984d04805f576fdd93bfdbc4', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Documentations L�gales', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/documentations-legales.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/documentations-legales.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d95108c4f194130f563bc3ac0626d5a4fabd55229ca0c679809d5f4d184200a3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Contr�le Qualit�', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/controle-qualite.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/controle-qualite.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('35d27e1259ba00a96dc35e573c9fd7dd4b1ad83be3af24be313a4dd5ede4d727', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Fiches M�tier', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/fiches-metier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/fiches-metier.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('621a82e7e3e27d3bf1dedd8eabd4012efb74b4f71bd8261358abff98a924ba15', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Actu Conseil', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/actu-conseils.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/actu-conseils.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3f34dc55f5b39ff7a29e54c69a5b3106307a8e5359bfe6826dd383760c28fc59', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'D�p�t de CV', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/depot-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/depot-cv.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('22fe8d9b2824b86ce4bc46a91fd645482cbd1a9c23a21831ee33e618bcbac724', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Agent de recherche', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/agent-recherche.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/agent-recherche.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('17a1dcd594f86916c080ffc57b704feb20af2860a37b6820d03a2534b886fef7', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Tests RH', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/tests-rh.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/tests-rh.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bce8afd74846a248a7c4b2c7199f3ae6d04716bbb9f80be6a3e41731baadbc73', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Boite � outils', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/boite-outils.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/boite-outils.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9dc18d4ee141795bd47ae16e4ee0c9b498de320714884be2effc36d6832a623b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Conseil juridique', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/boite-outils/conseil-juridique.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/boite-outils/conseil-juridique.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c69cd620aedf5e865d28943da6756ea194d532359d36605a149753be68adcea1', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Questions-r�ponses', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/questions-reponses.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/questions-reponses.html', now(), 0, 0, '2026-06-15T14:53:20.753Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a70552f27b42307e6d8033897f569defd1ece938afdef40e6145e5b1a5c85046', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Demande de documents', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/demande-documents.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/demande-documents.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('017d017c49bb9e8d7b9ec1d514b71c096ac991ab252e98496a2979528632f6a2', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Espace Entreprises', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('92f6766a9a3f1a5b612aeb2a120c2e1dda9126c2fa95fd05c552a9ed7d65c49d', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Services', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('91c2e13d6f50bd97529d4506fcc73b60ea375a78c66e6c4ec1ea33b0fa8e2816', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Recrutement', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1b883d94f2ccc39c68b37e67a13f3764c77f3529df520ebab63938d73ba536d3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Offres', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/nos-offres.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/nos-offres.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('825f06e4d7aa69ccf9d3100801b6a929938ed4d92d90e9ac0bc9fd589a5b5867', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/notre-agrement.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5069a18bc17905f920fddf92df9ceb6d045add234ffc47f0226f4edc88db409b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos tests RH avec Central Test', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/nos-tests-rh.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/nos-tests-rh.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('935d3467af0f2ad0cc5cbb236de2b64cb7edf87c513d3461827face59a1bdbc5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Travail Temporaire', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2663bed0c39ce0e336b2cf3c705dcfa761f85228a223b9552f471120a745aa27', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Le Contrat de Mission', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire/contrat-mission.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire/contrat-mission.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1f08f0bdd86045fe74c1be10e78999ec9f315949d931c77426fe3c4714ba8512', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire/notre-agrement.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('47b19571fddd78edbdd845bdae079439f595e1f84d075c15996b1cc0215d592b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Sous Traitance', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/sous-traitance.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/sous-traitance.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0ffc5df8a49e9720bdf98da78282696582b8a91b6fcdbfb83b2e5c0bfafd0827', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/sous-traitance/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/sous-traitance/notre-agrement.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6936ed394eb5fd81ccc81348b5bc526da823ae11f1553fde6c17e4e8555e2194', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/formation/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/formation/notre-agrement.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('21462ca4a00c56eec090cce13c8804dc0116879bf3032949f98d664f7ee4397e', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Conseil RH', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/conseil-rh.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/conseil-rh.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('be9b479e6137f5977a318813f95ad27330cf8ec35ae6b5958708057c836885d1', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/conseil-rh/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/conseil-rh/notre-agrement.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e162dba5dcd381748b68d86f08a9b2d7e59d8dc16e5a42622aeb1e7171f20323', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Marketing Event', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/marketing-event.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/marketing-event.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f3a63f5c1381e66089d0d6469b32d6512256f7ae92de96d232a0026a5383f71d', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'T�moignages Clients', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/temoignages.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/temoignages.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c90a73aa45d8fa32704a7586ad2c0a98daaff02f86bf3b2bfac10b2d9c59c9c4', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Demande de Cotation Express', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/demande-cotation-express.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/demande-cotation-express.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fa5ec49d04977a577c542e6e464a5c89f912cd499594d3e0b91df2c727b08828', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Service Web', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/service-web.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/service-web.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('402ec3f4439bbbb6bb88212b296408e0ccd840af9a5c0aad693ebd80800c3548', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Espace Employ�s', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/espace-employes.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/espace-employes.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5d67d96680e7435c51250623a41b01c6d461da08a957fd695d39414e7023ffae', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Demande de documents', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/espace-employes/demande-documents.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/espace-employes/demande-documents.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3bd992090ff9e05604cd2fa51708a8b51f4862aaaa22f272556812ffde76ff6c', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Politique de Confidentialit�', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/politique-confidentialite.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/politique-confidentialite.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3daa83ca29f6070345777c046bde2c0122ca6dd34e5367ac2f03bcacd9817ac3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Politique de Gestion des Cookies', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/politique-cookie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/politique-cookie.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('64b7c4967ae2e2a4464751a75136e66ffa16730c664f9a90d0e18d895417824e', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'charte cookies', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/politique-cookie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/politique-cookie.html', now(), 0, 0, '2026-06-15T14:53:20.754Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bb2864ac243123c0713cb98a2fb9ac4e188ebd8b44acd8a339f851b5b53c873d', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6)', 'HumanitaireHub', 'de l', '2026-06-21', '2026-06-21', '2026-06-21', false, 'https://humanitairehub.com/emploi/associee-senior-aux-operations-de-mouvement-appui-terrain_g-6/', 'A classer', 'needs_review', 'Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6) - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6) ← Retour aux offres OIM / IOM Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6) 📍 Côte d''Ivoire · 📄 CDD ⏰ Deadline 21 Juin 2026 J-6 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Administration & Finance Logistique Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : SVN-CI-05-2026_1 Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6) Niveau Requis : Licence, Diplôme d&rsquo;études secondaires Année d&rsq', 'https://humanitairehub.com/emploi/associee-senior-aux-operations-de-mouvement-appui-terrain_g-6/', '2026-06-15T14:53:36.147Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ad031b5a87a0c89adc97a32cfa3e42064237b02923bd29e79af4efa82e36408c', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6)', 'HumanitaireHub', 'de l', '2026-06-21', '2026-06-21', '2026-06-21', false, 'https://humanitairehub.com/emploi/associee-senior-aux-operations-de-mouvement-appui-terrain_g-6/', 'A classer', 'needs_review', 'Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6) - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6) ← Retour aux offres OIM / IOM Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6) 📍 Côte d''Ivoire · 📄 CDD ⏰ Deadline 21 Juin 2026 J-6 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Administration & Finance Logistique Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : SVN-CI-05-2026_1 Associé(e) Senior aux Opérations de Mouvement (Appui Terrain)_G.6) Niveau Requis : Licence, Diplôme d&rsquo;études secondaires Année d&rsq', 'https://humanitairehub.com/emploi/associee-senior-aux-operations-de-mouvement-appui-terrain_g-6/', '2026-06-15T14:53:36.803Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('803107b339d5e6eed381aa5b6ce4682c2fabb0a413139e1afc5273c865ab35d1', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'UNICEF recrute 02 postes', 'HumanitaireHub', 'Burkina Faso', '2026-06-29', '2026-06-29', '2026-06-29', false, 'https://humanitairehub.com/emploi/unicef-recrute-02-postes-3/', 'A classer', 'needs_review', 'UNICEF recrute 02 postes - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion UNICEF recrute 02 postes ← Retour aux offres UNICEF UNICEF recrute 02 postes 📍 Sénégal/RDC · 📄 CDD ⏰ Deadline 29 Juin 2026 J-14 📨 Postuler maintenant → 🏢 Type d''org Agence des Nations Unies Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : 02 postes Niveau Requis : Diplôme universitaire supérieur Année d&rsquo;Expérience Requise : 5 ans Lieu du Travail : Sénégal/RDC Date de Soumission : 29/06/2026 Description de l’emploi L’UNICEF œuvre dans plus de 190 pays et territoires pour sauver des vies d’enfants, défendre leurs droits et les aider à réaliser leur potentiel, de l', 'https://humanitairehub.com/emploi/unicef-recrute-02-postes-3/', '2026-06-15T14:53:37.775Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e9cec341e538ad9c335a310c805424fecee79494d2a33a7687afef4e5018aaed', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'UNICEF recrute 02 postes', 'HumanitaireHub', 'Burkina Faso', '2026-06-29', '2026-06-29', '2026-06-29', false, 'https://humanitairehub.com/emploi/unicef-recrute-02-postes-3/', 'A classer', 'needs_review', 'UNICEF recrute 02 postes - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion UNICEF recrute 02 postes ← Retour aux offres UNICEF UNICEF recrute 02 postes 📍 Sénégal/RDC · 📄 CDD ⏰ Deadline 29 Juin 2026 J-14 📨 Postuler maintenant → 🏢 Type d''org Agence des Nations Unies Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : 02 postes Niveau Requis : Diplôme universitaire supérieur Année d&rsquo;Expérience Requise : 5 ans Lieu du Travail : Sénégal/RDC Date de Soumission : 29/06/2026 Description de l’emploi L’UNICEF œuvre dans plus de 190 pays et territoires pour sauver des vies d’enfants, défendre leurs droits et les aider à réaliser leur potentiel, de l', 'https://humanitairehub.com/emploi/unicef-recrute-02-postes-3/', '2026-06-15T14:53:38.425Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3d0bff4183ea97c79fb19804e08ef845625896e4b5ebaf449ee1cf512398bf18', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'PAM recrute Associé au programme SC6', 'HumanitaireHub', 'Burkina Faso', '2026-06-29', '2026-06-29', '2026-06-29', false, 'https://humanitairehub.com/emploi/pam-recrute-associe-au-programme-sc6/', 'A classer', 'needs_review', 'PAM recrute Associé au programme SC6 - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion PAM recrute Associé au programme SC6 ← Retour aux offres PAM (Programme Alimentaire Mondial) PAM recrute Associé au programme SC6 📍 Tchad · 📄 CDD ⏰ Deadline 29 Juin 2026 J-14 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Agence des Nations Unies Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : Associé au programme SC6 (Cash Based Transfert), Abéché, Tchad Niveau Requis : Diplôme post étude secondaire Année d&rsquo;Expérience Requise : 6 ans Lieu du Travail : Tchad Date de Soumission : 29/06/2026 Description de l’emploi Le Progr', 'https://humanitairehub.com/emploi/pam-recrute-associe-au-programme-sc6/', '2026-06-15T14:53:39.311Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('58a6678a1e7e8723aef4e9055f9e14e922330d0227b7a7559c7db0add4163726', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'PAM recrute Associé au programme SC6', 'HumanitaireHub', 'Burkina Faso', '2026-06-29', '2026-06-29', '2026-06-29', false, 'https://humanitairehub.com/emploi/pam-recrute-associe-au-programme-sc6/', 'A classer', 'needs_review', 'PAM recrute Associé au programme SC6 - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion PAM recrute Associé au programme SC6 ← Retour aux offres PAM (Programme Alimentaire Mondial) PAM recrute Associé au programme SC6 📍 Tchad · 📄 CDD ⏰ Deadline 29 Juin 2026 J-14 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Agence des Nations Unies Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : Associé au programme SC6 (Cash Based Transfert), Abéché, Tchad Niveau Requis : Diplôme post étude secondaire Année d&rsquo;Expérience Requise : 6 ans Lieu du Travail : Tchad Date de Soumission : 29/06/2026 Description de l’emploi Le Progr', 'https://humanitairehub.com/emploi/pam-recrute-associe-au-programme-sc6/', '2026-06-15T14:53:39.968Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c584648512645baa071716d945799873f012193a5a53fd7fd8a2e92448ba80d5', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Développeur.euse Senior d&rsquo;application web et mobiles (Spécialiste)', 'HumanitaireHub', 'Burkina Faso', '2026-06-30', null, '2026-06-30', false, 'https://humanitairehub.com/emploi/developpeur-euse-senior-dapplication-web-et-mobiles-specialiste/', 'A classer', 'needs_review', 'Développeur.euse Senior d''application web et mobiles (Spécialiste) - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Développeur.euse Senior d&rsquo;application web et mobiles (Spécialiste) ← Retour aux offres International Cocoa Initiative (ICI) Développeur.euse Senior d&rsquo;application web et mobiles (Spécialiste) 📍 Côte d''Ivoire · 📄 CDD ⏰ Deadline 30 Juin 2026 J-15 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Technologies & Innovation Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : Développeur.euse Senior d&rsquo;application web et mobiles (Spécialiste) Lieu du Travail : Côte d&rsquo;Ivoire Orgaisation', 'https://humanitairehub.com/emploi/developpeur-euse-senior-dapplication-web-et-mobiles-specialiste/', '2026-06-15T14:53:40.881Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bc94a41ccf634b4c2c450a7dae0eb7fbce635d5e91361acd058aa09dd554d651', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Développeur.euse Senior d&rsquo;application web et mobiles (Spécialiste)', 'HumanitaireHub', 'Burkina Faso', '2026-06-30', null, '2026-06-30', false, 'https://humanitairehub.com/emploi/developpeur-euse-senior-dapplication-web-et-mobiles-specialiste/', 'A classer', 'needs_review', 'Développeur.euse Senior d''application web et mobiles (Spécialiste) - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Développeur.euse Senior d&rsquo;application web et mobiles (Spécialiste) ← Retour aux offres International Cocoa Initiative (ICI) Développeur.euse Senior d&rsquo;application web et mobiles (Spécialiste) 📍 Côte d''Ivoire · 📄 CDD ⏰ Deadline 30 Juin 2026 J-15 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Technologies & Innovation Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : Développeur.euse Senior d&rsquo;application web et mobiles (Spécialiste) Lieu du Travail : Côte d&rsquo;Ivoire Orgaisation', 'https://humanitairehub.com/emploi/developpeur-euse-senior-dapplication-web-et-mobiles-specialiste/', '2026-06-15T14:53:41.529Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('070adfeb77197106df20c475a9cae7be7fd38fa9112c0291a168a9894f3f9595', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ,', 'HumanitaireHub', 'Burkina Faso', '2026-06-29', '2026-06-29', '2026-06-29', false, 'https://humanitairehub.com/emploi/oordonnateur-de-programme-du-secteur-prive/', 'A classer', 'needs_review', 'OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, ← Retour aux offres Oxfam International OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, 📍 Ghana · 📄 CDD ⏰ Deadline 29 Juin 2026 J-14 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Management & Coordination Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, ACCRA, GHANA Lieu du Travail : Ghana Date de Soumission : 29/06/2026 Description de l’emploi Oxfam est un mouvement mondial qui rassemble des personnes œuvrant ensemble pour mettre fin', 'https://humanitairehub.com/emploi/oordonnateur-de-programme-du-secteur-prive/', '2026-06-15T14:53:42.385Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('76786722b82f23bda5ed16e13c78a35a028734ec46900033b659f999ed8e2067', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ,', 'HumanitaireHub', 'Burkina Faso', '2026-06-29', '2026-06-29', '2026-06-29', false, 'https://humanitairehub.com/emploi/oordonnateur-de-programme-du-secteur-prive/', 'A classer', 'needs_review', 'OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, ← Retour aux offres Oxfam International OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, 📍 Ghana · 📄 CDD ⏰ Deadline 29 Juin 2026 J-14 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Management & Coordination Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, ACCRA, GHANA Lieu du Travail : Ghana Date de Soumission : 29/06/2026 Description de l’emploi Oxfam est un mouvement mondial qui rassemble des personnes œuvrant ensemble pour mettre fin', 'https://humanitairehub.com/emploi/oordonnateur-de-programme-du-secteur-prive/', '2026-06-15T14:53:43.045Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fe7a2ce6d137107780c97a470bef3ec6de862dffbfdff7d9631f4796cf9b6751', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'HCR recrute 500 Volontaires en ligne', 'HumanitaireHub', 'Burkina Faso', '2026-06-29', '2026-06-29', '2026-06-29', false, 'https://humanitairehub.com/emploi/hcr-recrute-500-volontaires-en-ligne/', 'A classer', 'needs_review', 'HCR recrute 500 Volontaires en ligne - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion HCR recrute 500 Volontaires en ligne ← Retour aux offres UNHCR HCR recrute 500 Volontaires en ligne 📍 Mali · 📄 Volontariat (VSI, VNU, etc.) ⏰ Deadline 29 Juin 2026 J-14 📨 Postuler maintenant → 📊 Expérience Junior (0-2 ans) 🏢 Type d''org Agence des Nations Unies Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : 500 Volontaires en ligne pour Soutenir la Journée mondiale des réfugiés Lieu du Travail : Mali Date de Soumission : 29/06/2026 Description de l’emploi Mission et objectifs Le Haut-Commissariat des Nations Unies aux réfugiés (HCR) a été créé le 14 déce', 'https://humanitairehub.com/emploi/hcr-recrute-500-volontaires-en-ligne/', '2026-06-15T14:53:43.905Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cc478a42e1d3746ce708b32e943779def5ef973c9deb99bcd8f04f25cedc3cb7', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'HCR recrute 500 Volontaires en ligne', 'HumanitaireHub', 'Burkina Faso', '2026-06-29', '2026-06-29', '2026-06-29', false, 'https://humanitairehub.com/emploi/hcr-recrute-500-volontaires-en-ligne/', 'A classer', 'needs_review', 'HCR recrute 500 Volontaires en ligne - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion HCR recrute 500 Volontaires en ligne ← Retour aux offres UNHCR HCR recrute 500 Volontaires en ligne 📍 Mali · 📄 Volontariat (VSI, VNU, etc.) ⏰ Deadline 29 Juin 2026 J-14 📨 Postuler maintenant → 📊 Expérience Junior (0-2 ans) 🏢 Type d''org Agence des Nations Unies Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : 500 Volontaires en ligne pour Soutenir la Journée mondiale des réfugiés Lieu du Travail : Mali Date de Soumission : 29/06/2026 Description de l’emploi Mission et objectifs Le Haut-Commissariat des Nations Unies aux réfugiés (HCR) a été créé le 14 déce', 'https://humanitairehub.com/emploi/hcr-recrute-500-volontaires-en-ligne/', '2026-06-15T14:53:44.557Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('28937bde1b29d604752b2180fe013dc6abb472f7f99769902493ed5cdd1a6a0e', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Directeur de l&rsquo;appui à la mission, D2', 'HumanitaireHub', 'Burkina Faso', '2026-06-18', '2026-06-18', '2026-06-18', false, 'https://humanitairehub.com/emploi/directeur-de-lappui-a-la-mission-d2/', 'A classer', 'needs_review', 'Directeur de l''appui à la mission, D2 - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Directeur de l&rsquo;appui à la mission, D2 ← Retour aux offres MONUSCO Directeur de l&rsquo;appui à la mission, D2 📍 RD Congo ⏰ Deadline 18 Juin 2026 J-3 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : Directeur de l&rsquo;appui à la mission, D2 Niveau Requis : Master Année d&rsquo;Expérience Requise : 15 ans Lieu du Travail : RDC Date de Soumission : 18/06/2026 Description de l’emploi La MONUSCO (Mission de l’Organisation des Nations Unies pour la Stabilisatio', 'https://humanitairehub.com/emploi/directeur-de-lappui-a-la-mission-d2/', '2026-06-15T14:53:45.414Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('102d52108368b659883b59b42f00e8a34f580daf5a8f34292fb8533dcae816f3', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Directeur de l&rsquo;appui à la mission, D2', 'HumanitaireHub', 'Burkina Faso', '2026-06-18', '2026-06-18', '2026-06-18', false, 'https://humanitairehub.com/emploi/directeur-de-lappui-a-la-mission-d2/', 'A classer', 'needs_review', 'Directeur de l''appui à la mission, D2 - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Directeur de l&rsquo;appui à la mission, D2 ← Retour aux offres MONUSCO Directeur de l&rsquo;appui à la mission, D2 📍 RD Congo ⏰ Deadline 18 Juin 2026 J-3 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : Directeur de l&rsquo;appui à la mission, D2 Niveau Requis : Master Année d&rsquo;Expérience Requise : 15 ans Lieu du Travail : RDC Date de Soumission : 18/06/2026 Description de l’emploi La MONUSCO (Mission de l’Organisation des Nations Unies pour la Stabilisatio', 'https://humanitairehub.com/emploi/directeur-de-lappui-a-la-mission-d2/', '2026-06-15T14:53:46.056Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('061e235e156b12410f22983e3dd8518c325806ae32c690540738557ce40a499a', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Programme de bourses de l&rsquo;OIBT', 'HumanitaireHub', 'Burkina Faso', '2026-07-20', null, '2026-07-20', false, 'https://humanitairehub.com/emploi/programme-de-bourses-de-loibt/', 'A classer', 'needs_review', 'Programme de bourses de l''OIBT - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Programme de bourses de l&rsquo;OIBT ← Retour aux offres OIBT Programme de bourses de l&rsquo;OIBT 📍 Pays Membres de l''OIBT · 📄 Bourses/Etudes ⏰ Deadline 20 Juin 2026 J-5 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste BOURSE OIBT 2026 : JUSQU’À 10 000 USD POUR VOS ÉTUDES, RECHERCHES, FORMATIONS ET CONFÉRENCES EN FORESTERIE TROPICALE ! L’Organisation Internationale des Bois Tropicaux (OIBT) lance son Programme de Bourses 2026 à travers le Fonds Freezailah pour les Bourses. Cette opportunité vise à renforcer', 'https://humanitairehub.com/emploi/programme-de-bourses-de-loibt/', '2026-06-15T14:53:46.936Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f767a691d7239b0e52e713b0b0c5747dce42273a8a1c4903ba54cad66fa8a3e0', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Programme de bourses de l&rsquo;OIBT', 'HumanitaireHub', 'Burkina Faso', '2026-07-20', null, '2026-07-20', false, 'https://humanitairehub.com/emploi/programme-de-bourses-de-loibt/', 'A classer', 'needs_review', 'Programme de bourses de l''OIBT - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Programme de bourses de l&rsquo;OIBT ← Retour aux offres OIBT Programme de bourses de l&rsquo;OIBT 📍 Pays Membres de l''OIBT · 📄 Bourses/Etudes ⏰ Deadline 20 Juin 2026 J-5 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste BOURSE OIBT 2026 : JUSQU’À 10 000 USD POUR VOS ÉTUDES, RECHERCHES, FORMATIONS ET CONFÉRENCES EN FORESTERIE TROPICALE ! L’Organisation Internationale des Bois Tropicaux (OIBT) lance son Programme de Bourses 2026 à travers le Fonds Freezailah pour les Bourses. Cette opportunité vise à renforcer', 'https://humanitairehub.com/emploi/programme-de-bourses-de-loibt/', '2026-06-15T14:53:47.586Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('34c96ce73f77988706aae95429e85338b853a525556db65f898a1b869b655869', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Chargé.e SERA_ Projet ATINORD Sécurité (H/F)', 'HumanitaireHub', 'Burkina Faso', '2026-06-26', '2026-06-25', '2026-06-26', false, 'https://humanitairehub.com/emploi/charge-e-sera_-projet-atinord-securite-h-f/', 'A classer', 'needs_review', 'Chargé.e SERA_ Projet ATINORD Sécurité (H/F) - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Chargé.e SERA_ Projet ATINORD Sécurité (H/F) ← Retour aux offres Expertise France Chargé.e SERA_ Projet ATINORD Sécurité (H/F) 📍 Côte d''Ivoire · 📄 CDD ⏰ Deadline Non precisee 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Gouvernement / Institution publique MEAL (Suivi, Évaluation, Apprentissage) Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : Chargé.e SERA_ Projet ATINORD Sécurité (H/F) Niveau Requis : BAC + 5 Année d&rsquo;Expérience Requise : 5 ans Lieu du Travail : Côte d&rsquo;Ivoire Date de Soumission : 25/06/2026 Description de l’emploi', 'https://humanitairehub.com/emploi/charge-e-sera_-projet-atinord-securite-h-f/', '2026-06-15T14:53:48.877Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('423db2c5535b1bb226d98e45d1b55874edaa13e6165766df6bc02651e1c36040', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Chargé.e SERA_ Projet ATINORD Sécurité (H/F)', 'HumanitaireHub', 'Burkina Faso', '2026-06-26', '2026-06-25', '2026-06-26', false, 'https://humanitairehub.com/emploi/charge-e-sera_-projet-atinord-securite-h-f/', 'A classer', 'needs_review', 'Chargé.e SERA_ Projet ATINORD Sécurité (H/F) - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Chargé.e SERA_ Projet ATINORD Sécurité (H/F) ← Retour aux offres Expertise France Chargé.e SERA_ Projet ATINORD Sécurité (H/F) 📍 Côte d''Ivoire · 📄 CDD ⏰ Deadline Non precisee 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Gouvernement / Institution publique MEAL (Suivi, Évaluation, Apprentissage) Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : Chargé.e SERA_ Projet ATINORD Sécurité (H/F) Niveau Requis : BAC + 5 Année d&rsquo;Expérience Requise : 5 ans Lieu du Travail : Côte d&rsquo;Ivoire Date de Soumission : 25/06/2026 Description de l’emploi', 'https://humanitairehub.com/emploi/charge-e-sera_-projet-atinord-securite-h-f/', '2026-06-15T14:53:49.528Z', 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e65f46ac1673a329fdc8c124e7c5b39da67a8cc2e59c2491d6454eba2146211b', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Expertise France J-10 Responsable de Composantes _ Projet ATINORD Sécurité (H/F) 📍 Côte d''Ivoire 📋 CDD Management & Coordination Sécurité', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-de-composantes-_-projet-atinord-securite-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-de-composantes-_-projet-atinord-securite-h-f/', now(), 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b332be6a6d42b01978b0292a587d201baf2a9e2b38e901a3da5fc2602d6559e0', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-de-composantes-_-projet-atinord-securite-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-de-composantes-_-projet-atinord-securite-h-f/', now(), 0, 0, '2026-06-15T14:53:35.245Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bf2ff307a1821b8684ec00b359206578d58c7e0129ad8a6e6341ac13cc9954f1', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Bénin Cashew SA J-4 Bénin Cashew SA recrute 960 postes 📍 Bénin 📋 CDD Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/benin-cashew-sa-960-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/benin-cashew-sa-960-postes/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1fd5a80a9d9f91e39e669f31d5efa56a771c41b1b22cafb65079cede27c56437', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/benin-cashew-sa-960-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/benin-cashew-sa-960-postes/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('488d1b99c9e4053b5b7abc21f66cbdf59197203072493fd52cd2cf6c02a3010d', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'HCDH J-9 HCDH recrute 02 postes 📍 Sénégal 📋 CDD Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/hcdh-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/hcdh-recrute-02-postes/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d9e7190cd8c07bee454122dd803ec88e90870e02b2cc2fed850be0118e38466e', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/hcdh-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/hcdh-recrute-02-postes/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('60ed2d8951cd58ed8b3d5768c5a2ef342a89a0db15de8fc2d3c52153ba9bde4f', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Ambassade de France J-7 Ambassade de France recrute 02 postes 📍 Tchad / Mali 📋 CDD Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/ambassade-de-france-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/ambassade-de-france-recrute-02-postes/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0728e0eb5d5553743f6560763ecd85795797417fc497648cfd0f806342052484', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/ambassade-de-france-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/ambassade-de-france-recrute-02-postes/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e53f1bb228ead6b3b1ffd478ee4532b5f7feba9b66e16d39efcc045b42b930ab', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'PATH J-8 Pôle régional et directeur pays, Afrique de l&rsquo;Ouest et centrale 📍 Nigeria 📋 CDD Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/pole-regional-et-directeur-pays-afrique-de-louest-et-centrale/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/pole-regional-et-directeur-pays-afrique-de-louest-et-centrale/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e2a8d67593f8f9c01a326f66799ae385bf0fbc746e99db8a0a9345043ad1ed5b', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/pole-regional-et-directeur-pays-afrique-de-louest-et-centrale/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/pole-regional-et-directeur-pays-afrique-de-louest-et-centrale/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5a73fc45305b69365d7d36a995c828371410f1d673c6e8786a8efb21480089af', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'PNUD / UNDP J-4 Coordonnateur(rice) Projet NPAP 📍 Sénégal 📋 CDD Management & Coordination Plusieurs Secteurs', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordonnateurrice-projet-npap/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordonnateurrice-projet-npap/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('31b84d2b92e716c4053d02cb6fc3cd9f0be92ed4d442579d1d49949de831c64a', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordonnateurrice-projet-npap/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordonnateurrice-projet-npap/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c3b73174aa9976ef9330d23659380fae70d57ea68773255293e44166370a3d6a', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Croix-Rouge Béninoise J-3 Comptable 📍 Bénin 📋 CDD Administration & Finance', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/comptable/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/comptable/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f0ab7cf2d6d2b222f76e60612bb827af1183ea58232144a1a20f39cfd3ed0ced', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/comptable/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/comptable/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('911ffc3457aa296e6c3e88abed10df58fa05dffe748f8a652434a9d8f974ad90', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'ACTED J-6 Chargé Logistique Pays 📍 RD Congo 📋 CDD Logistique', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/charge-logistique-pays/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/charge-logistique-pays/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f221bfe15a50f093cbc17c0b9387a5e9372b4b2f41d2833526778f05a8426383', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/charge-logistique-pays/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/charge-logistique-pays/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('05c8cec30b5e1af60a6cc67d32ca4a7c035392dd7fc892bebef163fcb9a8c696', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Action Contre la Faim J-6 ADJOINT·E CHEF DE BUREAU REGIONAL RESILAC – REFERENT·E SUPPORT ET CONFORMITE 📍 Tchad 📋 CDD Management & Coordination Support', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/adjoint%c2%b7e-chef-de-bureau-regional-resilac-referent%c2%b7e-support-et-conformite/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/adjoint%c2%b7e-chef-de-bureau-regional-resilac-referent%c2%b7e-support-et-conformite/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6c432f7dfc531cf17642a05ae6daf90b3339ecac5ebd906925e8ccab9bdec704', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/adjoint%c2%b7e-chef-de-bureau-regional-resilac-referent%c2%b7e-support-et-conformite/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/adjoint%c2%b7e-chef-de-bureau-regional-resilac-referent%c2%b7e-support-et-conformite/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('227e2451be6994f0acd5f9867697641fbd2d1615f601c944502b1318fa052708', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'FICR (Fédération Internationale Croix-Rouge) J-4 FICR recrute 12 postes chauffeurs 📍 RDC 📋 CDD Logistique', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/ficr-recrute-12-postes-chauffeurs/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/ficr-recrute-12-postes-chauffeurs/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b8710d9082271f764e4744fdfa06ca147e031ba2284afadc8c9d0f15c41d0a1e', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/ficr-recrute-12-postes-chauffeurs/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/ficr-recrute-12-postes-chauffeurs/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a77f813149090e177cb413c99a23c0e1a75e7e85a5c6d4e5ddac5d2022f7fb8f', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Banque mondiale J-11 Responsable de programme, Mali 📍 Mali 📋 CDD Administration & Finance Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-de-programme-mali/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-de-programme-mali/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f0ae02a4fa595c1b55be23a0827aaacc63aaadd4ef0b98be76a4486b823861b9', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-de-programme-mali/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-de-programme-mali/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5a81da9ceeba6ef348bacdf7aca8f1452929f2e39f8ebe8d87c28a7c2e240baa', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/expertise-france-recrute-02-postes-3/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/expertise-france-recrute-02-postes-3/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('783f551c75880f6fb3f790ec1cf73442640aa42a46a49f6bf1fa8d41d5cbe82d', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Élevages sans frontières J-17 Coordinateur.trice de projet 📍 Togo 📋 CDD Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordinateur-trice-de-projet/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordinateur-trice-de-projet/', now(), 0, 0, '2026-06-15T14:53:35.246Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('31eefa590e0387282172069ebcdc0fba739d46eca2ea08e2df91db5c79dd38af', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordinateur-trice-de-projet/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordinateur-trice-de-projet/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('57a0fa9aae6d258dedfee25701244e2d2e295519b564be4b628ad628149d98db', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'UNICEF J-6 UNICEF recrute 26 postes 📍 RDC/Cameroun/Niger 📋 CDD Plusieurs Secteurs', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/unicef-recrute-26-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/unicef-recrute-26-postes/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('04582c6c175852da5064321555a55bb12a401dd89ef9af33bdde609c7f9def37', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/unicef-recrute-26-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/unicef-recrute-26-postes/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('de4c1fcdd65bd28bb85c2863234a34f836688eccb89233c0b31f87105416692f', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Catholic Relief Services (CRS) J-3 CRS recrute 02 Project Officer Santé 📍 Mali 📋 CDD Management & Coordination Santé', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/crs-recrute-02-project-officer-sante/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/crs-recrute-02-project-officer-sante/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1ee690595e66bd8a100fcf28f80a213c77b4a73e72280c58606bd52dfbb11c2b', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/crs-recrute-02-project-officer-sante/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/crs-recrute-02-project-officer-sante/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9534be5c37f4bdf03858829df2ad8898908f017479de9f311abf59f7adfd09e3', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Norwegian Refugee Council (NRC) J-11 Coordinateur financier 📍 Niger 📋 CDD Administration & Finance', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordinateur-financier-2/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordinateur-financier-2/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b3b60a39f3ddae6c5ce43a704489b8b6d4f0ebaeecc8ab21f4ef3208753783a7', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordinateur-financier-2/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordinateur-financier-2/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7947eae83b9f72a487d5f9fff745a00d8fd39c5615675906d5e60747e47c60c2', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Catholic Relief Services (CRS) J-2 PROCUREMENT ASSISTANT (CHARGE(E) D’ACHAT) 📍 Burkina Faso 📋 CDD Logistique', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/procurement-assistant-chargee-dachat/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/procurement-assistant-chargee-dachat/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b2e3ce2d0959c27ce881aa4f577ec1cd4285fae445e23b015e72377ec43215d9', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/procurement-assistant-chargee-dachat/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/procurement-assistant-chargee-dachat/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0244551c9aadb468997fdf08d9d88138ddd8d22dff48432432592c72a2d9104c', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'ACTED J-4 Assistant(e) Sensibilisation et Cohésion Sociale 📍 Mali 📋 CDD Plusieurs Secteurs Protection, Genre & Inclusion', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/assistante-sensibilisation-et-cohesion-sociale/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/assistante-sensibilisation-et-cohesion-sociale/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fa93999ba367b6838bbd9ae1b3cf7955d879d080bc3b1d1472de579b83ab2548', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/assistante-sensibilisation-et-cohesion-sociale/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/assistante-sensibilisation-et-cohesion-sociale/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b9bed14f17d595224315a11c69475e9063fd9e14f114bff47db0dc99a3a68c10', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'OMS J-18 Directeur – OMS 📍 Congo-Brazzaville 📋 CDD 💰 Jusqu''a 4 900 EUR/mois Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/directeur-oms/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/directeur-oms/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a43c54267336d2ffc4cf198da3064c77a4d48ce15a17394f591916efb063274b', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/directeur-oms/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/directeur-oms/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a2f4aedfce618b03a7b746bc0571c179efc908d19615c42e2ce6c78e0e741c2f', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Alertes emploi', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/alertes-emploi/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/alertes-emploi/', now(), 0, 0, '2026-06-15T14:53:35.247Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d56d3d10a1a34006f2537c384448cfa649fba37620a74bd4c32fad200816352', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Offres d''emploi', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/?page=offres', 'A classer', 'needs_review', 'Offres d''emploi - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière - Site d''annonces d''emploi Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous 854 offres d’emploi 01 Agent(e) de Bureau PUBLI&Eacute;E Décembre 2025 | DATE LIMITE LE 31 décembre 2025 | emploi | Ouagadougou Secteur d’activité : Mutualité sociale Secteurs d’activités additionnels : Santé et prestations sociales Spécialité concernée : Agent de soutien. Niveau du poste : cadre moyen. Nombre de poste : 01. Recruteur : Mutuelle des (…) 05 postes à pourvoir au sein d’une mutuelle nationale PUBLI&Eacute;E Décembre 2025 | DATE LIMITE LE 12 décembre 2025 | emploi | Ouagadougou POSTE A POURVOIR Un(e) Chef de Département des Prestations sociales et Assurance MISSIONS ET ACTIVITÉS DU POSTE Sous la responsabilité hiérarchique du Directeur Exécutif, le Chef ', 'https://emploi.lefaso.net/?page=offres', '2026-06-15T14:54:12.854Z', 0, 0, '2026-06-15T14:54:12.342Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a1a020964ac32078c695b4f00150d524d2e1d8e4fe96c573c6f285b4114fbaa2', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Conseil du recruteur', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/-Conseil-du-recruteur-.html', 'A classer', 'needs_review', 'Conseil du recruteur - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Accueil > Conseil du recruteur Conseil du recruteur Avis de recrutement d’un(e) Coordonnateur(trice) de Projet 30 août 2021, par Pascal Yé TERMES DE REFERENCE I. CONTEXTE ET JUSTIFICATION L’Association Sos Santé et Développement Paalga (ASD Paalga) est une organisation non gouvernementale (ONG) créée en 1991, qui travaille dans les domaines de : la formation, l’appui conseil, La sécurité alimentaire l’insertion socioprofessionnelle des couches vulnérables, la santé communautaire et l’adaptation aux changements climatiques, la Participation citoyenne et la gouvernance locale, l’Alphabétisation et l’éducation non formelle (…) 6 conseils pour réussir vos entretiens de recrutement 16 novembre', 'https://emploi.lefaso.net/-Conseil-du-recruteur-.html', '2026-06-15T14:54:13.345Z', 0, 0, '2026-06-15T14:54:12.342Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e6e8d93f4f41489002ed66ac6b9779272e812405417ab3882137c8205e4cd3e4', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Les entreprises qui recrutent en ce moment', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Les-entreprises-qui-recrutent-en-ce-moment.html', 'A classer', 'needs_review', 'Les entreprises qui recrutent en ce moment - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Accueil > Générale > Les entreprises qui recrutent en ce moment Les entreprises qui recrutent en ce moment vendredi 14 octobre 2016 UNFPA http://www.unfpa.org/jobs AFDB http://www.afdb.org/fr/ US Embassy https://ouagadougou.usembassy.gov/ GIZ https://www.giz.de/ CEDEAO http://www.ecowas.int/vacances-actuelles/?lang=fr Conseil du recruteur Avis de recrutement d’un(e) Coordonnateur(trice) de Projet TERMES DE REFERENCE I. CONTEXTE ET JUSTIFICATION L’Association Sos Santé et Développement Paalga (ASD Paalga) est une organisation non gouvernementale (ONG) créée en 1991, qui travaille dans (…) LEFASO.NET ● 6 conseils pour réussir vos entretiens de recrutement ● La recherch', 'https://emploi.lefaso.net/Les-entreprises-qui-recrutent-en-ce-moment.html', '2026-06-15T14:54:13.857Z', 0, 0, '2026-06-15T14:54:12.342Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7fce63993977d72365f6127902f50f13e0ac306049d986be8cb5400bba8d1b1b', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Nos partenaires', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Nos-partenaires.html', 'A classer', 'needs_review', 'Nos partenaires - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Accueil > Générale > Nos partenaires Nos partenaires samedi 1er octobre 2016 International Development Law Organisation (IDLO) Conseil du recruteur Avis de recrutement d’un(e) Coordonnateur(trice) de Projet TERMES DE REFERENCE I. CONTEXTE ET JUSTIFICATION L’Association Sos Santé et Développement Paalga (ASD Paalga) est une organisation non gouvernementale (ONG) créée en 1991, qui travaille dans (…) LEFASO.NET ● 6 conseils pour réussir vos entretiens de recrutement ● La recherche d’emploi ? ● Comment négocier une augmentation ? ● 5 règles pour bien gérer son temps Vidéo Conseil Comment réussir son entretien d’embauche ? Les entreprises qui recrutent http://www.ecowas.int/vacances-actuelles/?lan', 'https://emploi.lefaso.net/Nos-partenaires.html', '2026-06-15T14:54:14.351Z', 0, 0, '2026-06-15T14:54:12.342Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cede9ed4839cea1607c1b238172cfcc17f97078fcdc8ef44ba4a4512cacfb191', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Agent(e) de Bureau', 'Mutualité sociale', 'de Ouagadougou', '2025-12-31', '2026-06-15', '2025-12-31', false, 'https://emploi.lefaso.net/01-Agent-e-de-Bureau.html', 'A classer', 'needs_review', '01 Agent(e) de Bureau - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Agent(e) de Bureau 01 Agent(e) de Bureau offre deposee 15 juin 2026 par Mutualité sociale Date de clôture de l’offre : 31 décembre 2025 Secteur d’activité : Mutualité sociale Secteurs d’activités additionnels : Santé et prestations sociales Spécialité concernée : Agent de soutien. Niveau du poste : cadre moyen. Nombre de poste : 01. Recruteur : Mutuelle des Agents des Finances (MUAFI). Structure bénéficiaire : Mutuelle des Agents des Finances (MUAFI). Type de contrat : Contrat à durée déterminée (CDD). Lieu d’affectation : Ouagadougou. Dans le cadre du renforcement de ses capacités administrativ', 'https://emploi.lefaso.net/01-Agent-e-de-Bureau.html', '2026-06-15T14:54:14.851Z', 0, 0, '2026-06-15T14:54:12.342Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4e5f2183c8b69fcd72ffea16d6a5350dbf85cedf814e0b8347c95fe54aaab6e8', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chef de mission', 'GREY', 'Burkina Faso', '2025-11-03', '2026-06-15', '2025-11-03', false, 'https://emploi.lefaso.net/01-Chef-de-mission-et-controleurs-de-chantiers.html', 'A classer', 'needs_review', '01 Chef de mission - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chef de mission 01 Chef de mission offre deposee 15 juin 2026 par GREY Date de clôture de l’offre : 3 novembre 2025 Avis de recrutement pour les postes de chef de mission 1- INTITULE DU POSTE Chef de mission : un (01) 3- LIEU DU POSTE : Ouagadougou 4- MISSIONS PRINCIPALES : Chef de mission • Coordonner et superviser l’ensemble des activités de contrôle technique sur les chantiers. • Assurer la planification, la répartition et le suivi des missions des contrôleurs de travaux. • Garantir la conformité des travaux réalisés avec les normes, plans et cahiers de charges. • Élaborer les plans et devis est', 'https://emploi.lefaso.net/01-Chef-de-mission-et-controleurs-de-chantiers.html', '2026-06-15T14:54:15.363Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('488d0b7d2efa5785b742c5437207b83f05fda5a7f96e02066eea1332d7d74df6', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Dermatologue', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-15', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Dermatologue.html', 'A classer', 'needs_review', '01 Médecin Dermatologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Dermatologue 01 Médecin Dermatologue offre deposee 15 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Dermatologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat de', 'https://emploi.lefaso.net/01-Medecin-Dermatologue.html', '2026-06-15T14:54:15.869Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2abcc1f5b90604f10fecf7d7eb481a07bea79fd482e7729452d36a948e094ade', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Chirurgien maxillo-facial', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-15', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Chirurgien-maxillo-facial.html', 'A classer', 'needs_review', '01 Médecin Chirurgien maxillo-facial - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Chirurgien maxillo-facial 01 Médecin Chirurgien maxillo-facial offre deposee 15 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Chirurgien maxillo-facial : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/', 'https://emploi.lefaso.net/01-Medecin-Chirurgien-maxillo-facial.html', '2026-06-15T14:54:16.370Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d81c08f166e46e37b7c060f846c8fb81d1c8bb67c76b06fb370f50b6fe31d0b6', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Pneumologue', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-15', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Pneumologue.html', 'A classer', 'needs_review', '01 Médecin Pneumologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Pneumologue 01 Médecin Pneumologue offre deposee 15 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Pneumologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat de la ', 'https://emploi.lefaso.net/01-Medecin-Pneumologue.html', '2026-06-15T14:54:16.865Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d5e3434f0fea9c7d4e3fb0924bcaf7bc12508e707279355ef837a4d04f5deaa7', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Hématologue', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-15', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Hematologue.html', 'A classer', 'needs_review', '01 Médecin Hématologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Hématologue 01 Médecin Hématologue offre deposee 15 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Hématologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat de la ', 'https://emploi.lefaso.net/01-Medecin-Hematologue.html', '2026-06-15T14:54:17.363Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4033dcedd93b49709cf8acafd716ae1942c4113a45fc7958af9dd5e22eeaf05b', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin ORL', 'Hôpital Saint Camille de Ouagadougou (HOSCO)', 'Burkina Faso', '2025-10-27', '2026-06-14', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-ORL.html', 'A classer', 'needs_review', '01 Médecin ORL - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin ORL 01 Médecin ORL offre deposee 14 juin 2026 par Hôpital Saint Camille de Ouagadougou (HOSCO) Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin ORL : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat', 'https://emploi.lefaso.net/01-Medecin-ORL.html', '2026-06-15T14:54:17.855Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('85fd9c6a77e7aad5ae92d8d90d8b8206767a11f24b50a956a5630c209bd560e9', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Neurologue', 'Hôpital Saint Camille de Ouagadougou (HOSCO)', 'Burkina Faso', '2025-10-27', '2026-06-15', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Neurologue.html', 'A classer', 'needs_review', '01 Médecin Neurologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Neurologue 01 Médecin Neurologue offre deposee 15 juin 2026 par Hôpital Saint Camille de Ouagadougou (HOSCO) Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Neurologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers so', 'https://emploi.lefaso.net/01-Medecin-Neurologue.html', '2026-06-15T14:54:18.351Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f9a3962e1ac5da02ed8d71c8340e6bc1eb834e88eb9e9427c92491a06e01c272', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chef du service communication', 'HAGE Matériaux', 'Burkina Faso', '2017-09-15', '2026-06-15', '2017-09-15', false, 'https://emploi.lefaso.net/01-Chef-du-service-communication.html', 'A classer', 'needs_review', '01 Chef du service communication - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chef du service communication 01 Chef du service communication offre deposee 15 juin 2026 par HAGE Matériaux Date de clôture de l’offre : 15 septembre 2017 Capacités liées à l’emploi avoir une maîtrise parfaite de l’expression écrite et orale/être immédiatement disponible/être doté d’un bon esprit d’analyse et de synthèse et d’une bonne capacité de gestion du stress/être créatif,curieux et avoir une ouverture d’esprit et le sens de l’écoute/être réactif et doté d’une bonne capacité d’organisation du travail/avoir un très bon niveau de culture générale et une excellente aptitude à la c', 'https://emploi.lefaso.net/01-Chef-du-service-communication.html', '2026-06-15T14:54:18.850Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f17ab841951b63ea811f939c079fd8cce5430cad6359e52685743d474e9eaa40', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chef de publicité', 'Une importante agence de Communication', 'Burkina Faso', '2017-09-14', '2026-06-15', '2017-09-14', false, 'https://emploi.lefaso.net/01-Chef-de-publicite.html', 'A classer', 'needs_review', '01 Chef de publicité - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chef de publicité 01 Chef de publicité offre deposee 15 juin 2026 par Une importante agence de Communication Date de clôture de l’offre : 14 septembre 2017 Capacités liées à l’emploi travail sous pression/très bonne capacité à organiser et gérer les priorités/et avoir un fort esprit d’initiative/être immédiatement disponible/autres Connaissance en informatique NP Condition d’âge NP Composition du dossier un CV détaillé/une lettre de motivation/une copie de la pièce d’identité/une copie des diplômes et des attestations diverses Procedure de recrutement Présélection sur dossier/entretien oral avec ', 'https://emploi.lefaso.net/01-Chef-de-publicite.html', '2026-06-15T14:54:19.355Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('593ef96a6c8dba4633b399c130a2c9ec02e0231ecdefe3abdf0dad9e51a573f1', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Pharmacien', 'Une Entreprise de distribution de matériel et équipements', 'Burkina Faso', '2017-08-29', '2026-06-14', '2017-08-29', false, 'https://emploi.lefaso.net/01-Pharmacien.html', 'A classer', 'needs_review', '01 Pharmacien - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Pharmacien 01 Pharmacien offre deposee 14 juin 2026 par Une Entreprise de distribution de matériel et équipements Date de clôture de l’offre : 29 août 2017 Capacités liées à l’emploi être inscrit sur le Tableau de l’Ordre des Pharmaciens du Burkina et en règle vis-à-vis de l’Ordre/aptitude à travailler sous pression/autres Connaissance en informatique NP Condition d’âge NP Diplôme ou niveau Doctorat Composition du dossier CV sincère et acutalisé daté et signé/lettre de motivation/photocopie légalisée du diplôme et des attestations de travail/Merci d’envoyer votre candidature à : dos_consultants@yahoo.fr', 'https://emploi.lefaso.net/01-Pharmacien.html', '2026-06-15T14:54:19.854Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ab48e2c72919fe404f373472504b422ed4f614ab042cd2b77cd353efd969377c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chargé de recouvrement', 'Une institution de la place', 'Burkina Faso', '2017-08-26', '2026-06-14', '2017-08-26', false, 'https://emploi.lefaso.net/01-Charge-de-recouvrement.html', 'A classer', 'needs_review', '01 Chargé de recouvrement - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chargé de recouvrement 01 Chargé de recouvrement offre deposee 14 juin 2026 par Une institution de la place Date de clôture de l’offre : 26 août 2017 Capacités liées à l’emploi diplôme reconnu par l’Etat Burkinabè ou un diplôme équivalent/avoir une capacité d’organisation,de rigueur,de flexibilité,d’anticipation de réactivité et une forte autonomie/avoir une capacité de communication aisée,de travail en équipe,d’analyse et de synthèse/être disponible et dynamique/être de bonne moralité/être de nationalité burkinabè/autres Connaissance en informatique Maîtriser le logiciel spécifique de recou', 'https://emploi.lefaso.net/01-Charge-de-recouvrement.html', '2026-06-15T14:54:20.405Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1eccd425b51fa7a9a8080f5b6034b7f8aa956935cee07811964c8e9d05cbe805', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '02 Médecin Oncologues médical et chirurgical', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-15', '2025-10-27', false, 'https://emploi.lefaso.net/02-Medecin-Oncologues-medical-et-chirurgical.html', 'A classer', 'needs_review', '02 Médecin Oncologues médical et chirurgical - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 02 Médecin Oncologues médical et chirurgical 02 Médecin Oncologues médical et chirurgical offre deposee 15 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Oncologues médical et chirurgical : 02 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être', 'https://emploi.lefaso.net/02-Medecin-Oncologues-medical-et-chirurgical.html', '2026-06-15T14:54:20.894Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('938d2113df7330a264c07438281f1fc339061e96c2c2c98171fa631bb14fe90c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '02 Chefs de mission ou chefs de projet', 'Cabinet YONS Associates', 'Burkina Faso', '2018-04-30', '2026-06-15', '2018-04-30', false, 'https://emploi.lefaso.net/02-Chefs-de-mission-ou-chefs-de-projet.html', 'A classer', 'needs_review', '02 Chefs de mission ou chefs de projet - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 02 Chefs de mission ou chefs de projet 02 Chefs de mission ou chefs de projet offre deposee 15 juin 2026 par Cabinet YONS Associates Date de clôture de l’offre : 30 avril 2018 Le cabinet Yons Associates recrute pour le compte d’une importante société basée à Kossodo les profils suivants : 02 Chefs de mission ou chefs de projet Qualifications, compétences et aptitudes – Etre titulaire d’un diplôme d’Ingénieur Génie Hydraulique, Génie Civil ou Génie Rural, – Justifier d’une expérience professionnelle de cinq (05) ans dans le domaine du BTP, Mission : assurer le pilotage, organisation', 'https://emploi.lefaso.net/02-Chefs-de-mission-ou-chefs-de-projet.html', '2026-06-15T14:54:21.414Z', 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9074a05022ddb182e61ec7ca93e0d49afc4c1b572313181f86b435407a28cb12', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '02 Ingénieurs chargés d&#8217;affaires/Mines', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/02-Ingenieurs-charges-d-affaires-Mines.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/02-Ingenieurs-charges-d-affaires-Mines.html', now(), 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f69dcfb6d18b779ffe1212c219f723a12067babeecf3d16cddb05e8ba3d64f3a', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', now(), 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('262cf87917b5317227eec7102f0130576671c8e696a6de23335848434a668b6a', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '6 conseils pour réussir vos entretiens de recrutement', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/6-conseils-pour-reussir-vos-entretiens-de-recrutement.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/6-conseils-pour-reussir-vos-entretiens-de-recrutement.html', now(), 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('56c0c9800a8b0224254c6b1170a8a5a43cd3df682affe3837a0bd065373a967c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'La recherche d’emploi ?', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Comment-rechercher-efficacement-un-stage-ou-un-emploi.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Comment-rechercher-efficacement-un-stage-ou-un-emploi.html', now(), 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bac8b8a935d09327783b4e086125d12822c194e312ba0f2570baa623b514f998', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Comment négocier une augmentation ?', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Comment-negocier-une-augmentation.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Comment-negocier-une-augmentation.html', now(), 0, 0, '2026-06-15T14:54:12.343Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('53bcf2a79795e6ff7fd9e9257327f8647632cfb65aaf71e14d360ab80487b913', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '5 règles pour bien gérer son temps', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/5-regles-pour-bien-gerer-son-temps.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/5-regles-pour-bien-gerer-son-temps.html', now(), 0, 0, '2026-06-15T14:54:12.344Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6b6e08e25e0295e52becdec508a65984c12fa2c18dc4535d3d20ade0a81a010f', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Comment réussir son entretien d&#8217;embauche ?', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Comment-reussir-son-entretien-d-embauche.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Comment-reussir-son-entretien-d-embauche.html', now(), 0, 0, '2026-06-15T14:54:12.344Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;

-- Curated jobs
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('593ea82e-2292-4568-8c01-ee8b6492db6d'::uuid, 'a8c215957c183ce487b40f2097393bea1adc9878e69ca349579b0b1235bd2dcb', 'Coordinateur Administratif et Logistique', 'BFemploi', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', '2026-05-18', '2026-08-17', '17 août 2026', 'https://www.bfemploi.com/annonce-details-3866.html', 'https://www.bfemploi.com/annonce-details-3866.html', 'Coordinateur Administratif et Logistique - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - G', array['ONG', 'Burkina Faso', 'BFemploi', 'coordinateur', 'logistique', 'administratif', 'concours']::text[], 70, 0, 'review', '2026-06-15T14:52:06.124Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('91aefe66-1c79-4f15-80e4-8721364b84b4'::uuid, '4a1ec186344a99a0fe4622a72b0da387d2849a7d6663710e71ce89b523e804c2', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'BTP et chantier', 'Mission', 'Non communique', '2026-06-15', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', null, array['BTP et chantier', 'Ouagadougou', 'Emploiburkina', 'climatisation', 'commercial']::text[], 45, 0, 'review', '2026-06-15T14:52:25.947Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('7b5e05c3-3186-4ca9-8ac4-a7ae3dfd553c'::uuid, '061e235e156b12410f22983e3dd8518c325806ae32c690540738557ce40a499a', 'Programme de bourses de l&rsquo;OIBT', 'HumanitaireHub', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', '2026-06-15', '2026-07-20', '20 juillet 2026', 'https://humanitairehub.com/emploi/programme-de-bourses-de-loibt/', 'https://humanitairehub.com/emploi/programme-de-bourses-de-loibt/', 'Programme de bourses de l''OIBT - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Programme de bourses de l&rsquo;OIBT ← Retour aux offres OIBT Programme de bourses de l&rsquo;OIBT 📍 Pays Membres de l''OIBT · 📄 Bourses/Etudes ⏰ Deadline 20 Juin 2026 J-5 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste BOURSE OIBT 2026 : JUSQU’À 10 000 USD POUR VOS ÉTUDES, RECHERCHES, FORMATIONS ET CONFÉRENCES EN FORESTERIE TROPICALE ! L’Organisation Internationale des Bois Tropicaux (OIBT) lance son Programme de Bourses 2026 à travers le Fonds Freezailah pour les Bourses. Cette opportunité vise à renforcer', array['ONG', 'Burkina Faso', 'HumanitaireHub', 'humanitaire', 'programme']::text[], 70, 0, 'review', '2026-06-15T14:53:35.245Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('8bcc3b88-b82e-4794-8c6a-9dd3705e2109'::uuid, 'f69dcfb6d18b779ffe1212c219f723a12067babeecf3d16cddb05e8ba3d64f3a', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet', 'LeFaso.net Recrutement', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', '2026-06-15', null, 'A verifier', 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', null, array['ONG', 'Burkina Faso', 'LeFaso.net Recrutement', 'projet']::text[], 45, 0, 'review', '2026-06-15T14:54:12.343Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('6b07b09a-8f62-43cb-8004-79fb421cb50b'::uuid, '5114bd3206f770cea9589ae9281ad2010314447a0fd584998f1f9d722af673b0', 'Responsable de Recherche', 'BFemploi', 'Ouagadougou', 'Bureau', 'A verifier', 'Non communique', '2026-06-04', '2026-06-30', '30 juin 2026', 'https://www.bfemploi.com/annonce-details-3871.html', 'https://www.bfemploi.com/annonce-details-3871.html', 'Responsable de Recherche - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Co', array['Bureau', 'Ouagadougou', 'BFemploi', 'concours']::text[], 70, 0, 'review', '2026-06-15T14:52:06.124Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('2a8047ac-ead5-4ca8-8f5a-b7613baf929d'::uuid, 'ea6a30c7451c86ed0fea05f411b14c25be3a42a4596e7e0ea03d816c687fe661', 'Sécretaire Comptable- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Finance et administration', 'CDD', 'Non communique', '2026-06-15', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-303588', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-303588', null, array['Finance et administration', 'Ouagadougou', 'Emploiburkina', 'comptable', 'secretaire']::text[], 45, 0, 'review', '2026-06-15T14:52:25.947Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('eae9c75e-ccb5-4156-8390-86eb6f8fe3ff'::uuid, '070adfeb77197106df20c475a9cae7be7fd38fa9112c0291a168a9894f3f9595', 'OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ,', 'HumanitaireHub', 'Burkina Faso', 'ONG', 'CDD', 'Non communique', '2026-06-29', '2026-06-29', '29 juin 2026', 'https://humanitairehub.com/emploi/oordonnateur-de-programme-du-secteur-prive/', 'https://humanitairehub.com/emploi/oordonnateur-de-programme-du-secteur-prive/', 'OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, ← Retour aux offres Oxfam International OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, 📍 Ghana · 📄 CDD ⏰ Deadline 29 Juin 2026 J-14 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Management & Coordination Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : OORDONNATEUR DE PROGRAMME DU SECTEUR PRIVÉ, ACCRA, GHANA Lieu du Travail : Ghana Date de Soumission : 29/06/2026 Description de l’emploi Oxfam est un mouvement mondial qui rassemble des personnes œuvrant ensemble pour mettre fin', array['ONG', 'Burkina Faso', 'HumanitaireHub', 'humanitaire', 'programme']::text[], 70, 0, 'review', '2026-06-15T14:53:35.245Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('8b269a20-a282-4152-8f4a-fc8f8cd09864'::uuid, 'ac8e8a256b510daa371cf72207a33bceea3a9c2e12142b2e5a3035a07c01d797', 'Enquêteurs / Chercheurs de terrain', 'BFemploi', 'Burkina Faso', 'Metiers terrain et informels', 'Mission', 'Non communique', '2026-06-03', '2026-06-26', '26 juin 2026', 'https://www.bfemploi.com/annonce-details-3870.html', 'https://www.bfemploi.com/annonce-details-3870.html', 'Enquêteurs / Chercheurs de terrain - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides', array['Metiers terrain et informels', 'Burkina Faso', 'BFemploi', 'terrain', 'concours']::text[], 70, 0, 'review', '2026-06-15T14:52:06.124Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('4d8bb0a2-2e68-4121-85ed-79e64a35e415'::uuid, '55269b4fca460f79148fbb8c606d39713477605c18ae35263b0fba5a645c0927', 'Executive Secretary- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Bureau', 'A verifier', 'Non communique', '2026-06-15', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/executive-secretary-ouagadougou-303736', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/executive-secretary-ouagadougou-303736', null, array['Bureau', 'Ouagadougou', 'Emploiburkina']::text[], 45, 0, 'review', '2026-06-15T14:52:25.947Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('5c0a7e1e-d18e-4cba-89a6-48fe91abcf55'::uuid, '085b3a6f88412be227a0ad7cab435ebb74a788f01ccf518af6e1668bf4bc59f7', 'Responsable Relations Bailleurs H/F Tout Pays', 'BFemploi', 'Burkina Faso', 'ONG', 'CDD', 'Non communique', '2026-06-09', '2026-06-22', '22 juin 2026', 'https://www.bfemploi.com/annonce-details-3874.html', 'https://www.bfemploi.com/annonce-details-3874.html', 'Responsable Relations Bailleurs H/F Tout Pays - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Info', array['ONG', 'Burkina Faso', 'BFemploi', 'bailleur', 'concours']::text[], 70, 0, 'review', '2026-06-15T14:52:06.124Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('6b06210f-2bd2-4b73-8f8a-fdd7322033c0'::uuid, 'dd07b60720e6a48b03e5f25fb941efa31fdc58338bc343c11ad3633f55d780af', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi', 'Emploiburkina', 'Bagassi', 'Transport et logistique', 'CDD', 'Non communique', '2026-06-15', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', null, array['Transport et logistique', 'Bagassi', 'Emploiburkina', 'magasinier']::text[], 45, 0, 'review', '2026-06-15T14:52:25.947Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('b5c0563e-a39c-4a12-889c-12bef75c1db5'::uuid, 'e05b148dd6adcaf86461ccc0c28b34a570a5838beaa18635d365ab219b1f8df6', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a', 'BFemploi', 'Burkina Faso', 'Bureau', 'Consultation', 'Non communique', '2026-06-12', '2026-06-21', '21 juin 2026', 'https://www.bfemploi.com/annonce-details-3876.html', 'https://www.bfemploi.com/annonce-details-3876.html', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche C', array['Bureau', 'Burkina Faso', 'BFemploi', 'concours']::text[], 70, 0, 'review', '2026-06-15T14:52:06.124Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('0ef2e8f6-8203-4ff9-8821-acaf13e92c2f'::uuid, '416c39ed141e3c248a2d74ed7a393055a000647a7b5f0af202dd0a05509eee00', 'Manager- Work From Home', 'Emploiburkina', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', '2026-06-15', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', null, array['Bureau', 'Burkina Faso', 'Emploiburkina']::text[], 45, 0, 'review', '2026-06-15T14:52:25.947Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('263d5313-6512-4118-87bc-e76ad1124754'::uuid, 'b511815ecc63b96528e92d1dc57c70a84d96bba339499d4479ed34c313701920', 'Cash Academy Program Coordinator', 'BFemploi', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', '2026-06-11', '2026-06-16', '16 juin 2026', 'https://www.bfemploi.com/annonce-details-3875.html', 'https://www.bfemploi.com/annonce-details-3875.html', 'Cash Academy Program Coordinator - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Ex', array['Bureau', 'Burkina Faso', 'BFemploi', 'concours']::text[], 70, 0, 'review', '2026-06-15T14:52:06.124Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('709464a8-4c70-40ea-82fc-e9a0050732b1'::uuid, '562f67805435acedf337c043c78a3122ae7eda45732a33ce03d7e387e7d814c0', 'Secrétaire- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Finance et administration', 'CDD', 'Non communique', '2026-06-15', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-ouagadougou-304085', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-ouagadougou-304085', null, array['Finance et administration', 'Ouagadougou', 'Emploiburkina', 'secretaire']::text[], 45, 0, 'review', '2026-06-15T14:52:25.947Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('9476d1cc-ad0f-43db-8d1e-b1053b45cf56'::uuid, 'dd10c6132fdffff7f47de0af4e4f1e2e289b31fa9e98b4753c3d5fa94c7ff271', 'Programme Officer - School Meals', 'BFemploi', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', '2026-06-08', '2026-06-16', '16 juin 2026', 'https://www.bfemploi.com/annonce-details-3873.html', 'https://www.bfemploi.com/annonce-details-3873.html', 'Programme Officer - School Meals - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Ex', array['ONG', 'Burkina Faso', 'BFemploi', 'programme', 'officer', 'concours']::text[], 70, 0, 'review', '2026-06-15T14:52:06.124Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('fb751adf-b6cd-4579-862f-0dc22b2e91c3'::uuid, 'db86e6a3396863c8983e2d1bb0d497e701884b8e6e3798465e0547d19e140cb3', 'ANGULAR Developer (M/F)', 'Emploiburkina', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', '2026-06-15', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', null, array['Bureau', 'Burkina Faso', 'Emploiburkina']::text[], 45, 0, 'review', '2026-06-15T14:52:25.947Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();
insert into jobs (id, raw_item_id, title, company, city, category, job_type, salary, opening_date, closing_date, deadline_label, source_url, canonical_url, summary, tags, confidence_score, risk_score, status, published_at, updated_at)
values ('00083432-89be-442b-855f-bbadad7a4d53'::uuid, '7f08c84ad3f5e743609f4a14aa4637642de5902afa4b9b359f66f390ddd15775', 'Specialiste Safeguarding Regional', 'BFemploi', 'Burkina Faso', 'Bureau', 'CDD', 'Non communique', '2026-06-01', '2026-06-15', '15 juin 2026', 'https://www.bfemploi.com/annonce-details-3869.html', 'https://www.bfemploi.com/annonce-details-3869.html', 'Specialiste Safeguarding Regional - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides E', array['Bureau', 'Burkina Faso', 'BFemploi', 'concours']::text[], 70, 0, 'review', '2026-06-15T14:52:06.124Z', now())
on conflict (raw_item_id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  category = excluded.category,
  job_type = excluded.job_type,
  salary = excluded.salary,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  deadline_label = excluded.deadline_label,
  source_url = excluded.source_url,
  canonical_url = excluded.canonical_url,
  summary = excluded.summary,
  tags = excluded.tags,
  confidence_score = excluded.confidence_score,
  risk_score = excluded.risk_score,
  status = excluded.status,
  updated_at = now();

-- SEO pages
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('index.html', 'JobFaso - Emploi, recrutement, concours et stages au Burkina Faso', 'JobFaso centralise les offres d', 'home', 'https://jobfaso.com/index.html', '2026-06-12', 'weekly', 1, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('jobs.html', 'Offres d''emploi au Burkina Faso - JobFaso', 'Toutes les offres d', 'jobs', 'https://jobfaso.com/jobs.html', '2026-06-12', 'weekly', 0.9, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('conseils.html', 'Conseils emploi Burkina Faso - CV, entretien, concours | JobFaso', 'Guides pratiques pour CV, lettres, entretiens, concours, ONG et candidatures professionnelles au Burkina Faso.', 'page', 'https://jobfaso.com/conseils.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('grille-tarifaire.html', 'Tarifs recruteurs et publicite emploi - JobFaso', 'Packs annonces, offres sponsorisees, diffusion WhatsApp, publicite native et solutions recruteurs sur JobFaso.', 'page', 'https://jobfaso.com/grille-tarifaire.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('annonceurs.html', 'Publier une offre d''emploi au Burkina Faso - JobFaso', 'Publiez une annonce, sponsorisez une offre, recevez des leads candidats et touchez une audience emploi au Burkina Faso.', 'page', 'https://jobfaso.com/annonceurs.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('contacts.html', 'Contact JobFaso - Publier, signaler ou proposer une source', 'Contactez JobFaso pour publier une offre, signaler une annonce, proposer une source emploi ou devenir partenaire.', 'page', 'https://jobfaso.com/contacts.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('contact.html', 'Contact JobFaso - Recruteurs, candidats et partenaires', 'Formulaire de contact JobFaso pour candidats, recruteurs, sources emploi et partenaires au Burkina Faso.', 'page', 'https://jobfaso.com/contact.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('privacy.html', 'Confidentialite - JobFaso', 'Politique de confidentialite JobFaso pour candidats, recruteurs et visiteurs.', 'page', 'https://jobfaso.com/privacy.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('terms.html', 'Mentions legales et conditions - JobFaso', 'Conditions d', 'page', 'https://jobfaso.com/terms.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/appel-a-propositions-pour-la-mise-en-uvre-d-une-enquete-de-couverture-post-campagne-de-sup-e05b148d.html', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a - Burkina Faso | JobFaso', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/appel-a-propositions-pour-la-mise-en-uvre-d-une-enquete-de-couverture-post-campagne-de-sup-e05b148d.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/technico-commercial-en-climatisation-haut-de-gamme-ouagadougou-4a1ec186.html', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou - Ouagadougou | JobFaso', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/technico-commercial-en-climatisation-haut-de-gamme-ouagadougou-4a1ec186.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/assistant-financier-malaria-consortium-6460fa0f.html', 'Assistant Financier – Malaria Consortium - Ouagadougou | JobFaso', 'Assistant Financier – Malaria Consortium chez HumanitaireHub au Ouagadougou. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/assistant-financier-malaria-consortium-6460fa0f.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/avis-de-recrutement-d-un-e-coordonnateur-trice-de-projet-f69dcfb6.html', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet - Burkina Faso | JobFaso', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet chez LeFaso.net Recrutement au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/avis-de-recrutement-d-un-e-coordonnateur-trice-de-projet-f69dcfb6.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/ifdc-vacancy-jeune-professionnel-agent-terrain-jp-1aef4001.html', 'IFDC Vacancy: Jeune Professionnel Agent Terrain (JP) - Ouagadougou | JobFaso', 'IFDC Vacancy: Jeune Professionnel Agent Terrain (JP) chez UNjobs Burkina Faso au Ouagadougou. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/ifdc-vacancy-jeune-professionnel-agent-terrain-jp-1aef4001.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/cash-academy-program-coordinator-b511815e.html', 'Cash Academy Program Coordinator - Burkina Faso | JobFaso', 'Cash Academy Program Coordinator chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/cash-academy-program-coordinator-b511815e.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/sales-manager-ouagadougou-5f975014.html', 'Sales Manager- Ouagadougou - Ouagadougou | JobFaso', 'Sales Manager- Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/sales-manager-ouagadougou-5f975014.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/assistant-financier-smc-malaria-consortium-0c6185d2.html', 'Assistant Financier SMC – Malaria Consortium - Ouagadougou | JobFaso', 'Assistant Financier SMC – Malaria Consortium chez HumanitaireHub au Ouagadougou. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/assistant-financier-smc-malaria-consortium-0c6185d2.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/communications-and-marketing-specialist-pathfinder-portuguese-et-english-countries-1d382472.html', 'Communications and Marketing Specialist, Pathfinder Portuguese &amp; English Countries - Burkina Faso | JobFaso', 'Communications and Marketing Specialist, Pathfinder Portuguese &amp; English Countries chez UNjobs Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/communications-and-marketing-specialist-pathfinder-portuguese-et-english-countries-1d382472.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/responsable-relations-bailleurs-h-f-tout-pays-085b3a6f.html', 'Responsable Relations Bailleurs H/F Tout Pays - Burkina Faso | JobFaso', 'Responsable Relations Bailleurs H/F Tout Pays chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/responsable-relations-bailleurs-h-f-tout-pays-085b3a6f.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/secretaire-comptable-ouagadougou-17344c89.html', 'Secrétaire Comptable- Ouagadougou - Ouagadougou | JobFaso', 'Secrétaire Comptable- Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/secretaire-comptable-ouagadougou-17344c89.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/programme-officer-school-meals-dd10c613.html', 'Programme Officer - School Meals - Burkina Faso | JobFaso', 'Programme Officer - School Meals chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/programme-officer-school-meals-dd10c613.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/executive-secretary-ouagadougou-55269b4f.html', 'Executive Secretary- Ouagadougou - Ouagadougou | JobFaso', 'Executive Secretary- Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/executive-secretary-ouagadougou-55269b4f.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/responsable-de-recherche-5114bd32.html', 'Responsable de Recherche - Ouagadougou | JobFaso', 'Responsable de Recherche chez BFemploi au Ouagadougou. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/responsable-de-recherche-5114bd32.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/magazine-keeper-junior-magasinier-h-f-bagassi-dd07b607.html', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi - Bagassi | JobFaso', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi chez Emploiburkina au Bagassi. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/magazine-keeper-junior-magasinier-h-f-bagassi-dd07b607.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/enqueteurs-chercheurs-de-terrain-ac8e8a25.html', 'Enquêteurs / Chercheurs de terrain - Burkina Faso | JobFaso', 'Enquêteurs / Chercheurs de terrain chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/enqueteurs-chercheurs-de-terrain-ac8e8a25.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/manager-work-from-home-416c39ed.html', 'Manager- Work From Home - Burkina Faso | JobFaso', 'Manager- Work From Home chez Emploiburkina au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/manager-work-from-home-416c39ed.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/specialiste-safeguarding-regional-7f08c84a.html', 'Specialiste Safeguarding Regional - Burkina Faso | JobFaso', 'Specialiste Safeguarding Regional chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/specialiste-safeguarding-regional-7f08c84a.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/angular-developer-m-f-db86e6a3.html', 'ANGULAR Developer (M/F) - Burkina Faso | JobFaso', 'ANGULAR Developer (M/F) chez Emploiburkina au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/angular-developer-m-f-db86e6a3.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/jobs/coordinateur-administratif-et-logistique-a8c21595.html', 'Coordinateur Administratif et Logistique - Burkina Faso | JobFaso', 'Coordinateur Administratif et Logistique chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes JobFaso.', 'job', 'https://jobfaso.com/pages/jobs/coordinateur-administratif-et-logistique-a8c21595.html', '2026-06-12', 'daily', 0.8, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/categories/btp-et-chantier.html', 'Emplois BTP et chantier au Burkina Faso | JobFaso', 'Suivez les opportunites chantier, construction, genie civil, climatisation, topographie et travaux terrain. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://jobfaso.com/pages/categories/btp-et-chantier.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/categories/bureau.html', 'Emplois bureau au Burkina Faso | JobFaso', 'Retrouvez les opportunites de bureau, administration, commerce, finance, IT et gestion au Burkina Faso. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://jobfaso.com/pages/categories/bureau.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/categories/commerce-et-vente.html', 'Emplois commerce et vente au Burkina Faso | JobFaso', 'Postes commerciaux, caissiers, vendeurs, recouvrement, relation client et marketing terrain. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://jobfaso.com/pages/categories/commerce-et-vente.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/categories/finance-et-administration.html', 'Emplois finance et administration au Burkina Faso | JobFaso', 'Comptabilite, secretariat, finance, juridique, gestion, administration et support bureau. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://jobfaso.com/pages/categories/finance-et-administration.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/categories/metiers-terrain-et-informels.html', 'Metiers terrain et emplois informels au Burkina Faso | JobFaso', 'Missions et profils terrain : plombiers, soudeurs, macons, chauffeurs, artisans, ouvriers et services locaux. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://jobfaso.com/pages/categories/metiers-terrain-et-informels.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/categories/ong.html', 'Emplois ONG et humanitaire au Burkina Faso | JobFaso', 'Suivez les postes ONG, ONU, projets de developpement et organisations internationales lies au Burkina Faso. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://jobfaso.com/pages/categories/ong.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/categories/transport-et-logistique.html', 'Emplois transport et logistique au Burkina Faso | JobFaso', 'Chauffeurs, conducteurs, magasiniers, fleet, stock, approvisionnement et logistique projet. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://jobfaso.com/pages/categories/transport-et-logistique.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/villes/bagassi.html', 'Emploi Bagassi | JobFaso', 'Offres d&#039;emploi, concours, stages et missions a Bagassi. Recevez les alertes JobFaso sur WhatsApp.', 'city', 'https://jobfaso.com/pages/villes/bagassi.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/villes/burkina-faso.html', 'Emploi Burkina Faso | JobFaso', 'Offres d&#039;emploi, concours, stages et missions a Burkina Faso. Recevez les alertes JobFaso sur WhatsApp.', 'city', 'https://jobfaso.com/pages/villes/burkina-faso.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/villes/ouagadougou.html', 'Emploi Ouagadougou | JobFaso', 'Offres d&#039;emploi, concours, stages et missions a Ouagadougou. Recevez les alertes JobFaso sur WhatsApp.', 'city', 'https://jobfaso.com/pages/villes/ouagadougou.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/guides/faire-un-cv-au-burkina-faso.html', 'Comment faire un bon CV au Burkina Faso | JobFaso', 'Structure simple pour creer un CV clair, lisible et adapte aux recruteurs au Burkina Faso.', 'guide', 'https://jobfaso.com/pages/guides/faire-un-cv-au-burkina-faso.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/guides/eviter-fausses-offres-emploi.html', 'Comment eviter les fausses offres d&#039;emploi | JobFaso', 'Signaux d&#039;alerte, verification des sources et bons reflexes avant de candidater.', 'guide', 'https://jobfaso.com/pages/guides/eviter-fausses-offres-emploi.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/guides/postuler-ong-burkina.html', 'Comment postuler a une ONG au Burkina Faso | JobFaso', 'Conseils pour candidater aux ONG, projets internationaux et organisations humanitaires.', 'guide', 'https://jobfaso.com/pages/guides/postuler-ong-burkina.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/guides/preparer-un-concours.html', 'Comment preparer un concours au Burkina Faso | JobFaso', 'Organisation, documents, revision et suivi des communiques officiels.', 'guide', 'https://jobfaso.com/pages/guides/preparer-un-concours.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/guides/rediger-une-lettre-de-motivation.html', 'Rediger une lettre de motivation efficace | JobFaso', 'Methode simple pour ecrire une lettre claire, courte et adaptee a l&#039;offre visee.', 'guide', 'https://jobfaso.com/pages/guides/rediger-une-lettre-de-motivation.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/guides/preparer-un-entretien-emploi.html', 'Preparer un entretien d&#039;embauche | JobFaso', 'Questions frequentes, attitude professionnelle et documents a preparer avant un entretien.', 'guide', 'https://jobfaso.com/pages/guides/preparer-un-entretien-emploi.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/guides/documents-pour-postuler.html', 'Documents a preparer pour postuler | JobFaso', 'Liste pratique des documents souvent demandes pour emplois, stages, ONG et concours.', 'guide', 'https://jobfaso.com/pages/guides/documents-pour-postuler.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();
insert into seo_pages (path, title, description, page_type, canonical_url, lastmod, changefreq, priority, is_indexable, updated_at)
values ('pages/guides/secteurs-qui-recrutent-burkina-faso.html', 'Secteurs qui recrutent au Burkina Faso | JobFaso', 'Pistes pour suivre les secteurs actifs : ONG, administration, finance, IT, commerce, BTP et logistique.', 'guide', 'https://jobfaso.com/pages/guides/secteurs-qui-recrutent-burkina-faso.html', '2026-06-12', 'weekly', 0.7, true, now())
on conflict (path) do update set
  title = excluded.title,
  description = excluded.description,
  page_type = excluded.page_type,
  canonical_url = excluded.canonical_url,
  lastmod = excluded.lastmod,
  changefreq = excluded.changefreq,
  priority = excluded.priority,
  is_indexable = excluded.is_indexable,
  updated_at = now();

commit;
