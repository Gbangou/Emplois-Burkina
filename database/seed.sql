-- JobFaso seed generated from local JSON data.
-- Generated at 2026-06-12T13:49:31.928Z.
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
values ('afriqueemplois', 'Afrique Emplois', 'https://www.afriqueemplois.com/', 'job_board', 1, 'review_required', array['emploi', 'job', 'offre', 'concours', 'recrutement']::text[], array['inscription', 'login', 'cv', 'formation', 'contact']::text[], 'Contient des offres Burkina, concours et opportunites regionales.', now())
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
values ('reliefweb-burkina', 'ReliefWeb Burkina Faso', 'https://reliefweb.int/jobs?advanced-search=%28C162%29', 'ngo', 1, 'review_required', array['job', 'jobs', 'burkina-faso']::text[], array['training', 'reports', 'updates']::text[], 'Source humanitaire mondiale. Collecter seulement titres, deadlines et liens officiels.', now())
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
values ('jooble-burkina', 'Jooble Burkina Faso', 'https://bf.jooble.org/', 'aggregator', 2, 'manual_only', array['emploi', 'job', 'burkina']::text[], array['login']::text[], 'Agregateur mondial. Utile pour veille, a eviter en extraction massive.', now())
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
values ('optioncarriere-burkina', 'Optioncarriere Burkina Faso', 'https://www.optioncarriere.bf/', 'aggregator', 2, 'manual_only', array['emploi', 'offre', 'burkina']::text[], array['login']::text[], 'Agregateur emploi. Lier les offres vers les sources originales quand possible.', now())
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
values ('jumia-deals-burkina-emploi', 'Jumia Deals Burkina Emploi', 'https://deals.jumia.bf/', 'classifieds', 2, 'manual_only', array['emploi', 'service', 'plombier', 'macon', 'soudeur', 'chauffeur']::text[], array['login', 'account']::text[], 'Petites annonces utiles pour reperer les besoins terrain et services locaux. A verifier manuellement selon disponibilite du site.', now())
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
values ('0a823de0f1a9beae68fc625e77b86577523cff4ec19f8c3b0958db47b614da8e', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Liste des annonces', 'BFemploi', 'Administration-Gestion', null, '2026-06-12', null, false, 'https://www.bfemploi.com/emplois-annonces.html', 'A classer', 'needs_review', 'Liste des annonces - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours', 'https://www.bfemploi.com/emplois-annonces.html', '2026-06-12T09:28:41.100Z', 0, 0, '2026-06-12T09:28:40.358Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('13d18bc699b8f81821d2385d49b19a04ca2bb5c12153c05e0debad252e0e4c80', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'BFemploi.com', 'BFemploi', 'Burkina Faso', null, null, null, false, 'https://www.bfemploi.com/examens-concours', 'A classer', 'needs_review', 'BFemploi.com - Liste des pages - Infos Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Con', 'https://www.bfemploi.com/examens-concours', '2026-06-12T09:28:41.820Z', 0, 0, '2026-06-12T09:28:40.358Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('aca4c3653df020e64c88f764b32fce4deb50f0fafb7c2879670cd13d18cc1c80', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'BFemploi.com', 'BFemploi', 'Burkina Faso', null, null, null, false, 'https://www.bfemploi.com/examens-concours', 'A classer', 'needs_review', 'BFemploi.com - Liste des pages - Infos Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Con', 'https://www.bfemploi.com/examens-concours', '2026-06-12T09:28:42.531Z', 0, 0, '2026-06-12T09:28:40.353Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e05b148dd6adcaf86461ccc0c28b34a570a5838beaa18635d365ab219b1f8df6', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a', 'BFemploi', 'Burkina Faso', null, '2026-06-12', null, false, 'https://www.bfemploi.com/annonce-details-3876.html', 'A classer', 'needs_review', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche C', 'https://www.bfemploi.com/annonce-details-3876.html', '2026-06-12T09:28:43.248Z', 0, 0, '2026-06-12T09:28:40.355Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b511815ecc63b96528e92d1dc57c70a84d96bba339499d4479ed34c313701920', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Cash Academy Program Coordinator', 'BFemploi', 'Burkina Faso', null, '2026-06-11', null, false, 'https://www.bfemploi.com/annonce-details-3875.html', 'A classer', 'needs_review', 'Cash Academy Program Coordinator - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Ex', 'https://www.bfemploi.com/annonce-details-3875.html', '2026-06-12T09:28:43.966Z', 0, 0, '2026-06-12T09:28:40.357Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('085b3a6f88412be227a0ad7cab435ebb74a788f01ccf518af6e1668bf4bc59f7', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Responsable Relations Bailleurs H/F Tout Pays', 'BFemploi', 'Burkina Faso', null, '2026-06-09', null, false, 'https://www.bfemploi.com/annonce-details-3874.html', 'A classer', 'needs_review', 'Responsable Relations Bailleurs H/F Tout Pays - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Info', 'https://www.bfemploi.com/annonce-details-3874.html', '2026-06-12T09:28:44.795Z', 0, 0, '2026-06-12T09:28:40.357Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('dd10c6132fdffff7f47de0af4e4f1e2e289b31fa9e98b4753c3d5fa94c7ff271', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Programme Officer - School Meals', 'BFemploi', 'Burkina Faso', null, '2026-06-08', null, false, 'https://www.bfemploi.com/annonce-details-3873.html', 'A classer', 'needs_review', 'Programme Officer - School Meals - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Ex', 'https://www.bfemploi.com/annonce-details-3873.html', '2026-06-12T09:28:45.469Z', 0, 0, '2026-06-12T09:28:40.357Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5114bd3206f770cea9589ae9281ad2010314447a0fd584998f1f9d722af673b0', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Responsable de Recherche', 'BFemploi', 'Ouagadougou', null, '2026-06-04', null, false, 'https://www.bfemploi.com/annonce-details-3871.html', 'A classer', 'needs_review', 'Responsable de Recherche - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Co', 'https://www.bfemploi.com/annonce-details-3871.html', '2026-06-12T09:28:46.322Z', 0, 0, '2026-06-12T09:28:40.357Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ac8e8a256b510daa371cf72207a33bceea3a9c2e12142b2e5a3035a07c01d797', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Enquêteurs / Chercheurs de terrain', 'BFemploi', 'Burkina Faso', null, '2026-06-03', null, false, 'https://www.bfemploi.com/annonce-details-3870.html', 'A classer', 'needs_review', 'Enquêteurs / Chercheurs de terrain - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides ', 'https://www.bfemploi.com/annonce-details-3870.html', '2026-06-12T09:28:46.985Z', 0, 0, '2026-06-12T09:28:40.357Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7f08c84ad3f5e743609f4a14aa4637642de5902afa4b9b359f66f390ddd15775', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Specialiste Safeguarding Regional', 'BFemploi', 'Burkina Faso', null, '2026-06-01', null, false, 'https://www.bfemploi.com/annonce-details-3869.html', 'A classer', 'needs_review', 'Specialiste Safeguarding Regional - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides E', 'https://www.bfemploi.com/annonce-details-3869.html', '2026-06-12T09:28:47.780Z', 0, 0, '2026-06-12T09:28:40.357Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a8c215957c183ce487b40f2097393bea1adc9878e69ca349579b0b1235bd2dcb', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Coordinateur Administratif et Logistique', 'BFemploi', 'Burkina Faso', null, '2026-05-18', null, false, 'https://www.bfemploi.com/annonce-details-3866.html', 'A classer', 'needs_review', 'Coordinateur Administratif et Logistique - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - G', 'https://www.bfemploi.com/annonce-details-3866.html', '2026-06-12T09:28:48.476Z', 0, 0, '2026-06-12T09:28:40.357Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4b6b5059e62eb218f3838b1d66a2287dd6e7ba1e19d5cd4e257db158522b89fa', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Rechercher un emploi', 'Emploiburkina', 'actif', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', 'Emplois au Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Rechercher un emploi Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filter Production, maintenance, qualité (6) Apply Production,', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', '2026-06-12T09:29:05.167Z', 0, 0, '2026-06-12T09:29:01.482Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a67deb385f61f41bace8e9f895ddd1a56021f53399f3af93662fb1e58d86900e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Commande d''annonces', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recrutement/annonce', 'A classer', 'needs_review', 'Recrutement entreprise : l''annonce pour une offre d''emploi au Burkina Faso Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV 0 Se connecter S´inscrire Commande d''annonces Publiez maintenant vos offres d´emploi et trouvez les bonnes compétences pour vos projets. Nos packs annonces 1 annonce Basic Publiez gratuitement jusqu´à 3 annonces Basic par mois ! Gratuit Publier une annonce Basic Logo gratuit sur votre annonce Restez visible auprès des candidats. Votre logo est inséré gratuitement sur vos annonces et dans l´annuaire des recruteurs. Alerte par email des candidatures reçues Soyez informé à tout moment par email de la réception de nouvelles candidatures à vos annonces. Réception de candidatures de profils non-inscrits sur le site Recevez plus de candidatures : Recevez des candidatures de profil', 'https://www.emploiburkina.com/recrutement/annonce', '2026-06-12T09:29:06.138Z', 0, 0, '2026-06-12T09:29:01.482Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3ddb7b293fa18699660073da852bc2615bf07c0b8dc3b7220fecf855a9ff1f9a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Informatique, nouvelles technologies Burkina Faso', 'Emploiburkina', 's Kelétude Nous sommes à la recherche d', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A31', 'A classer', 'needs_review', 'Emplois Informatique, nouvelles technologies Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Informatique, nouvelles technologies Burkina Faso Mes critères de recherche Informatique, nouvelles technologies ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) A', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A31', '2026-06-12T09:29:07.944Z', 0, 0, '2026-06-12T09:29:01.483Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('523378de962f436d309ca57fdad9a2967ffc4d8e4a70ee4ac1931f51b0438d85', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Commercial, vente Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A29', 'A classer', 'needs_review', 'Emplois Commercial, vente Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Commercial, vente Burkina Faso Mes critères de recherche Commercial, vente ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filter Production,', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A29', '2026-06-12T09:29:09.471Z', 0, 0, '2026-06-12T09:29:01.483Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5b8eb74ff8fea606aa8b69b2b87e98db5bcdd5b9df8ea6b1c89e1c3089204781', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Marketing, communication Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A33', 'A classer', 'needs_review', 'Emplois Marketing, communication Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Marketing, communication Burkina Faso Mes critères de recherche Marketing, communication ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filt', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A33', '2026-06-12T09:29:10.901Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d7693dbf660bf28a3c229ece986e960b561f9f2ad9abd058e75e8ac890449f02', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Gestion, comptabilité, finance Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A30', 'A classer', 'needs_review', 'Emplois Gestion, comptabilité, finance Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Gestion, comptabilité, finance Burkina Faso Mes critères de recherche Gestion, comptabilité, finance ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métier', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A30', '2026-06-12T09:29:12.267Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4c45aa00d0e2415e4e9db47f1a0a752c9e4ebf107f8fb7eb3f33fafd1c4ac06a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Transport, logistique Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A28', 'A classer', 'needs_review', 'Emplois Transport, logistique Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Transport, logistique Burkina Faso Mes critères de recherche Transport, logistique ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A28', '2026-06-12T09:29:19.099Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7b460570a93eec41715bfe6c55f29ad0cc458d5e528699eb4efdebf49884389b', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Production, maintenance, qualité Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A37', 'A classer', 'needs_review', 'Emplois Production, maintenance, qualité Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Production, maintenance, qualité Burkina Faso Mes critères de recherche Production, maintenance, qualité ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métie', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A37', '2026-06-12T09:29:20.833Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3fe82482fd6b4469c83ed41bc6d6934b9899ff6ac995bf0da7bcf71767f1f3a4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Métiers des services Burkina Faso', 'Emploiburkina', 's Kelétude Nous sommes à la recherche d', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A35', 'A classer', 'needs_review', 'Emplois Métiers des services Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Métiers des services Burkina Faso Mes critères de recherche Métiers des services ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services Métiers du BTP (4) Apply Métiers du BTP filter Prod', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A35', '2026-06-12T09:29:22.418Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a45c98c242ad9c0a39a5c279e891da7281bbc2f3c426d39c2220bd51e5cb2d94', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Métiers du BTP Burkina Faso', 'Emploiburkina', 'actif', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A36', 'A classer', 'needs_review', 'Emplois Métiers du BTP Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Métiers du BTP Burkina Faso Mes critères de recherche Métiers du BTP ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP Production, main', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A36', '2026-06-12T09:29:23.597Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('01af70fdcad7bfbb296b09f4fd90a6afe2231bbaa1bd1490cfb2ddbf1cd9b77f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Secrétariat, assistanat Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A40', 'A classer', 'needs_review', 'Emplois Secrétariat, assistanat Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Secrétariat, assistanat Burkina Faso Mes critères de recherche Secrétariat, assistanat ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Méti', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A40', '2026-06-12T09:29:24.526Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5ed0a783fae604d77488dbf07224d58286acf339730e8dd9e3ba630e5f7c1ab2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Management, direction générale Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A32', 'A classer', 'needs_review', 'Emplois Management, direction générale Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Management, direction générale Burkina Faso Mes critères de recherche Management, direction générale ⤫ Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métier', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A32', '2026-06-12T09:29:25.449Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3fbe3b42ecfc6b5dc7ed2fbe6d00834c00f3677df50cb0d7f6d00042c0f6fc93', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Rechercher un emploi', 'Emploiburkina', 'actif', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', 'Emplois au Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Rechercher un emploi Métiers Achats (2) Apply Achats filter Commercial, vente (14) Apply Commercial, vente filter Gestion, comptabilité, finance (8) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (3) Apply Management, direction générale filter Marketing, communication (11) Apply Marketing, communication filter Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filter Production, maintenance, qualité (6) Apply Production,', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', '2026-06-12T09:29:26.590Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('83854165d8ac8570fa73c67c7092f1acb30fb487d1b74a6b8f0581fe68ffa293', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Informatique, SSII, Internet Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A133', 'A classer', 'needs_review', 'Emplois Informatique, SSII, Internet Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Informatique, SSII, Internet Burkina Faso Mes critères de recherche Informatique, SSII, Internet ⤫ Métiers Achats (0) Commercial, vente (4) Apply Commercial, vente filter Gestion, comptabilité, finance (2) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (46) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (1) Apply Management, direction générale filter Marketing, communication (4) Apply Marketing, communication filter Métiers de la santé et du social (0) Métiers des services (0) Métiers du BTP (0) Production, maintenance, qualité (0) R&D, gestion de projets (0) RH, for', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A133', '2026-06-12T09:29:28.516Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('194a17d0e3fbf76d77a61d91dc89c72d62dd44494619ee87d782fc571a1b1389', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Equip. électriques, électroniques, optiques, précision Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A123', 'A classer', 'needs_review', 'Emplois Equip. électriques, électroniques, optiques, précision Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Equip. électriques, électroniques, optiques, précision Burkina Faso Mes critères de recherche Equip. électriques, électroniques, optiques, précision ⤫ Métiers Achats (0) Commercial, vente (5) Apply Commercial, vente filter Gestion, comptabilité, finance (0) Informatique, nouvelles technologies (1) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (0) Marketing, communication (3) Apply Marketing, communication filter Métiers de la santé et du social (0) Métiers des services (0) Métiers du BTP (1) Apply Métiers du BTP filter Production, maintenance, qualité (0) R&D, gestion de pr', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A123', '2026-06-12T09:29:29.848Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('af7cae31ac826b856f58ae5bd76e621b82b24b56369edfcc21e3ec2bd8ec220c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Ingénierie, études développement Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A134', 'A classer', 'needs_review', 'Emplois Ingénierie, études développement Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Ingénierie, études développement Burkina Faso Mes critères de recherche Ingénierie, études développement ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (1) Apply Commercial, vente filter Gestion, comptabilité, finance (2) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (2) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (0) Marketing, communication (0) Métiers de la santé et du social (0) Métiers des services (1) Apply Métiers des services filter Métiers du BTP (0) Production, maintenance, qualité (1) Apply Production, maintenance, qualité filter R&D, g', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A134', '2026-06-12T09:29:31.276Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f9ff469b9b9c6e79da688dfe7673bbfd7f8b59fe0b0c1b1a96e999137360cd12', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Automobile, matériels de transport, réparation Burkina Faso', 'Emploiburkina', 'et contrôle de carburant', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A24', 'A classer', 'needs_review', 'Emplois Automobile, matériels de transport, réparation Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Automobile, matériels de transport, réparation Burkina Faso Mes critères de recherche Automobile, matériels de transport, réparation ⤫ Métiers Achats (0) Commercial, vente (4) Apply Commercial, vente filter Gestion, comptabilité, finance (1) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (0) Juridique (0) Management, direction générale (0) Marketing, communication (3) Apply Marketing, communication filter Métiers de la santé et du social (0) Métiers des services (1) Apply Métiers des services filter Métiers du BTP (0) Production, maintenance, qualité (0) R&D, gestion de projets (0) RH, formation ', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A24', '2026-06-12T09:29:32.582Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ecc872bdb48876b6abc0baf4501146f88d4c892caa562b974aa58519e5003b9a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Conseil, audit, comptabilité Burkina Faso', 'Emploiburkina', 's Ingénieurs Emplois actifs Index des Recrutements Métiers', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A116', 'A classer', 'needs_review', 'Emplois Conseil, audit, comptabilité Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Conseil, audit, comptabilité Burkina Faso Mes critères de recherche Conseil, audit, comptabilité ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (2) Apply Commercial, vente filter Gestion, comptabilité, finance (2) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (0) Juridique (0) Management, direction générale (1) Apply Management, direction générale filter Marketing, communication (0) Métiers de la santé et du social (0) Métiers des services (1) Apply Métiers des services filter Métiers du BTP (0) Production, maintenance, qualité (1) Apply Production, maintenance, qualité filter R&D, gestion de projets ', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A116', '2026-06-12T09:29:33.936Z', 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c4b9faa691c7944eaa719afdc9a0dfcc408770387f77b3359e18638b1ee53fd1', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Distribution, vente, commerce de gros', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A117', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A117', now(), 0, 0, '2026-06-12T09:29:01.484Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('80d21b0fb43ae64e5e52921e929e9e269c9a8cd8c0f4b38217a90d99db5e9771', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Agroalimentaire', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A22', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A22', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d0420a8bbaef2622b3b8f6f28e9df21e43d291c400463e0c849b802233ba86e5', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'BTP, construction', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A26', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A26', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c80ddd55eadc78df8e3c8b1df53e1e9e060e936c3ca03ba41d3bb9f24888017f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Tous les secteurs d''activité', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('710a42581afc48703044d349dc4d03731b87d099b0585c5dd661d297cac6c858', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A943', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A943', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1c80a1b59018ab8065e05838b237053b3d26b299b4bf6322df4e19834a6d9792', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'International', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A947', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A947', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f0310208920f717dac3da5bf8d7351f9d8477a03c3d44e37f8c1504c524622ef', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Bobo Dioulasso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A58', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A58', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ec843539b2135058e164cabc150f706edbad13e37ff6e912f2f20db01b3a215', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Dédougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A59', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A59', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('73b2eed0fc72888286dadece5c5924f13e9e968853e4c71a43c450aeebcf0250', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Fada N''Gourma', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A61', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A61', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0f8cf7e9b6c7f7c7d4d6fbd7e5e24fb701770634cb962b8cba0f7601ae25c918', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Toutes les régions', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a1ec186344a99a0fe4622a72b0da387d2849a7d6663710e71ce89b523e804c2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5f975014e999374308feb174735df90a8a4c3c0bde3f1d0a8a729f7993fe6816', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Sales Manager- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/sales-manager-ouagadougou-302227', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/sales-manager-ouagadougou-302227', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('17344c89107eb36cad953c9766d296e6dc93695e7b7078311536c718f8ba52de', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Secrétaire Comptable- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-302588', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-302588', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ea6a30c7451c86ed0fea05f411b14c25be3a42a4596e7e0ea03d816c687fe661', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Sécretaire Comptable- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-303588', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-303588', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('55269b4fca460f79148fbb8c606d39713477605c18ae35263b0fba5a645c0927', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Executive Secretary- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/executive-secretary-ouagadougou-303736', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/executive-secretary-ouagadougou-303736', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('dd07b60720e6a48b03e5f25fb941efa31fdc58338bc343c11ad3633f55d780af', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', now(), 0, 0, '2026-06-12T09:29:01.485Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ba382968d247e7208a4a40ece1747c1b22ff367900788d1ad421a342b748a14', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Offre de Stage- BTP, Architecture- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/offre-stage-btp-architecture-ouagadougou-304056', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/offre-stage-btp-architecture-ouagadougou-304056', now(), 0, 0, '2026-06-12T09:29:01.486Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('416c39ed141e3c248a2d74ed7a393055a000647a7b5f0af202dd0a05509eee00', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Manager- Work From Home', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', now(), 0, 0, '2026-06-12T09:29:01.486Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('db86e6a3396863c8983e2d1bb0d497e701884b8e6e3798465e0547d19e140cb3', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'ANGULAR Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', now(), 0, 0, '2026-06-12T09:29:01.486Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d433d18d7103fb188e21a11f668c33673d04aefe11eec7c9f87d529363abf6a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Toutes les offres d´emploi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-12T09:29:01.486Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fe2b148138f77d8260ff59e653965606d78c6e30e5abbf15b45e7f2e22dfee06', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Qui sommes-nous ?', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/qui-sommes-nous', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/qui-sommes-nous', now(), 0, 0, '2026-06-12T09:29:01.487Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fb31aea5641f7b4206fc30bd0f6377895daebaa7f02138bf88b15ed6c2b643d4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Plan du site', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/plan-site', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/plan-site', now(), 0, 0, '2026-06-12T09:29:01.487Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a6148d1f633c866e32f86493c5ae7ef1099d3517e4ef21837a774fc8f876fca5', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Achats Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1127', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1127', now(), 0, 0, '2026-06-12T09:29:01.487Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9cb4a6e41a10c742d21e6076caa209f18e4ddd349c1253bdb7961825c2d484ab', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Commercial, vente Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A29', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A29', now(), 0, 0, '2026-06-12T09:29:01.487Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('359c3adc9fdccb2f58552da79a7f65e56c771ed9609772ebfd6e4efe925844eb', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Gestion, comptabilité, finance Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A30', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A30', now(), 0, 0, '2026-06-12T09:29:01.487Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1d4f9fc71e0b8f0cb623c074c855b0483bfdc04e81ba0554dd4bda0cf295b8a4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Informatique, nouvelles technologies Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A31', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A31', now(), 0, 0, '2026-06-12T09:29:01.487Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('aa1bee8d42bef13890cf9d153be72aa031a7c27d471dc05a95ae0252d23926b0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Juridique Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1115', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1115', now(), 0, 0, '2026-06-12T09:29:01.487Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('634e1ddb3ea86a1d131c0522fdb31f85b0d0c90fc6997ad27dabb466d9f262fe', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Management, direction générale Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A32', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A32', now(), 0, 0, '2026-06-12T09:29:01.487Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6e00c135a458dfe06f2db5973b3cd4b816f4bf6e631b15717ad5aa2d6b23d659', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Marketing, communication Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A33', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A33', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('871c5797c16bc0ac8a467e3f803866605ea308a52b53cef20886c9e8356d6a2f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Métiers de la santé et du social Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A34', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A34', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('60e9e1d2a3de05dd934d8d74dfb78a014414f373516c299794b13f455f0dd8bc', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Métiers des services Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A35', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A35', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7534521dde6336d819dfa1fc08fbc8139c16b288e6cab8f8b21ccbd44ef6e7d0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Métiers du BTP Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A36', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A36', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8f6825eb59f5de18cc0ed6fa2ddddfc05bfa3450920d490be049a671f797afea', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Production, maintenance, qualité Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A37', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A37', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5a3f2891c05efeb70309c238967bf647e2210f2dfbbf786420be25c416799a9f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'R&D, gestion de projets Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A39', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A39', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bade8806cea03af221a439ec86bea2c518fd190d0a846560831092a20d563e8d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Secrétariat, assistanat Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A40', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A40', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8d34e7590459d34d1545b3986d7a64a7825fe4354bac7892ca05865acc328988', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Télémarketing, téléassistance Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A525', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A525', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2084593a4d55b4a9fa9dc95b90aaeebeb360439a62cc44999caba92537168fd7', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Tourisme, hôtellerie, restauration Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A41', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A41', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d6c7850ce3af5142612a42f753d9b5f4bbcbe4aea3ec05edd8b584a3756d2a5a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Transport, logistique Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A28', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A28', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3b5d1fd0a7ed2607c818bebb82d079310f58950fa3c68b51aeb9541b95653514', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Banfora Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A57', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A57', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5000ff5b3af87660a0d1ec14ede82ab51d0a87bf590a9c189e75f1089ca66ff0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Bobo Dioulasso Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A58', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A58', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9d7b6032505f1bd8ac06fc13634baf96c30a68e75114c3d2908c1f507c01c816', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Dédougou Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A59', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A59', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ce3167fe23bc786eee8dcd193b77963aafb79620fa87dd7ecc13ea8588ab88bf', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Dori Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A60', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A60', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ed7f28c845f35710df2c302dff347d6c90dec01cad0761cd83bae9412ea01a6e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Fada N''Gourma Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A61', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A61', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0cb977e378cfa0b17a9f52c1d1b6e4c7e30c010f316ad314c8d27f5457385921', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Gaoua Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A62', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A62', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bf5eb8b52a3c828ca5425fe6e09130dc9337eca48ccf16e0d147e5e443784909', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Kaya Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A63', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A63', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('24d44f57fc7f5f9b28523bdc9ca25d1364b79ff1e4ceed65255ed8acfe0ad740', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Koudougou Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A64', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A64', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('52b3c9662113ab39036d30c613e53a98aa9b99724be30fe3a9d8580dcf917d1c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Manga Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A65', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A65', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('507ed5b68b866b48a4876a9b309bd8209bb88ff0bbd11efc3fbd0fdbcb04888d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ouagadougou Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A943', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A943', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('87fcffd33952406df861c06b54095d952a83fabe54b219473fdca74256912120', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ouahigouya Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A944', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A944', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9344a5538cb558ca901b37062e5856778a15eed30379c1fdc82e5b64399e2bcd', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Tenkodogo Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A945', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A945', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8cebf9906683e3d089bf1b50e606e9f9cf3b3b9b3279b546fe56a51407dc2856', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ziniaré Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A946', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A946', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('234d3df03926e110efee4f796ddc5d3d6ebbf7bd9f22d84d2c4d8c326c77b68c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ingénieurs', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/emplois-actifs/ingenieurs', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/emplois-actifs/ingenieurs', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ea082bf4cd1006738689f92973bb8a3889ffba4e4e3a721713a30008a7bc2c00', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois actifs', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/emplois-actifs', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/emplois-actifs', now(), 0, 0, '2026-06-12T09:29:01.488Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c206193d3b0bbe21f7248a2e64dbbae1179c696c5b041de23d7f0b7dad7ed145', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ingénieurs', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recrutements-permanents/ingenieurs', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recrutements-permanents/ingenieurs', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2999d8c01d620d99550f50c5cb932b6fddcc169095f2c7be39f81369a96d610d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Recrutements permanents', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recrutements-permanents', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recrutements-permanents', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c232c5a7b77ac7f8b38bd62f5c7d4ae9d8b3ed11c4dfa2cdbd67463df581fb8d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Maroc', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.ma/', 'A classer', 'needs_review', null, 'https://www.emploi.ma/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e01b6d95403fb0baa1e742e2d0064be5fd5516d761a4913dae2f0b4279b3152d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Côte d’Ivoire', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.ci/', 'A classer', 'needs_review', null, 'https://www.emploi.ci/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('def39cf101ad8eb9f972a5a738419c39d96a3495d8033d9129558ade98cf1b05', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Congo', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cg/', 'A classer', 'needs_review', null, 'https://www.emploi.cg/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('71f746e1c8958e589a5e56d37466646c69095f0b7e87a7e408921a706fe1a9de', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Cameroun', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cm/', 'A classer', 'needs_review', null, 'https://www.emploi.cm/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('095f5cf1a656012f19e6f61e56bf58e20ce974fb241c1ddf760b876ce357037d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Sénégal', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploisenegal.com/', 'A classer', 'needs_review', null, 'https://www.emploisenegal.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4e19b80358354197d729caeca3148520990cdbe3f37ae9eafc437053a5736d44', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0063f82b586801f66a9213033a19f3be972b01974f5d875917bbec6b035dfca0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Guinée', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiguinee.com/', 'A classer', 'needs_review', null, 'https://www.emploiguinee.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6218771d455ca3ee68df23bff407d0f69a1a67db85166b2a3aecc8d221161238', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Togo', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.tg/', 'A classer', 'needs_review', null, 'https://www.emploi.tg/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('70cb0d16b85094d0fea05512d4aaca4035d316aeb2662940e16d8c75286763fd', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Gabon', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.ga/', 'A classer', 'needs_review', null, 'https://www.emploi.ga/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a690540c614f6ba7146721715e833048adaf9a1da645ea2c42a6d2aec064fcdb', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Mauritanie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploimauritanie.com/', 'A classer', 'needs_review', null, 'https://www.emploimauritanie.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9d9cdd4192106a5ba2389a482c32497e420a57c6ab14a536e9fd9a1e872fc24c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Bénin', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploibenin.com/', 'A classer', 'needs_review', null, 'https://www.emploibenin.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1d92e7bf0bacc9b8ed7b74349c1f760365558a3476f79a9a9efc990e8cbbd7ff', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Mali', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploimali.com/', 'A classer', 'needs_review', null, 'https://www.emploimali.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e120ec35b514b0baf425176472b7d3f156c1b0b54468392f32840888ddd6ad94', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Congo RDC', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cd/', 'A classer', 'needs_review', null, 'https://www.emploi.cd/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7b31d59f897e374b34890e8f8ceb171a523c57144ee1d6155732dafa5fcedfc2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Algérie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.algeriejob.com/', 'A classer', 'needs_review', null, 'https://www.algeriejob.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f4943b501811685abd8caf6b0bc5c68e5a8c4a27dff9651b779525a8e4a1de3c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Tunisie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploitunisie.com/', 'A classer', 'needs_review', null, 'https://www.emploitunisie.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('10d60900e28075b6cb304488c372392e828fcfbb4b8d272019def046372fc523', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Niger', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.nigerjob.net/', 'A classer', 'needs_review', null, 'https://www.nigerjob.net/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1623526900bf377c95fffd9dd1f133143a8bac6282e5fc6dbf66d5c2d7765da7', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Tchad', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.td/', 'A classer', 'needs_review', null, 'https://www.emploi.td/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7e78216c20b625819e745686893bfd669a04196f6ae279f0614688ce69af57b6', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Burundi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.bi/', 'A classer', 'needs_review', null, 'https://www.emploi.bi/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f6864d2693995c1576df2d2a07c45dad046cb336d7441c5ecbd1fcbd6003123e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Ghana', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.ghanajob.com/', 'A classer', 'needs_review', null, 'https://www.ghanajob.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c74711399d85c41568e1280308d2fb000148176831fd569bc2e96ae4dcf76639', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Nigeria', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.nigeriajob.com/', 'A classer', 'needs_review', null, 'https://www.nigeriajob.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f8be71c45636291279405cf57e30a85d6216ddb4c1c37791123b45350cd41005', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Kenya', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.kenyajob.com/', 'A classer', 'needs_review', null, 'https://www.kenyajob.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7ca0b3b220078eeda86eb0b74e46bab6a10bdc9d0798b915e159d973501db5ef', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Ouganda', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.ugandajob.com/', 'A classer', 'needs_review', null, 'https://www.ugandajob.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('30453f4fbaa2d2b7a85103081b341abd8178f20def42545a73ab7ceb0e167a51', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Rwanda', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.rwandajob.com/', 'A classer', 'needs_review', null, 'https://www.rwandajob.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a5d0c9cdd55fc62812c5cf2fbddf39fd0770b9f9aa60be8656ccbcd448ad50ad', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Tanzanie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.tanzajob.com/', 'A classer', 'needs_review', null, 'https://www.tanzajob.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c98ecd5ded490eff2c04886180588217adb996dd98ec66cbdb1a08922661e2e3', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Botswana', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.botswajob.com/', 'A classer', 'needs_review', null, 'https://www.botswajob.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b088c0adaa209b4d5266bf497a2c9bd50e838022c4db67927e7b9990f38e3686', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Malawi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.malawijob.com/', 'A classer', 'needs_review', null, 'https://www.malawijob.com/', now(), 0, 0, '2026-06-12T09:29:01.489Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4b00d395bf5e6c452f11ba5e15b1c41c66fbc97a6570a431fa172c9019e863e4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Namibie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.namijob.com/', 'A classer', 'needs_review', null, 'https://www.namijob.com/', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('739e3e1d6fd86d9ea7aa0e5efb373d00fd1ce626c2dcf65d59c86d6aebb85c90', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Zambie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.zambiajob.com/', 'A classer', 'needs_review', null, 'https://www.zambiajob.com/', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('834c3f5226266842c092ada46c0e0f7e786bdea4db26da5942de4070ab315ca0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Zimbabwe', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.zimbajob.com/', 'A classer', 'needs_review', null, 'https://www.zimbajob.com/', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f660c9ce71ee45e8bf617334cec53b4ccf4bbfa8bff7cab5f621bcb34d167413', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Sierra Leone', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.sierraleonejob.com/', 'A classer', 'needs_review', null, 'https://www.sierraleonejob.com/', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1492447d76e90aa9075e6e56d2ded993e7acf31d0a8db490c54f1b24eed40d1a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Afrique du Sud', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.zajob.com/', 'A classer', 'needs_review', null, 'https://www.zajob.com/', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d00300f29858c8188798ecf763b29d9bc38c029cf238ffcaec852836c180607', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Soudan du Sud', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.southsudanjob.com/', 'A classer', 'needs_review', null, 'https://www.southsudanjob.com/', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2cda0bc49f3549a025932ca713163c9096334099a7da3576934f47711cb777be', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Centrafrique', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cf/', 'A classer', 'needs_review', null, 'https://www.emploi.cf/', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5fbf3fc41b08fa029c4a4853ed9bddc18231580fdec8c2d424a1e59210a43d4d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Mentions légales', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/mentions-legales', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/mentions-legales', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('659b22d65aa34a5ec1df9b81a6f9912775bcb230412ff7e5aad1b4495a7c3f52', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Propriété Intellectuelle', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/propriete-intellectuelle', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/propriete-intellectuelle', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d1453f891616480538c060abf7fc0b7efad29c925b19af7e7fde6df7259fab8c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Recherche', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-12T09:29:01.490Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2606e9b64dbd3a1ad7e814233a4f3ea16d827dd8702f0ef5d697f4882f73ceb2', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/offres-emploi/', 'A classer', 'needs_review', 'Archives des Offres d’emploi - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer ', 'https://www.travail-burkina.com/offres-emploi/', '2026-06-12T09:29:37.623Z', 0, 0, '2026-06-12T09:29:36.206Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8c20818700b5ade57167862b4ba4153565111c0cdeff4af0eacbfe3fcd93ccef', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Offres de stages', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/offres-de-stages/', 'A classer', 'needs_review', 'Archives des Offres de stages - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer', 'https://www.travail-burkina.com/offres-de-stages/', '2026-06-12T09:29:38.755Z', 0, 0, '2026-06-12T09:29:36.206Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ff6ce7fd04032bddb70f76dfe068eb4c001fdd38460f17ed9f1e4ffeda97b4c', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Administration', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/administration/', 'A classer', 'needs_review', 'Archives des Administration - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer u', 'https://www.travail-burkina.com/category/offres-emploi/administration/', '2026-06-12T09:29:39.670Z', 0, 0, '2026-06-12T09:29:36.207Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2cec55b044d44f5082901b560bd7c72d354b0802258ee00a3a3c0bb6b66fd726', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Agriculture – Agro-alimentaire', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/agriculture-agro-alimentaire/', 'A classer', 'needs_review', 'Archives des Agriculture – Agro-alimentaire - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer u', 'https://www.travail-burkina.com/category/offres-emploi/agriculture-agro-alimentaire/', '2026-06-12T09:29:40.634Z', 0, 0, '2026-06-12T09:29:36.207Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c2712d4612083df4d3f04a591ef17ecff3cb86a09c7b791b2f42c0005338d4b9', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Architecture', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/architecture/', 'A classer', 'needs_review', 'Archives des Architecture - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer un ', 'https://www.travail-burkina.com/category/offres-emploi/architecture/', '2026-06-12T09:29:41.722Z', 0, 0, '2026-06-12T09:29:36.207Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f20e69aa364282b4bc7305236f00eada7c6429d9b1bb8811206b2f743563a36a', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Assistance – Secrétariat', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/assistance-secretariat/', 'A classer', 'needs_review', 'Archives des Assistance – Secrétariat - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un comp', 'https://www.travail-burkina.com/category/offres-emploi/assistance-secretariat/', '2026-06-12T09:29:42.652Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3159461f5cc54be97e170fb9d05d25d943255d1dae5fdacddb18880261940d6e', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Audiovisuel- Infographie – Graphisme', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/audiovisuel-infographie-graphisme/', 'A classer', 'needs_review', 'Archives des Audiovisuel- Infographie – Graphisme - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat C', 'https://www.travail-burkina.com/category/offres-emploi/audiovisuel-infographie-graphisme/', '2026-06-12T09:29:43.674Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d31bfa13faba5196c4d1d9433bcd8af4fe38f02e97bd801cecbc47fed03061d3', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Biologie – Chimie', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/biologie-chimie/', 'A classer', 'needs_review', 'Archives des Biologie – Chimie - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Crée', 'https://www.travail-burkina.com/category/offres-emploi/biologie-chimie/', '2026-06-12T09:29:44.696Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f3400ad62f5d10cde8d27f03b5792bcde14477b444c7e7981fd9eeb70d689116', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Chargé de clientèle – Communication', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/charge-de-clientele-communication/', 'A classer', 'needs_review', 'Archives des Chargé de clientèle – Communication - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Cr', 'https://www.travail-burkina.com/category/offres-emploi/charge-de-clientele-communication/', '2026-06-12T09:29:46.807Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0135cb95bb2ef40b893ab6c3532c14fedd8a868ec8d46141a40dc7e703c812b6', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Commerce – Marketing – Vente', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/commerce-marketing-vente/', 'A classer', 'needs_review', 'Archives des Commerce – Marketing – Vente - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un ', 'https://www.travail-burkina.com/category/offres-emploi/commerce-marketing-vente/', '2026-06-12T09:29:48.067Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cebbafb153a3d573082dc2b441e415cd7ed24fc641a5d9132659a076aaf9129d', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Comptabilité – Finance – Statistiques', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/comptabilite-finance-statistiques/', 'A classer', 'needs_review', 'Archives des Comptabilité – Finance – Statistiques - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat ', 'https://www.travail-burkina.com/category/offres-emploi/comptabilite-finance-statistiques/', '2026-06-12T09:30:10.897Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('be79c8ec34aacada1b1b651665bed2ce18da5e9e3bae43e4471f7f6e93a57b51', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Conseil – Consulting', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/conseil-consulting/', 'A classer', 'needs_review', 'Archives des Conseil – Consulting - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte C', 'https://www.travail-burkina.com/category/offres-emploi/conseil-consulting/', '2026-06-12T09:30:12.139Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('854447717663b1e9427f6a1765682baef93714b72fed9ae734c5156f8bef951c', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Direction – Management', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/direction-management/', 'A classer', 'needs_review', 'Archives des Direction – Management - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte', 'https://www.travail-burkina.com/category/offres-emploi/direction-management/', '2026-06-12T09:30:13.178Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('340b89197b9e2d18f4c3d9ab98a88a9da361ad09a9b3d1344ac187d265348ffa', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Informatique – Télécom – Internet', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/informatique-telecom-internet/', 'A classer', 'needs_review', 'Archives des Informatique – Télécom – Internet - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Crée', 'https://www.travail-burkina.com/category/offres-emploi/informatique-telecom-internet/', '2026-06-12T09:30:14.094Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('598b941894ed80f61eb269a10d1bedf9ee5c889f636b0c80effaa9f1aece3502', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Ingénierie – Industrie – Production', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/ingenierie-industrie-production/', 'A classer', 'needs_review', 'Archives des Ingénierie – Industrie – Production - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Cr', 'https://www.travail-burkina.com/category/offres-emploi/ingenierie-industrie-production/', '2026-06-12T09:30:15.118Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a4aa5dfccba8c80ba9642bb902c373dd45fabeeb62ce0a2bc5b20a4e600024d', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Journalisme – Rédaction – Traduction', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/journalisme-redaction-traduction/', 'A classer', 'needs_review', 'Archives des Journalisme – Rédaction – Traduction - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat C', 'https://www.travail-burkina.com/category/offres-emploi/journalisme-redaction-traduction/', '2026-06-12T09:30:16.133Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('870c4da5f9655c60e6fc503fc5dc83d5a4f8f1007e73e9966da752afa4e3e3fd', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Juridique', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/juridique/', 'A classer', 'needs_review', 'Archives des Juridique - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat Créer un compte Créer un CV ', 'https://www.travail-burkina.com/category/offres-emploi/juridique/', '2026-06-12T09:30:17.359Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('413b393c6a6479f397530b1e5f7e56dc33a8cdcd745d0d753966595faaa509a9', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Offres d’emploi Mécanique – Electrique – Energétique', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/mecanique-electrique-energetique/', 'A classer', 'needs_review', 'Archives des Mécanique – Electrique – Energétique - Emploi Burkina Faso Toggle navigation Accueil Offres d''emploi Toutes les offres Offres de stages Concours Fonction Publiques Immigration & Bourses Administration Agriculture – Agro-alimentaire Architecture Assistance – Secrétariat Audiovisuel- Infographie – Graphisme Biologie – Chimie Chargé de clientèle – Communication Commerce – Marketing – Vente Comptabilité – Finance – Statistiques Conseil – Consulting Direction – Management Formation – Education – Enseignement Freelance Informatique – Télécom – Internet Ingénierie – Industrie – Production Journalisme – Rédaction – Traduction Juridique Mécanique – Electrique – Energétique Médical – Paramedical Ressources Humaines Restauration – Hôtellerie Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support Textile – Styliste – Modéliste Vendeur- Ouvrier – Chauffeur Espace candidat C', 'https://www.travail-burkina.com/category/offres-emploi/mecanique-electrique-energetique/', '2026-06-12T09:30:18.381Z', 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7bd3b1a39a45995387a0037f637f2a8aa7e317311cb86e930bfa1d4718f4c50a', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Médical – Paramedical', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/medical-paramedical/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/medical-paramedical/', now(), 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3e73dc7a6b2f3acd9dc10b2346daceed9be2147178608a99622fdcb866dd8e48', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Ressources Humaines', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/ressources-humaines/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/ressources-humaines/', now(), 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9ec08520e0b5fc9d5419b89302ca7722bf9974c51bc5a47ebc57f5ce643775f5', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Restauration – Hôtellerie', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/restauration-hotellerie/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/restauration-hotellerie/', now(), 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('60e2e04b8a299683932bdb27646fb605efe05939c1a751d18b1a5a9c966fa0c4', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Téléoperateurs – Téléconseillers – Télévendeurs – Technicien Support', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/teleoperateurs-teleconseillers-televendeurs-technicien-support/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/teleoperateurs-teleconseillers-televendeurs-technicien-support/', now(), 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b3ade13dc1018ecdb247b99399d2bf5ac01730d6d9ce29420509933bb7f49d42', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Textile – Styliste – Modéliste', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/textile-styliste-modeliste/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/textile-styliste-modeliste/', now(), 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c7516a022645af25d2aa3c96f60bfa28447df0d313a4c2e64adac32a7b831dcb', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'Vendeur- Ouvrier – Chauffeur', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/category/offres-emploi/vendeur-ouvrier-chauffeur/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/category/offres-emploi/vendeur-ouvrier-chauffeur/', now(), 0, 0, '2026-06-12T09:29:36.208Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1800cdc36f70be3dddb6fb64d6041f88cfc7832db08178bf884eb0300184f863', 'travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'domaine d''activité', 'Travail Burkina', 'Burkina Faso', null, null, null, false, 'https://www.travail-burkina.com/offres-emploi-par-secteur-activite/', 'A classer', 'needs_review', null, 'https://www.travail-burkina.com/offres-emploi-par-secteur-activite/', now(), 0, 0, '2026-06-12T09:29:36.207Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('595c12809efecaa9f225d29d8a898cad82b845e90b6a0d3f726f1eb6ca9116c2', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Offres d''Emploi', 'RMO Job Center', 'Burkina Faso', null, '2026-06-10', null, false, 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html#', 'A classer', 'needs_review', 'Nos Offres d''Emploi - RMO C�te d''Ivoire C�te d''Ivoire S�n�gal Mali Burkina Faso Togo Se Connecter | Pas encore inscrit(e) ? cliquez ici C�te d''Ivoire Accueil A propos de RMO Offres d''Emploi Conseils Emploi Espace Candidat Espace Entreprises vous �tes ici : Accueil Nos Offres d''Emploi Nos Offres d''Emploi Espace PUB Formulaire de Recherche Mots Recherch�s / R�f�rence : Fonction : Toutes les Fonctions Achat / Logistique / Transport / Import / Export Administration - Secretariat / Services publics ADMINISTRATIVE AND FINANCE OFFICER Agent Technique Planification S�ret� Agriculture ASSISTANT COMPTABLE FINANCIER assistant financier comptable Association / ONG Audit et Conseil Auditeur Interne Junior Automobile Autres Banque / Assurances BTP / Architecture / Construction Caissier(e) Principal(e) Charg� de Client�le Charg� de Contr�le et V�rification Charg� de Recrutement CHARGE PROJET REBRANDING', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html#', '2026-06-12T09:30:31.056Z', 0, 0, '2026-06-12T09:30:30.496Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('27159b769dc7662c901aa77b83bbdf88e307ee419b678ca200959df8a6d09437', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Emploi et Recrutement avec RMO JOBCENTER Burkina Faso', 'RMO Job Center', 'Burkina Faso', null, '2026-05-07', null, false, 'https://www.rmo-jobcenter.com/fr/burkina-faso/', 'A classer', 'needs_review', 'Emploi et Recrutement avec RMO JOBCENTER Burkina Faso - Conseil actu emploi Burkina Faso S�n�gal Mali C�te d''Ivoire Togo Se Connecter | Pas encore inscrit(e) ? cliquez ici Burkina Faso Accueil A propos de RMO Offres d''Emploi Conseils Emploi Espace Candidat Espace Entreprises rmo recrutement Avec RMO, b�n�ficiez de l''accompagnement d''un expert pour toutes les �tapes de votre recrutement. En savoir plus rmo travail temporaire RMO, votre complice pour gagner en exp�rience, diversifier et d�velopper vos comp�tences professionnelles, enrichir votre r�seau. En savoir plus RMO Sous traitance RMO, l''assurance d''une externalisation r�ussie ! En savoir plus rmo formation Avec RMO faites de la formation professionelle un gage de r�ussite pour votre entreprise ! En savoir plus rmo Conseil RH B�n�ficiez de plus de 30 ann�es d''expertise pour une gestion de vos ressources humaines optimis�es. En savoir', 'https://www.rmo-jobcenter.com/fr/burkina-faso/', '2026-06-12T09:30:34.621Z', 0, 0, '2026-06-12T09:30:30.496Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8aa0682229b05b4f0b1c401713c2f480bb64b9695df4f43f706207c4927c6c46', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Emploi et Recrutement avec RMO', 'RMO Job Center', 'Burkina Faso', null, '2026-06-10', null, false, 'https://www.rmo-jobcenter.com/#', 'A classer', 'needs_review', 'Emploi et Recrutement avec RMO - plus de 35 ans de solutions R.H. Qui Sommes-Nous Notre Savoir Faire Nos Implantations Nos Clients Actualit�s RMO rmo recrutement Avec RMO, b�n�ficiez de l''accompagnement d''un expert pour toutes les �tapes de votre recrutement. En savoir plus rmo travail temporaire RMO, votre complice pour gagner en exp�rience, diversifier et d�velopper vos comp�tences professionnelles, enrichir votre r�seau. En savoir plus RMO Sous traitance RMO, l''assurance d''une externalisation r�ussie ! En savoir plus rmo formation Avec RMO faites de la formation professionelle un gage de r�ussite pour votre entreprise ! En savoir plus rmo Conseil RH B�n�ficiez de plus de 30 ann�es d''expertise pour une gestion de vos ressources humaines optimis�es. En savoir plus Acc�s Site Pays : S�n�gal Mali C�te d''Ivoire Burkina Faso Togo --> Offres d''emploi r�centes 10/06/2026 - Ref: #527165 Commer', 'https://www.rmo-jobcenter.com/#', '2026-06-12T09:30:35.959Z', 0, 0, '2026-06-12T09:30:30.496Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('37a2f75413afa9d29aedf6d74861fb4e0cfd0d249cea1c4e31a258342cc6b5c6', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Inscription Candidats', 'RMO Job Center', 'de R', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/inscription.html', 'A classer', 'needs_review', 'Inscription Candidats - RMO C�te d''Ivoire C�te d''Ivoire S�n�gal Mali Burkina Faso Togo Se Connecter | Pas encore inscrit(e) ? cliquez ici C�te d''Ivoire Accueil A propos de RMO Offres d''Emploi Conseils Emploi Espace Candidat Espace Entreprises vous �tes ici : Accueil Espace Candidat Inscription Espace Candidat Inscription D�p�t de CV Agent de recherche Tests RH Boite � outils Conseil juridique Contacts utiles Questions-r�ponses T�moignages Candidats Demande de documents Espace PUB R�seaux Sociaux Cr�er mon Compte Candidat Pourquoi cr�er un compte candidat ? Pour profiter pleinement des outils mis � votre disposition par RMO dans le cadre de votre recherche d''emploi, Il est important que vous ayez un compte candidat et que vous renseigniez votre CV . Vous pourrez ainsi postuler � nos offres en ligne et actualiser votre CV � tout moment. La cr�ation de votre profil fait �galement office de ', 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/inscription.html', '2026-06-12T09:30:36.706Z', 0, 0, '2026-06-12T09:30:30.496Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('126c2d5f4ddf243985b0f7ed38809e3920df89061c68223cf9c0aaf561a61c52', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo.html', '2026-06-12T09:30:37.616Z', 0, 0, '2026-06-12T09:30:30.496Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('002753c82a6446ee67252644b8480f0d53f6b67654391fee9ed18dbe11fc8ee5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'D�poser un dossier de candidature physique', 'RMO Job Center', 'Burkina Faso', null, '2026-06-09', null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi.html', 'A classer', 'needs_review', 'Emploi et Recrutement avec RMO JOBCENTER C�te d''Ivoire - Conseil actu emploi C�te d''Ivoire S�n�gal Mali Burkina Faso Togo Se Connecter | Pas encore inscrit(e) ? cliquez ici C�te d''Ivoire Accueil A propos de RMO Offres d''Emploi Conseils Emploi Espace Candidat Espace Entreprises rmo recrutement Avec RMO, b�n�ficiez de l''accompagnement d''un expert pour toutes les �tapes de votre recrutement. En savoir plus rmo travail temporaire RMO, votre complice pour gagner en exp�rience, diversifier et d�velopper vos comp�tences professionnelles, enrichir votre r�seau. En savoir plus RMO Sous traitance RMO, l''assurance d''une externalisation r�ussie ! En savoir plus rmo formation Avec RMO faites de la formation professionelle un gage de r�ussite pour votre entreprise ! En savoir plus rmo Conseil RH B�n�ficiez de plus de 30 ann�es d''expertise pour une gestion de vos ressources humaines optimis�es. En savo', 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi.html', '2026-06-12T09:30:38.931Z', 0, 0, '2026-06-12T09:30:30.496Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f3800719475969f39d51b4184a616e17f47b5f95b38fdaf5207afe35de987167', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/conseils-emploi.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/conseils-emploi.html', '2026-06-12T09:30:39.780Z', 0, 0, '2026-06-12T09:30:30.496Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8723b9817ecde5a2ebe2ab091631c9a521e1163340ac4fb9683100cc303e7633', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/entreprises.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/entreprises.html', '2026-06-12T09:30:40.561Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d1232ff115f1e5c79440c440a469a8268eae27491ae1bdae05ef322ffe1f8ca7', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/261-grand-jeu-intention-travailleurs.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/261-grand-jeu-intention-travailleurs.html', '2026-06-12T09:30:41.305Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2f6e8030eee2bd38df9fe8eb46da1a12a68f7461b2ab7f4f751de8c6affe957b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/260-arbre-noel-2021-ecole-maternelle.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/260-arbre-noel-2021-ecole-maternelle.html', '2026-06-12T09:30:42.201Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8b3ab8d7c33571efd46ebc042120be8f3ea3f4f4a557b9ffdd66d209751e2232', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/258-arbre-noel-2020-ecole-maternelle.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/258-arbre-noel-2020-ecole-maternelle.html', '2026-06-12T09:30:43.022Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b27f914f40f6738351911d54b304058a30695f4d6b3632afb1a3e57ede71e96e', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/257-cancer-sein-parlons-en.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites/257-cancer-sein-parlons-en.html', '2026-06-12T09:30:43.836Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('df243d54723004075bb1a206d9f5d9947d408178785ce2977d93f5add8bf9fbe', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/rmo/actualites.html', '2026-06-12T09:30:44.791Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('53cbf3198be98efaeb74542fd4a3fdbafa1f13969f26a4bd454baeadbf79efed', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'cliquez-ici.', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/includes/fonctions/outils/telecharger_docs.php?file=postuler-a-une-offre-sur-rmo-jobcenter.pdf', 'A classer', 'needs_review', '%PDF-1.5 %���� 1 0 obj >>> endobj 2 0 obj > endobj 3 0 obj >/XObject >/ExtGState >/Pattern >/ProcSet[/PDF/Text/ImageB/ImageC/ImageI] >>/MediaBox[ 0 0 595.32 841.92] /Contents 4 0 R/Group >/Tabs/S/StructParents 0>> endobj 4 0 obj > stream x��\[oǑ~��0/ �,G}�,%6�D��d��Hf@��Dz��Z��_l}U�sf�]$X"�5}��{�tϣ''��ߞ�]w�?zr}}z���M�ã�W~|���^��;� ��<>�>;鞾~��� �Yۛн~���� ��]6}q��5��t��?|`�w����~�u���_?|��wϿ=�mY��������˻��;�;^���Ƙ''��lLyz|�]������}��8=�.5[�x����]�½���g��L{u�ʫ[7ں''��|���v��j� ��E����X���a ��ჷ�cbp}-� �+]t�����}\ �ʾ�a�Z�t-Y.$�ƺԻH�S��ލy��,�ݣ��oO�z֙U�*�U`Ŋ�''/��ŗ�#kg��~��~��k��{�C?��9���|� �>�� �����S*l��&��dԓÖ��6��ؓ`N�a�e�����vրu���������`j���>�TH�>�p���3��K��Ž�k�˞�U� OQٶEkO���o�4��+-}�@�z�?c���-���Y�O}X��ϥǔ���M��:�%?z�H�E i� l�њ������H��P� Ÿ�>��]�vC_�fM�� ϶����4�A\���ȾMJ,�BS��������;�kS��U��� ��s��;� �mh�ud�-O�0)#L4��4{^�p', 'https://www.rmo-jobcenter.com/includes/fonctions/outils/telecharger_docs.php?file=postuler-a-une-offre-sur-rmo-jobcenter.pdf', '2026-06-12T09:30:46.826Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c0052d4ade0d2e79f2bb0c76ababbc20e02355feebdfe6ecef99c19ff083f36f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'RMO', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/flux-rss/filiales/cote-d-ivoire/offres.xml', 'A classer', 'needs_review', 'RMO - Cote d''Ivoire https://www.rmo-jobcenter.com/fr.html RMO - Cote d''Ivoire https://www.rmo-jobcenter.com/fr.html https://www.rmo-jobcenter.com/images/img/logo_mail.jpg Le numero 1 du recrutement en Afrique de l''Ouest Fri, 12 Jun 2026 09:30:45 GMT http://backend.userland.com/rss092 fr https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html https://www.rmo-jobcenter.com/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-res', 'https://www.rmo-jobcenter.com/flux-rss/filiales/cote-d-ivoire/offres.xml', '2026-06-12T09:30:47.422Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eefeedc3fdcf4d4b6373b0aa216c18915023e8607051200d8e1be144a621d8dc', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4035-operations-manager.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4035-operations-manager.html', '2026-06-12T09:30:48.779Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1923d7d2eec6b481cc5731f7eec72fcd29a5482d12557e8b2d7c79af3564cc58', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4035-operations-manager.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4035-operations-manager.html', '2026-06-12T09:30:49.594Z', 0, 0, '2026-06-12T09:30:30.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eee428cf5817b0bb94044abab1ca98c9445072922734ee3fd1d9a1a477008731', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'ERREUR 404 : Page introuvable', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4036-commercial.html', 'A classer', 'needs_review', 'ERREUR 404 : Page introuvable A propos de RMO [+] Qui Sommes-Nous [+] Notre Savoir Faire [+] Nos Implantations [+] Nos Clients [+] Nos Partenaires [+] Actualit�s RMO [+] Nous Contacter Conseils Emploi [+] G�rer sa recherche d''emploi [+] Pr�parer son entretien d''embauche Diff�rents types d''entretien Le d�roulement de l''entretien Les erreurs � �viter lors d''un entretien de recrutement Quelques recommandations face au recruteur Exemples de questions de recruteurs Post-It � garder � ses c�t�s [+] L''entretien T�l�phonique Les appels � ne pas oublier Les attitudes � �viter [+] R�daction de son CV Construire sa strat�gie professionnelle Les parties principales d''un CV Les Diff�rents types de CV Recommandations et erreurs � �viter Les conseils � suivre Post-It � garder � ses c�t�s [+] La lettre de motivation Les erreurs � ne pas commettre Floril�ge des formulations � �viter [+] Choisir des Annon', 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4036-commercial.html', '2026-06-12T09:30:50.349Z', 0, 0, '2026-06-12T09:30:30.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('46824602532214a47b7ffccb308169ffb3e70d1c028189b7c239d963450d494f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4036-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4036-commercial.html', now(), 0, 0, '2026-06-12T09:30:30.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0769c5c57a32e2ef556f765166e4f93d95af222c6298eac3d5fb0d24281167ad', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'AGENT CONTROLE DRAFT (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4034-agent-controle-draft.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4034-agent-controle-draft.html', now(), 0, 0, '2026-06-12T09:30:30.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('375ef20e9c9ad54c02beb82833be78b6c563a62b1f3ddb2b7562fd78cd3e9d39', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4034-agent-controle-draft.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4034-agent-controle-draft.html', now(), 0, 0, '2026-06-12T09:30:30.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('76a313339992ae75e27e91cc7e06ea24568f13778f5c829e5aabe1237a73120f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Chef de Projet IT (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html', now(), 0, 0, '2026-06-12T09:30:30.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('49bf4a80b55c1dc95d9825d8963c86a80b37738cbbb01029c06266d23dbf4806', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4002-chef-projet-it.html', now(), 0, 0, '2026-06-12T09:30:30.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3cb6e5c553386f7e251f12310c0f629563b82378170930542faeb9f1de08d684', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'HSE (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4033-hse.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4033-hse.html', now(), 0, 0, '2026-06-12T09:30:30.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6971de5a8a04f7ddc53923e2a4e786863b8c907bdacb74929886677ca45fa847', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4033-hse.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4033-hse.html', now(), 0, 0, '2026-06-12T09:30:30.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('09ebbff177ac7f9e195fe01f0fa05be936cbaf90f7cd7978376fac5948199911', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Infographe / Webdesigner (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4032-infographe-webdesigner.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4032-infographe-webdesigner.html', now(), 0, 0, '2026-06-12T09:30:30.499Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9e63bb951eb7772a577a9d27692bd9a663c226846c791add35222ddb1fe9137a', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4032-infographe-webdesigner.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/services/4032-infographe-webdesigner.html', now(), 0, 0, '2026-06-12T09:30:30.499Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7e2aa83dafa81f596230059b5ef091f3dc0f16b90700c2d029ae72339df35bff', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Agent Front Office (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4031-agent-front-office.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4031-agent-front-office.html', now(), 0, 0, '2026-06-12T09:30:30.499Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d98e7a4d722190c4f32306c7622ccf17702706820aa3a46e70b69347e8e77fa', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4031-agent-front-office.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/mali/offres-emploi/ntic/4031-agent-front-office.html', now(), 0, 0, '2026-06-12T09:30:30.499Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('565d6a2e9f57973024c3de485658f1971d50dfee048903e9a6081312cd0dafc3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Office Manager (F/H) (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html', now(), 0, 0, '2026-06-12T09:30:30.499Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('524b033183e18005a1f016adaf53112e75adabd3337b5e23b8265fb4323de5e2', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4030-office-manager.html', now(), 0, 0, '2026-06-12T09:30:30.499Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('69b37c0224f2ada497a590d9153523f4dbbff5a86d4dee2867ec61082206ed67', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Responsable de la Cha�ne Logistique (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html', now(), 0, 0, '2026-06-12T09:30:30.499Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7fe22ca82eda080d3850b31e5d512cb3b1d4e3b9182506967abd9784e698a311', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4029-responsable-chaine-logistique.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f8cb467a8c551912f288e5eff28ec7cb209be78607cbbbeb100cc0027e5920c3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Magasinier (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4027-magasinier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4027-magasinier.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4767f91cbdcddfea01b0f2645d6690054224107a93c1d0f973b02bac311213a7', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4027-magasinier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/4027-magasinier.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c147cfb03b07e3cd661470d5685d0836d12fd02419b3f6ab4d785b188aada049', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Responsable Administratif et Financier (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4028-responsable-administratif.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4028-responsable-administratif.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a2a5a391841c9805bfb15b47ff6f82be298461370c13f11a94c8a49dbfddcdf', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4028-responsable-administratif.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/4028-responsable-administratif.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('90596d58732b3b3e0db98cc8a82f40063f22051f65e40328798f120e955a9270', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Responsable D�veloppement (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4025-responsable-developpement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4025-responsable-developpement.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9b6af42b9e7d6b03f51fe67f6fa714591b4820df82d797077dacf82cc0a3ea6e', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4025-responsable-developpement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4025-responsable-developpement.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cc086f45df19efab7646d577b21daa899367ee86a03433e993f6e16dda4f49c8', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Assistant(e) Administratif(e) (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4024-assistant-administratif.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4024-assistant-administratif.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4655b457e409088acf9d568a7ff6dccbd2230b2e3b5e8903d44abb154a2cdcd6', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4024-assistant-administratif.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4024-assistant-administratif.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6c2cb145487b9b72eec6c3789144f035bb4f29d4557bd50cde9a05891c4bc10a', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'P�tissier (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4026-patissier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4026-patissier.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8a763e3f1175e9b42c73cba1d29fd1c3f547961280938e29d834cfed5d1ab197', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4026-patissier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/4026-patissier.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bc075b55125c8e4a2d28c06f6a46abccfdf58c2c68514ea9bf7fba2fdfef2960', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Charg�(e) HSE (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/achat-logistique-transport/4023-charge-hse.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/achat-logistique-transport/4023-charge-hse.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('72e19d7b997b62b4d3d63bf5676336b8e56ccc2bde1383865b809440b927cebb', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/achat-logistique-transport/4023-charge-hse.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/achat-logistique-transport/4023-charge-hse.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a75b0f72f5ed7918da3ecde26ebc48dcc41e155c87d4739f7eeb5c2b43893fe', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Attach� Commercial (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/3985-attache-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/3985-attache-commercial.html', now(), 0, 0, '2026-06-12T09:30:30.500Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7470eab2e57163417216e1b460376c32423893679ac347d546e252d04748b98b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/3985-attache-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/services/3985-attache-commercial.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('55cae252cacdc08a5c302d151b1d614b4338d2d3c3584dd7c40a5b168f3dc928', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Responsable Commercial (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3978-responsable-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3978-responsable-commercial.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('240f025c2b467bdda973352a5e4f9642504cabc8c7d2a67e55ea1d2a35061357', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3978-responsable-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3978-responsable-commercial.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4ccdcab04c94af27538cc862093f9f28a9ae3cf72e46ea8ce23cec7d8bc17b07', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Directeur Commercial (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/ntic/4008-directeur-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/ntic/4008-directeur-commercial.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5f9202a1604f464d5df41283951d94a81ae3093682db586516df1e24ad90400f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/ntic/4008-directeur-commercial.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/ntic/4008-directeur-commercial.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6bffdb3a0c8fff55ae63827aebd368d9ccf060af06c66d84cf231a45e29e314f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'G�rant de restauration collective (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3977-gerant-restauration-collective.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3977-gerant-restauration-collective.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f63a8ad98bb87276095f86d6484e2b3ef17ad39fba622868a6c4f4c5ddbfbe56', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3977-gerant-restauration-collective.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/togo/offres-emploi/services/3977-gerant-restauration-collective.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('56b9cafccfff914e78e5dbdd1486d1017c74ed63d23f844f2ee960537bc58a48', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Responsable tr�sorerie (H/F)', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/3960-responsable-tresorerie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/3960-responsable-tresorerie.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3942c1023f06cdc5730f6e3449a1f49cadc3612aec13743735d8d9add18efb18', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', '+d�tails', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/3960-responsable-tresorerie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/cote-d-ivoire/offres-emploi/industrie-production-mat-1eres/3960-responsable-tresorerie.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5c70153af9b0e2c36d697c490b4fcc34c4af523b5c6d2415b042e63800063ef8', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'A propos de RMO', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('64b6bf1ff012f888c77cbea5b7a45abf12a36640dd3567c2b2dbd9435f728e87', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Qui Sommes-Nous', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/qui-sommes-nous.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/qui-sommes-nous.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2e01e3bb59e70e1398d65f4c9fb3893b9313025e16a0852aa398ad7754e1f300', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Savoir Faire', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/notre-savoir-faire.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/notre-savoir-faire.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('86538bb3a3258fe3b48dad8928009fb14e6de893fd4cff5c60cbd7791b2fb3e5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Implantations', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/nos-implantations.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/nos-implantations.html', now(), 0, 0, '2026-06-12T09:30:30.501Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('03d7d2c51db439e517974c3510bd5da28c281fcbaebafdc1ee5edd7070ee5644', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Clients', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/nos-clients.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/nos-clients.html', now(), 0, 0, '2026-06-12T09:30:30.502Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c5ede6653a75865a7be7286ee84bab9e5a5e3f7c787f9552850b663c00ec2b02', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Partenaires', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/nos-partenaires.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/nos-partenaires.html', now(), 0, 0, '2026-06-12T09:30:30.502Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a3890ab04a272e66e465eb7fedd0d1e6befba4924c0136fa107fb60de95f99d1', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Actualit�s RMO', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/rmo/actualites.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/rmo/actualites.html', now(), 0, 0, '2026-06-12T09:30:30.502Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('77d57f84d2ecf38bd22450731917b936026ab5f5b0b34aae40e2de0c3c3678ff', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Conseils Emploi', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi.html', now(), 0, 0, '2026-06-12T09:30:30.511Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('282fe02f6035ea1f78fb2b0bc0cbf8e86210075c72725ae8878627091aec6881', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'G�rer sa recherche d''emploi', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi.html', now(), 0, 0, '2026-06-12T09:30:30.511Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('357c96c279dc221d92aa94b39ff2dec4a04a2b0ba2a5c9db0e857b52e29ca368', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Pr�parer son entretien d''embauche', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche.html', now(), 0, 0, '2026-06-12T09:30:30.511Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('321b9dfdf23b0c459c9e6c49b5564508642605666d886fcbc3172b82324c2198', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Diff�rents types d''entretien', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/differents-types-entretien.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/differents-types-entretien.html', now(), 0, 0, '2026-06-12T09:30:30.511Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('70e196b31209530b38915cfb9f7a4202659686ca84f8119c1d1b014e3e50c49a', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Le d�roulement de l''entretien', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/deroulement-entretien.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/deroulement-entretien.html', now(), 0, 0, '2026-06-12T09:30:30.511Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8e0279c1c5e1c55cc532cb6398f962dc7adbbc9d65600cd19be108d4c6b5eb14', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les erreurs � �viter lors d''un entretien de recrutement', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/erreurs-eviter-entretien.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/erreurs-eviter-entretien.html', now(), 0, 0, '2026-06-12T09:30:30.511Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fec13d0451c763854100f03faadacc25a45361265cd977ec3f3c14e812b76914', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Post-It � garder � ses c�t�s', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/post-it-entretien-embauche.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/preparer-entretien-embauche/post-it-entretien-embauche.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('393ffdc4f3042e02c10a41fd733ed2d949e295f4c6d65407706e1519197d8e04', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'L''entretien T�l�phonique', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('889c5590fbb070ed43958c289b81f81b4faf02cfd2550e23a0a08ed9361922c5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les appels � ne pas oublier', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique/appel-pas-oublier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique/appel-pas-oublier.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ee416029c9e876b550f55dfd2efb4f782e9153edab21509d60b8bb4d3754e6c7', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les attitudes � �viter', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique/attitudes-eviter.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/entretien-telephonique/attitudes-eviter.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6a2aab59fe77355a7c3ad8fd2eb9e7efa19b262f021432998f27d53cf507c716', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'R�daction de son CV', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c833c302f4b57c00629a4dbe7c458acccca4bf9694adadd189c203504a5c26ee', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Construire sa strat�gie professionnelle', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/strategie-professionnelle.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/strategie-professionnelle.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c0588b107110ad5907424439dddbc51082ff5b24c04bbb965d17c91bc1daa8f1', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les parties principales d''un CV', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/parties-principales-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/parties-principales-cv.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2a9356adf2e053184869443bd167c27b800c0154718146e21be352d4e7cadc4b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les Diff�rents types de CV', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/differents-types-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/differents-types-cv.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ec789ccf134bd51f25e93a07c38dcb1c890da2bc8d939f90be8bb18fd2eaf64f', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Recommandations et erreurs � �viter', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/recommandations-erreurs-eviter.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/recommandations-erreurs-eviter.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b53c7d39675b517726d8631b3fa6408adaa609a2e90458a592bb26e585a4c0b2', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les conseils � suivre', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/conseils-suivre.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/conseils-suivre.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a9e60924fa9d16ff60f425482d11a39d9d8774f8f6e682970af1462c66011863', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Post-It � garder � ses c�t�s', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/post-it-redaction-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/redaction-cv/post-it-redaction-cv.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e78e997f40ce499b9eaa165c21b1b479277e6b76e8f6a7bdff9d8520aa892957', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'La lettre de motivation', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('196835397ab4308ce2344600245822a091a54d25b74ea81ebf32ab395105d044', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les erreurs � ne pas commettre', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation/erreurs-pas-commettre.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation/erreurs-pas-commettre.html', now(), 0, 0, '2026-06-12T09:30:30.512Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d6969b7e1ac3f2789ebccef90f7a7d9656d5bf18b07358f7256b2d2003a945cc', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Floril�ge des formulations � �viter', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation/florilege-formulations-eviter.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/lettre-motivation/florilege-formulations-eviter.html', now(), 0, 0, '2026-06-12T09:30:30.526Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fb639a7e899d144cecb4550e87cda7b1d2445c3be02ea229e0680b1187e47c96', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Choisir des Annonces', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces.html', now(), 0, 0, '2026-06-12T09:30:30.526Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('54808a39ab1825345ae51762ee4b94c30d8b272f70e21b34f1324f07fc88f6c5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Analyser les annonces et bien les s�lectionner', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/analyser-annonces-selectionner.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/analyser-annonces-selectionner.html', now(), 0, 0, '2026-06-12T09:30:30.526Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ec38ba91eae67481303eebed51641a3d1041da2bf2b30038396779a6e0e0d58c', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Quels sont les crit�res objectifs et subjectifs ?', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/criteres-objectifs-subjectifs.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/criteres-objectifs-subjectifs.html', now(), 0, 0, '2026-06-12T09:30:30.526Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5ea34da7da2cfeb2dae0cc624e26179f83ed01b4108be3c267e14e4d3bd82e8c', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Les erreurs � �viter', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/erreurs-eviter.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/erreurs-eviter.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eaed94471b59e6c1e96facb65eabb4f4d0892cc23b4f4a0c194ab8c2611a8596', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Quelques recommandations ?', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/quelques-recommandations.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/quelques-recommandations.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ce646558294e0d492806a1e4525c669f0461f4b47f5d39c970d843bb1981537', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Post-It � garder � ses c�t�s', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/post-it-choisir-annonce.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/gerer-recherche-emploi/choisir-annonces/post-it-choisir-annonce.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2abffdfd7d7357848b5ab7631261b9ebb29a1554b3a135cbd09cc5ae9c4ec417', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Conna�tre ses Droits', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('05d0e3697b57b34d9018c2e3a3132a9990e453a049552b7e8ca3f79bc19f97b5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Explication du Bulletin de Paie', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/explication-bulletin-paie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/explication-bulletin-paie.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('966a6473cb85ff338757aa10ba67a0ff7e5c987ed3d3f4a01862a2072c6e40e5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Le Contrat de Mission', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/contrat-mission.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/contrat-mission.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8516579301c555c46bd0811938e454bb3e3d93932f0814f1de0b547bcf8fde51', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Lexique Juridique', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/lexique-juridique.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/lexique-juridique.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a0f38934bb6c5af91992b353bb8481b254ec198984d04805f576fdd93bfdbc4', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Documentations L�gales', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/documentations-legales.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/connaitre-droits/documentations-legales.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d95108c4f194130f563bc3ac0626d5a4fabd55229ca0c679809d5f4d184200a3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Contr�le Qualit�', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/controle-qualite.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/controle-qualite.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('35d27e1259ba00a96dc35e573c9fd7dd4b1ad83be3af24be313a4dd5ede4d727', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Fiches M�tier', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/fiches-metier.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/fiches-metier.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('621a82e7e3e27d3bf1dedd8eabd4012efb74b4f71bd8261358abff98a924ba15', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Actu Conseil', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/actu-conseils.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/conseils-emploi/actu-conseils.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3f34dc55f5b39ff7a29e54c69a5b3106307a8e5359bfe6826dd383760c28fc59', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'D�p�t de CV', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/depot-cv.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/depot-cv.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('22fe8d9b2824b86ce4bc46a91fd645482cbd1a9c23a21831ee33e618bcbac724', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Agent de recherche', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/agent-recherche.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/agent-recherche.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('17a1dcd594f86916c080ffc57b704feb20af2860a37b6820d03a2534b886fef7', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Tests RH', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/tests-rh.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/tests-rh.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bce8afd74846a248a7c4b2c7199f3ae6d04716bbb9f80be6a3e41731baadbc73', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Boite � outils', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/boite-outils.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/boite-outils.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9dc18d4ee141795bd47ae16e4ee0c9b498de320714884be2effc36d6832a623b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Conseil juridique', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/boite-outils/conseil-juridique.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/boite-outils/conseil-juridique.html', now(), 0, 0, '2026-06-12T09:30:30.527Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c69cd620aedf5e865d28943da6756ea194d532359d36605a149753be68adcea1', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Questions-r�ponses', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/questions-reponses.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/questions-reponses.html', now(), 0, 0, '2026-06-12T09:30:30.528Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a70552f27b42307e6d8033897f569defd1ece938afdef40e6145e5b1a5c85046', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Demande de documents', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/demande-documents.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/candidats/demande-documents.html', now(), 0, 0, '2026-06-12T09:30:30.528Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('017d017c49bb9e8d7b9ec1d514b71c096ac991ab252e98496a2979528632f6a2', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Espace Entreprises', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises.html', now(), 0, 0, '2026-06-12T09:30:30.528Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('92f6766a9a3f1a5b612aeb2a120c2e1dda9126c2fa95fd05c552a9ed7d65c49d', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Services', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services.html', now(), 0, 0, '2026-06-12T09:30:30.528Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('91c2e13d6f50bd97529d4506fcc73b60ea375a78c66e6c4ec1ea33b0fa8e2816', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Recrutement', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement.html', now(), 0, 0, '2026-06-12T09:30:30.528Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1b883d94f2ccc39c68b37e67a13f3764c77f3529df520ebab63938d73ba536d3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos Offres', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/nos-offres.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/nos-offres.html', now(), 0, 0, '2026-06-12T09:30:30.528Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('825f06e4d7aa69ccf9d3100801b6a929938ed4d92d90e9ac0bc9fd589a5b5867', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/notre-agrement.html', now(), 0, 0, '2026-06-12T09:30:30.528Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5069a18bc17905f920fddf92df9ceb6d045add234ffc47f0226f4edc88db409b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Nos tests RH avec Central Test', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/nos-tests-rh.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/recrutement/nos-tests-rh.html', now(), 0, 0, '2026-06-12T09:30:30.528Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('935d3467af0f2ad0cc5cbb236de2b64cb7edf87c513d3461827face59a1bdbc5', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Travail Temporaire', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire.html', now(), 0, 0, '2026-06-12T09:30:30.528Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2663bed0c39ce0e336b2cf3c705dcfa761f85228a223b9552f471120a745aa27', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Le Contrat de Mission', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire/contrat-mission.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire/contrat-mission.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1f08f0bdd86045fe74c1be10e78999ec9f315949d931c77426fe3c4714ba8512', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/travail-temporaire/notre-agrement.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('47b19571fddd78edbdd845bdae079439f595e1f84d075c15996b1cc0215d592b', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Sous Traitance', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/sous-traitance.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/sous-traitance.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0ffc5df8a49e9720bdf98da78282696582b8a91b6fcdbfb83b2e5c0bfafd0827', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/sous-traitance/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/sous-traitance/notre-agrement.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6936ed394eb5fd81ccc81348b5bc526da823ae11f1553fde6c17e4e8555e2194', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/formation/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/formation/notre-agrement.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('21462ca4a00c56eec090cce13c8804dc0116879bf3032949f98d664f7ee4397e', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Conseil RH', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/conseil-rh.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/conseil-rh.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('be9b479e6137f5977a318813f95ad27330cf8ec35ae6b5958708057c836885d1', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Notre Agr�ment', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/conseil-rh/notre-agrement.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/conseil-rh/notre-agrement.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e162dba5dcd381748b68d86f08a9b2d7e59d8dc16e5a42622aeb1e7171f20323', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Marketing Event', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/marketing-event.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/nos-services/marketing-event.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f3a63f5c1381e66089d0d6469b32d6512256f7ae92de96d232a0026a5383f71d', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'T�moignages Clients', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/temoignages.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/temoignages.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c90a73aa45d8fa32704a7586ad2c0a98daaff02f86bf3b2bfac10b2d9c59c9c4', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Demande de Cotation Express', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/demande-cotation-express.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/demande-cotation-express.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fa5ec49d04977a577c542e6e464a5c89f912cd499594d3e0b91df2c727b08828', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Service Web', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/service-web.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/cote-d-ivoire/entreprises/service-web.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('402ec3f4439bbbb6bb88212b296408e0ccd840af9a5c0aad693ebd80800c3548', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Espace Employ�s', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/espace-employes.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/espace-employes.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5d67d96680e7435c51250623a41b01c6d461da08a957fd695d39414e7023ffae', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Demande de documents', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/espace-employes/demande-documents.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/espace-employes/demande-documents.html', now(), 0, 0, '2026-06-12T09:30:30.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3bd992090ff9e05604cd2fa51708a8b51f4862aaaa22f272556812ffde76ff6c', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Politique de Confidentialit�', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/politique-confidentialite.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/politique-confidentialite.html', now(), 0, 0, '2026-06-12T09:30:30.530Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3daa83ca29f6070345777c046bde2c0122ca6dd34e5367ac2f03bcacd9817ac3', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'Politique de Gestion des Cookies', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/politique-cookie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/politique-cookie.html', now(), 0, 0, '2026-06-12T09:30:30.530Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('64b7c4967ae2e2a4464751a75136e66ffa16730c664f9a90d0e18d895417824e', 'rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'charte cookies', 'RMO Job Center', 'Burkina Faso', null, null, null, false, 'https://www.rmo-jobcenter.com/fr/fr/politique-cookie.html', 'A classer', 'needs_review', null, 'https://www.rmo-jobcenter.com/fr/fr/politique-cookie.html', now(), 0, 0, '2026-06-12T09:30:30.530Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('34dcc02ae58f1eb0bfc31be3b88b68655dc78308b515ef2a45034230efc4a176', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Chargé de projet en maladies tropicales négligées', 'HumanitaireHub', 'Burkina Faso', '2026-06-25', null, '2026-06-25', false, 'https://humanitairehub.com/emploi/charge-de-projet-en-maladies-tropicales-negligees-2/', 'A classer', 'needs_review', 'Chargé de projet en maladies tropicales négligées - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Chargé de projet en maladies tropicales négligées ← Retour aux offres CBM Chargé de projet en maladies tropicales négligées 📍 Central African Republic · 📄 CDD ⏰ Deadline 25 Juin 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Santé Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Central African Republic Date de clôture 25 juin 2026 Organisation Christian Blind Mission Expérience requise 5-9 years Catégorie Program/Project Management About CBM CBM (registered as CBM Christoffel-Blindenmission Christian Blind Mission e.V', 'https://humanitairehub.com/emploi/charge-de-projet-en-maladies-tropicales-negligees-2/', '2026-06-12T09:31:03.916Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('141c9a0b47794f7e4f3d59291d26501bd09f456ecaf76d296fc18ada91dc4dbc', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Chargé de projet en maladies tropicales négligées', 'HumanitaireHub', 'Burkina Faso', '2026-06-25', null, '2026-06-25', false, 'https://humanitairehub.com/emploi/charge-de-projet-en-maladies-tropicales-negligees-2/', 'A classer', 'needs_review', 'Chargé de projet en maladies tropicales négligées - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Chargé de projet en maladies tropicales négligées ← Retour aux offres CBM Chargé de projet en maladies tropicales négligées 📍 Central African Republic · 📄 CDD ⏰ Deadline 25 Juin 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Santé Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Central African Republic Date de clôture 25 juin 2026 Organisation Christian Blind Mission Expérience requise 5-9 years Catégorie Program/Project Management About CBM CBM (registered as CBM Christoffel-Blindenmission Christian Blind Mission e.V', 'https://humanitairehub.com/emploi/charge-de-projet-en-maladies-tropicales-negligees-2/', '2026-06-12T09:31:04.529Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5e4d4573c768fe3daca6a1ccf4ae157bd244ef32b4f89045a96ad6507141f85e', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Officier Moyens de Subsistance et Autonomisation Économique – AVSI', 'HumanitaireHub', 'Burkina Faso', '2026-06-25', null, '2026-06-25', false, 'https://humanitairehub.com/emploi/officier-moyens-de-subsistance-et-autonomisation-economique-avsi/', 'A classer', 'needs_review', 'Officier Moyens de Subsistance et Autonomisation Économique – AVSI - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Officier Moyens de Subsistance et Autonomisation Économique – AVSI ← Retour aux offres AVSI Officier Moyens de Subsistance et Autonomisation Économique – AVSI 📍 Kananga, RD Congo · 📄 CDD ⏰ Deadline 25 Juin 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Moyens d''existence Relèvement Précoce Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 💼 Offre d’emploi : Officier Moyens de Subsistance et Autonomisation Économique – AVSI, Kananga (RDC) 📍 Lieu : Kananga, République Démocratique du Congo 📅 Date limite de candidature : 25 juin', 'https://humanitairehub.com/emploi/officier-moyens-de-subsistance-et-autonomisation-economique-avsi/', '2026-06-12T09:31:07.494Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('65a188d1b70cc6791b50751714a360fbc10d0da0b1cb12458d10fe4dd036d8fa', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Officier Moyens de Subsistance et Autonomisation Économique – AVSI', 'HumanitaireHub', 'Burkina Faso', '2026-06-25', null, '2026-06-25', false, 'https://humanitairehub.com/emploi/officier-moyens-de-subsistance-et-autonomisation-economique-avsi/', 'A classer', 'needs_review', 'Officier Moyens de Subsistance et Autonomisation Économique – AVSI - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Officier Moyens de Subsistance et Autonomisation Économique – AVSI ← Retour aux offres AVSI Officier Moyens de Subsistance et Autonomisation Économique – AVSI 📍 Kananga, RD Congo · 📄 CDD ⏰ Deadline 25 Juin 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Moyens d''existence Relèvement Précoce Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 💼 Offre d’emploi : Officier Moyens de Subsistance et Autonomisation Économique – AVSI, Kananga (RDC) 📍 Lieu : Kananga, République Démocratique du Congo 📅 Date limite de candidature : 25 juin', 'https://humanitairehub.com/emploi/officier-moyens-de-subsistance-et-autonomisation-economique-avsi/', '2026-06-12T09:31:08.724Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e43f1ea38e656f1120a2cbbbd86e9bb7d42c5d9a5203e95e23ee4b09650a25c0', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Coordinateur.rice Terrain (H/F)', 'HumanitaireHub', 'Burkina Faso', '2026-06-28', null, '2026-06-28', false, 'https://humanitairehub.com/emploi/coordinateur-rice-terrain-h-f/', 'A classer', 'needs_review', 'Coordinateur.rice Terrain (H/F) - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Coordinateur.rice Terrain (H/F) ← Retour aux offres Solidarités International Coordinateur.rice Terrain (H/F) 📍 Natitingou, Bénin · 📄 CDD ⏰ Deadline 28 Juin 2026 J-16 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Management & Coordination Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 🌍 Offre d’emploi : Coordinateur.rice Terrain (H/F) – Solidarités International, Natitingou (Bénin) 📍 Lieu : Natitingou, Bénin 📅 Date de début souhaitée : 27 juillet 2026 ⏳ Durée de la mission : 8 mois (CDD salarié) 🎓 Niveau requis : Bac +5 (Master en action humanitaire, sciences polit', 'https://humanitairehub.com/emploi/coordinateur-rice-terrain-h-f/', '2026-06-12T09:31:11.392Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('15b13f03d8d90da9f34840014070db5bc98139bde02e053bc8355af4328c2a5c', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Coordinateur.rice Terrain (H/F)', 'HumanitaireHub', 'Burkina Faso', '2026-06-28', null, '2026-06-28', false, 'https://humanitairehub.com/emploi/coordinateur-rice-terrain-h-f/', 'A classer', 'needs_review', 'Coordinateur.rice Terrain (H/F) - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Coordinateur.rice Terrain (H/F) ← Retour aux offres Solidarités International Coordinateur.rice Terrain (H/F) 📍 Natitingou, Bénin · 📄 CDD ⏰ Deadline 28 Juin 2026 J-16 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Management & Coordination Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 🌍 Offre d’emploi : Coordinateur.rice Terrain (H/F) – Solidarités International, Natitingou (Bénin) 📍 Lieu : Natitingou, Bénin 📅 Date de début souhaitée : 27 juillet 2026 ⏳ Durée de la mission : 8 mois (CDD salarié) 🎓 Niveau requis : Bac +5 (Master en action humanitaire, sciences polit', 'https://humanitairehub.com/emploi/coordinateur-rice-terrain-h-f/', '2026-06-12T09:31:12.208Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0c6185d245afd0d36c77400642187a8725a4dbdfc9bd9dbf5ed09afab010f07e', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant Financier SMC – Malaria Consortium', 'HumanitaireHub', 'Burkina Faso', '2026-06-21', null, '2026-06-21', false, 'https://humanitairehub.com/emploi/assistant-financier-smc-malaria-consortium/', 'A classer', 'needs_review', 'Assistant Financier SMC – Malaria Consortium - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant Financier SMC – Malaria Consortium ← Retour aux offres Malaria Consortium Assistant Financier SMC – Malaria Consortium 📍 Ouagadougou, Burkina Faso · 📄 CDD ⏰ Deadline 21 Juin 2026 J-9 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Administration & Finance Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 💼 Offre d’emploi : Assistant Financier SMC – Malaria Consortium Burkina Faso 📍 Lieu : Ouagadougou, Burkina Faso 💰 Salaire annuel : 3 985 847 CFA 🕒 Type de contrat : CDD – 6 mois (temps plein, temporaire) 🎓 Niveau requis : Bac +2 en finance, compt', 'https://humanitairehub.com/emploi/assistant-financier-smc-malaria-consortium/', '2026-06-12T09:31:13.333Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d1ea15bf3f8f44c3822e54b46bb73afcef79b758f948e2c86dd3da1fe204c8cc', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant Financier SMC – Malaria Consortium', 'HumanitaireHub', 'Burkina Faso', '2026-06-21', null, '2026-06-21', false, 'https://humanitairehub.com/emploi/assistant-financier-smc-malaria-consortium/', 'A classer', 'needs_review', 'Assistant Financier SMC – Malaria Consortium - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant Financier SMC – Malaria Consortium ← Retour aux offres Malaria Consortium Assistant Financier SMC – Malaria Consortium 📍 Ouagadougou, Burkina Faso · 📄 CDD ⏰ Deadline 21 Juin 2026 J-9 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Administration & Finance Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 💼 Offre d’emploi : Assistant Financier SMC – Malaria Consortium Burkina Faso 📍 Lieu : Ouagadougou, Burkina Faso 💰 Salaire annuel : 3 985 847 CFA 🕒 Type de contrat : CDD – 6 mois (temps plein, temporaire) 🎓 Niveau requis : Bac +2 en finance, compt', 'https://humanitairehub.com/emploi/assistant-financier-smc-malaria-consortium/', '2026-06-12T09:31:15.302Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6460fa0f21bb12dbf277c31cf962c53b6ae4b5a0515dd3ed3c23b9b940b16560', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant Financier – Malaria Consortium', 'HumanitaireHub', 'Burkina Faso', '2026-06-22', null, '2026-06-22', false, 'https://humanitairehub.com/emploi/assistant-financier-malaria-consortium/', 'A classer', 'needs_review', 'Assistant Financier – Malaria Consortium - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant Financier – Malaria Consortium ← Retour aux offres Malaria Consortium Assistant Financier – Malaria Consortium 📍 Ouagadougou, Burkina Faso · 📄 CDD ⏰ Deadline 21 Juin 2026 J-9 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Administration & Finance Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 💼 Offre d’emploi : Assistant Financier – Malaria Consortium Burkina Faso 📍 Lieu : Ouagadougou, Burkina Faso 📅 Date de publication : juin 2026 ⏳ Date limite de candidature : 22 juin 2026 🕒 Type de contrat : CDD – 12 mois (possibilité de renouvellement) 💰 Sala', 'https://humanitairehub.com/emploi/assistant-financier-malaria-consortium/', '2026-06-12T09:31:16.431Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d92abad36651b4d005bf0986f679493b492ce05b317718e6b40cc1392643763e', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant Financier – Malaria Consortium', 'HumanitaireHub', 'Burkina Faso', '2026-06-22', null, '2026-06-22', false, 'https://humanitairehub.com/emploi/assistant-financier-malaria-consortium/', 'A classer', 'needs_review', 'Assistant Financier – Malaria Consortium - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant Financier – Malaria Consortium ← Retour aux offres Malaria Consortium Assistant Financier – Malaria Consortium 📍 Ouagadougou, Burkina Faso · 📄 CDD ⏰ Deadline 21 Juin 2026 J-9 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Administration & Finance Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 💼 Offre d’emploi : Assistant Financier – Malaria Consortium Burkina Faso 📍 Lieu : Ouagadougou, Burkina Faso 📅 Date de publication : juin 2026 ⏳ Date limite de candidature : 22 juin 2026 🕒 Type de contrat : CDD – 12 mois (possibilité de renouvellement) 💰 Sala', 'https://humanitairehub.com/emploi/assistant-financier-malaria-consortium/', '2026-06-12T09:31:17.389Z', 0, 0, '2026-06-12T09:31:02.792Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a723a8542d6b0f36379e45ec2e3b46d4f7d77fa327c1eae26b301e6462406057', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Directeur/Responsable des opérations', 'HumanitaireHub', 'Burkina Faso', '2026-09-05', null, '2026-09-05', false, 'https://humanitairehub.com/emploi/directeur-responsable-des-operations/', 'A classer', 'needs_review', 'Directeur/Responsable des opérations - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Directeur/Responsable des opérations ← Retour aux offres One Acre Fund Directeur/Responsable des opérations 📍 Burundi · 📄 CDD ⏰ Deadline 05 Sep 2026 J-85 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Administration & Finance Management & Coordination Support Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Burundi Date de clôture 05 septembre 2026 Organisation One Acre Fund Expérience requise 5-9 years Catégorie Program/Project Management About One Acre Fund Founded in 2006, One Acre Fund equips 5.5 million smallholder farmers to make their', 'https://humanitairehub.com/emploi/directeur-responsable-des-operations/', '2026-06-12T09:31:18.764Z', 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d33eb0a9ad363e92a3b9bf66df7c147485781cc7012a396d04c0c942fdcd9e92', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Directeur/Responsable des opérations', 'HumanitaireHub', 'Burkina Faso', '2026-09-05', null, '2026-09-05', false, 'https://humanitairehub.com/emploi/directeur-responsable-des-operations/', 'A classer', 'needs_review', 'Directeur/Responsable des opérations - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Directeur/Responsable des opérations ← Retour aux offres One Acre Fund Directeur/Responsable des opérations 📍 Burundi · 📄 CDD ⏰ Deadline 05 Sep 2026 J-85 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Administration & Finance Management & Coordination Support Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Burundi Date de clôture 05 septembre 2026 Organisation One Acre Fund Expérience requise 5-9 years Catégorie Program/Project Management About One Acre Fund Founded in 2006, One Acre Fund equips 5.5 million smallholder farmers to make their', 'https://humanitairehub.com/emploi/directeur-responsable-des-operations/', '2026-06-12T09:31:20.890Z', 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('71907e0938744a939a18f1fa026e66988217b2d6021ee3de9f3d894674a967cb', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable d&rsquo;entrepôt', 'HumanitaireHub', 's des États-Unis', '2026-07-10', null, '2026-07-10', false, 'https://humanitairehub.com/emploi/responsable-dentrepot/', 'A classer', 'needs_review', 'Responsable d''entrepôt - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable d&rsquo;entrepôt ← Retour aux offres International Rescue Committee (IRC) Responsable d&rsquo;entrepôt 📍 Democratic Republic of the Congo · 📄 CDD ⏰ Deadline 26 Juil 2026 J-44 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale Logistique Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Democratic Republic of the Congo Date de clôture 10 juillet 2026 Organisation International Rescue Committee Expérience requise 3-4 years Catégorie Logistics/Procurement À PROPOS DE L’IRC Le Comité international de secours (IRC) répond aux pires crises humanitai', 'https://humanitairehub.com/emploi/responsable-dentrepot/', '2026-06-12T09:31:22.000Z', 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9b044da85f3255fa9c49889c50a2bde27ca66492076cb0a03540f246ab60b68f', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable d&rsquo;entrepôt', 'HumanitaireHub', 's des États-Unis', '2026-07-10', null, '2026-07-10', false, 'https://humanitairehub.com/emploi/responsable-dentrepot/', 'A classer', 'needs_review', 'Responsable d''entrepôt - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable d&rsquo;entrepôt ← Retour aux offres International Rescue Committee (IRC) Responsable d&rsquo;entrepôt 📍 Democratic Republic of the Congo · 📄 CDD ⏰ Deadline 26 Juil 2026 J-44 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale Logistique Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Democratic Republic of the Congo Date de clôture 10 juillet 2026 Organisation International Rescue Committee Expérience requise 3-4 years Catégorie Logistics/Procurement À PROPOS DE L’IRC Le Comité international de secours (IRC) répond aux pires crises humanitai', 'https://humanitairehub.com/emploi/responsable-dentrepot/', '2026-06-12T09:31:22.958Z', 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2434efbfe120835f892b5e8f7bb416ea939291afb18eed763085abf0b214f441', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable des achats', 'HumanitaireHub', 's aux États-Unis', '2026-07-10', null, '2026-07-10', false, 'https://humanitairehub.com/emploi/responsable-des-achats/', 'A classer', 'needs_review', 'Responsable des achats - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable des achats ← Retour aux offres International Rescue Committee (IRC) Responsable des achats 📍 Democratic Republic of the Congo · 📄 CDD ⏰ Deadline 26 Juil 2026 J-44 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale Logistique Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Democratic Republic of the Congo Date de clôture 10 juillet 2026 Organisation International Rescue Committee Expérience requise 3-4 years Catégorie Logistics/Procurement À PROPOS DE L’IRC Le Comité international de secours (IRC) répond aux pires crises humanitaires du monde', 'https://humanitairehub.com/emploi/responsable-des-achats/', '2026-06-12T09:31:23.977Z', 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('513461c127020b427c0f56d29874021668adf118c40647015464a03fdc27f9bc', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable des achats', 'HumanitaireHub', 's aux États-Unis', '2026-07-10', null, '2026-07-10', false, 'https://humanitairehub.com/emploi/responsable-des-achats/', 'A classer', 'needs_review', 'Responsable des achats - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable des achats ← Retour aux offres International Rescue Committee (IRC) Responsable des achats 📍 Democratic Republic of the Congo · 📄 CDD ⏰ Deadline 26 Juil 2026 J-44 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale Logistique Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Democratic Republic of the Congo Date de clôture 10 juillet 2026 Organisation International Rescue Committee Expérience requise 3-4 years Catégorie Logistics/Procurement À PROPOS DE L’IRC Le Comité international de secours (IRC) répond aux pires crises humanitaires du monde', 'https://humanitairehub.com/emploi/responsable-des-achats/', '2026-06-12T09:31:24.813Z', 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('049a8be0290dd64b3a09e0b4440e3b6852e1746c4b6d761c375552fe9bfbc724', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Sustainable Agriculture Innovation Lead', 'HumanitaireHub', 'Burkina Faso', '2026-09-08', null, '2026-09-08', false, 'https://humanitairehub.com/emploi/sustainable-agriculture-innovation-lead/', 'A classer', 'needs_review', 'Sustainable Agriculture Innovation Lead - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Sustainable Agriculture Innovation Lead ← Retour aux offres One Acre Fund Sustainable Agriculture Innovation Lead 📍 Rwanda · 📄 CDD ⏰ Deadline 08 Sep 2026 J-88 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale Sécurité Alimentaire Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Rwanda Date de clôture 08 septembre 2026 Organisation One Acre Fund Expérience requise 3-4 years Catégorie Program/Project Management About One Acre Fund Founded in 2006, One Acre Fund equips 5.5 million smallholder farmers to make their farms more productive. Ac', 'https://humanitairehub.com/emploi/sustainable-agriculture-innovation-lead/', '2026-06-12T09:31:27.165Z', 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4be5ec1fae32091bc4acae469252128be2c6b70af3f442eaea5cc8ed9d6d1229', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Sustainable Agriculture Innovation Lead', 'HumanitaireHub', 'Burkina Faso', '2026-09-08', null, '2026-09-08', false, 'https://humanitairehub.com/emploi/sustainable-agriculture-innovation-lead/', 'A classer', 'needs_review', 'Sustainable Agriculture Innovation Lead - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Sustainable Agriculture Innovation Lead ← Retour aux offres One Acre Fund Sustainable Agriculture Innovation Lead 📍 Rwanda · 📄 CDD ⏰ Deadline 08 Sep 2026 J-88 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale Sécurité Alimentaire Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Pays Rwanda Date de clôture 08 septembre 2026 Organisation One Acre Fund Expérience requise 3-4 years Catégorie Program/Project Management About One Acre Fund Founded in 2006, One Acre Fund equips 5.5 million smallholder farmers to make their farms more productive. Ac', 'https://humanitairehub.com/emploi/sustainable-agriculture-innovation-lead/', '2026-06-12T09:31:28.304Z', 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('06ea7b12b3e923e914a07347b2961956addcc73111666a6c74804e0d3dc8732b', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'ALIMA J-13 Responsable Administration de Projet (H/F) 📍 Burkina Faso 📋 CDD Administration & Finance', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-administration-de-projet-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-administration-de-projet-h-f/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5bbf6057d02692a1c7c4cec7830cdf978a9a311c3888dae170fb326568d9a40b', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-administration-de-projet-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-administration-de-projet-h-f/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('301ac1a807d97ade403dd26edb04c7b0e468275f4bc810eed2cb97efa3195999', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'PNUD / UNDP J-13 Spécialiste Genre et Changement Climatique – Mali 📍 Mali 📋 CDD Environnement & Climat Management & Coordination Protection, Genre & Inclusion', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/specialiste-genre-et-changement-climatique-mali/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/specialiste-genre-et-changement-climatique-mali/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e92aeb775ec01ddd94c9c327065bf03ed6c95c99d330e6803b044107219433ec', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/specialiste-genre-et-changement-climatique-mali/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/specialiste-genre-et-changement-climatique-mali/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a78f3a1dea0d3db9e21754a7148b602eca44a15b74592d14299cc5c77542a142', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Mercy Corps J-7 Offre de Stage : Initiative Mercy Corps Niger – Développement des talents et du leadership 📍 Niger 📋 Staff National Plusieurs Secteurs', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/offre-de-stage-initiative-mercy-corps-niger-developpement-des-talents-et-du-leadership/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/offre-de-stage-initiative-mercy-corps-niger-developpement-des-talents-et-du-leadership/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9d2c2b0f45abfd11dd87a277525a65b3c77ff8b20a5f3b8d1c3796cd5ae4728c', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/offre-de-stage-initiative-mercy-corps-niger-developpement-des-talents-et-du-leadership/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/offre-de-stage-initiative-mercy-corps-niger-developpement-des-talents-et-du-leadership/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cab673179579b3da570ea91cc5ce7ed09dd8aef8cfa567a95a48a87f08e3d9bd', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Danish Refugee Council (DRC) J-14 Spécialiste Finances – Fonds Régional pour le Sahel (SRF) 📍 Tchad 📋 CDD Administration & Finance', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/specialiste-finances-fonds-regional-pour-le-sahel-srf/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/specialiste-finances-fonds-regional-pour-le-sahel-srf/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('332fef156afcd71d5f52e936a286ed87d0636ae3ff4535e7bac5253447c69a86', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/specialiste-finances-fonds-regional-pour-le-sahel-srf/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/specialiste-finances-fonds-regional-pour-le-sahel-srf/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a5aa7c83ee1496d6a40840532a73353956a79d6ee4f4efed5972ba1c15f29e5b', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Norwegian Refugee Council (NRC) J-13 Logistics Technical Fleet Assistant 📍 Centrafrique 📋 CDD Logistique', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/logistics-technical-fleet-assistant/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/logistics-technical-fleet-assistant/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('94b0db892b7f7c72b3c75b2a04fb35695deef8c2fed3885d1d39b806c50f585f', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/logistics-technical-fleet-assistant/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/logistics-technical-fleet-assistant/', now(), 0, 0, '2026-06-12T09:31:02.793Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9e657d3e331379e5a64bedc664dca81fe3bce56427f7d81d4aade13cc0b8fe31', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Première Urgence Internationale (PUI) J-10 Coordinateur·trice MHPSS 📍 RD Congo 📋 CDD 💰 Jusqu''a 2 900 EUR/mois Administration & Finance Management & Coordinat', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordinateur%c2%b7trice-mhpss/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordinateur%c2%b7trice-mhpss/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4fad4e5e5e272543b1de36ce853f3f57b36fdab06be0ef444f9c8576872282a4', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordinateur%c2%b7trice-mhpss/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordinateur%c2%b7trice-mhpss/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('afeb83c603fbc9b0d4b36b5d99fe5df618db60cb9911788b95d0eabff1a799fd', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Croix-Rouge française Non precisee Référent technique SDSN régional 📍 Togo 📋 CDD Administration & Finance Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/referent-technique-sdsn-regional/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/referent-technique-sdsn-regional/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bc41f06fbd115f8f82ae381cbe4234b0ebde988a9df9b49775ab94883f669f14', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/referent-technique-sdsn-regional/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/referent-technique-sdsn-regional/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('480f5d0ed4dee72c6611d9fb5c4bd6202d4c1b15cc5b0552c5c9b48682f4351b', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Mercy Corps J-10 Mercy Corps recrute 02 postes 📍 RD Congo 📋 CDD Accès humanitaire Management & Coordination Sécurité', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/mercy-corps-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/mercy-corps-recrute-02-postes/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cfeb901184ed5aad7798feb741381b3d3538d93bce841a1663cacacfcba45190', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/mercy-corps-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/mercy-corps-recrute-02-postes/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('05eaf88ae263838e2de1cabfd6f4b40ecb764704f8a936356fc91468651a268b', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Family Health International (FHI360) J-13 Conseiller(e) Technique Clinique 📍 Sénégal 📋 CDD Santé', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/conseillere-technique-clinique/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/conseillere-technique-clinique/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9879f855ac108d6eb2ae221655b9c93d7d8687f0b36562f34210b43eb8454fed', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/conseillere-technique-clinique/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/conseillere-technique-clinique/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('da4fe804c63c9e77b8eb3d900a03b03d599283184df0e12f8585edb0eb4e79e5', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'ALIMA J-11 Responsable Relations Bailleurs &#8211; H/F 📍 Mauritanie 📋 CDD Gouvernance & Plaidoyer Grants & Subventions Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-relations-bailleurs-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-relations-bailleurs-h-f/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('334509fca624b2b2349fa675cd9d70cc98ef720516370f38f46f449836823e8a', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-relations-bailleurs-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-relations-bailleurs-h-f/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0a0cf872b390f8b9ee47766661b21f327273e635507a43e2b0d72a659a03c71e', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'PAM (Programme Alimentaire Mondial) J-9 Adjoint.e à la Communication SC-L6 📍 Guinée- Conakry 📋 CDD Communication', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/adjoint-e-a-la-communication-sc-l6/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/adjoint-e-a-la-communication-sc-l6/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('967613e15eb72964bda1b0a5dc82689bbba9cb73baeca841c373c8f9a4009a21', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/adjoint-e-a-la-communication-sc-l6/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/adjoint-e-a-la-communication-sc-l6/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b37ed5e20aedd60dd7521fad1cd7b98dd952bd38ce2f820dc3a20142937d8693', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Département d''État américain J-12 Département d&rsquo;État américain recrute 02 postes 📍 Côte d''Ivoire/Togo 📋 CDD Management & Coordination Santé', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/departement-detat-americain-recrute-02-postes-2/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/departement-detat-americain-recrute-02-postes-2/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1da398413104494635fd582964f4e9f2fbea8dac2a014470d6516d71197ec633', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/departement-detat-americain-recrute-02-postes-2/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/departement-detat-americain-recrute-02-postes-2/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('faf2604fa08de203e6217d2ffcd1bfea21a58a05f5106e28c1d596b3471133fe', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'ECHO (Protection civile UE) J-15 Assistant(e) Administratif(ve) et Logistique (ALA) 📍 Sénégal 📋 CDD Logistique', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/assistante-administratifve-et-logistique-ala/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/assistante-administratifve-et-logistique-ala/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b9fd7d4696adcafd231369eb2a1224b76cd26a120210082ee0f53f795ed16e77', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/assistante-administratifve-et-logistique-ala/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/assistante-administratifve-et-logistique-ala/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1f8967d1c0b7c6bb2f10b509caa8db43a9e8f6efb31a04027ea2b417e8be5493', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'International Rescue Committee (IRC) J-9 IRC recrute Gestionnaire IPC 📍 RD Congo 📋 CDD Management & Coordination Santé', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/irc-recrute-gestionnaire-ipc/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/irc-recrute-gestionnaire-ipc/', now(), 0, 0, '2026-06-12T09:31:02.794Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('485066e377dd309bf090b451ac96ab32337ab3d099837dbd3ae382145e9ca831', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/irc-recrute-gestionnaire-ipc/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/irc-recrute-gestionnaire-ipc/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('364e0e4216fe93b1995d33bd2dc1fe52f1e8764c36d9f8b6d6fc0430216db735', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'SOS Villages d’Enfants J-10 SOS Villages d’Enfants recrute 02 postes 📍 Bénin 📋 CDD Protection, Genre & Inclusion', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/sos-villages-denfants-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/sos-villages-denfants-recrute-02-postes/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('afbb759c1421ebcb0ab357931936e685c71435816c49eb8bce468f682a75a3d5', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/sos-villages-denfants-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/sos-villages-denfants-recrute-02-postes/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('40222ba683adf161188f5299613e77f83488bae2d874282144eced7221e1c405', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'UNICEF J-8 UNICEF recrute 02 postes 📍 Niger/Nigéria 📋 CDD Nutrition Santé', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/unicef-recrute-02-postes-2/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/unicef-recrute-02-postes-2/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d75c519beaf28f533d259a74a5c2284505170ab67fcb54b95d3ccf162c064854', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/unicef-recrute-02-postes-2/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/unicef-recrute-02-postes-2/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3eea188a0958891e0ccc9369c9cbe7e0a07a2937f87964a7e0b8a87c755e65c5', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'COOPI - Cooperazione Internazionale J-12 MEAL officer RRM 📍 Niger 📋 CDI Réponse d''urgence', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/meal-officer-rrm/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/meal-officer-rrm/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('66611e9e30c8dab79aedf9842cf90c84abc1dc687f4ab4d6b4f907ce385f81ff', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/meal-officer-rrm/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/meal-officer-rrm/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('963917482a7d55acfb6d16f0cf9c55de49be9bfee81f39dff2ebdbe16b2a5c2a', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Plan International J-5 Plan International recrute 02 postes 📍 Mali 📋 CDD 💰 Jusqu''a 8 680 000 EUR/mois Administration & Finance', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/plan-international-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/plan-international-recrute-02-postes/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('22f01be569e300578a14827d91e029e3f60a6d06f36a31ca2971e77261f63a54', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/plan-international-recrute-02-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/plan-international-recrute-02-postes/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('070badf3e50cbdf426111b70cd88442574ef69f7db1d2ffc5cc6de2af378b8bd', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Médecins Sans Frontières (MSF) J-18 Coordonnateur d&rsquo;urgence Ebola Watsan H/F 📍 RD Congo 📋 CDD Management & Coordination Santé', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordonnateur-durgence-ebola-watsan-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordonnateur-durgence-ebola-watsan-h-f/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('37c3e48c624a4d351daa80d5875203f4bd428d10226e1ed394344e1bde41ba95', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordonnateur-durgence-ebola-watsan-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordonnateur-durgence-ebola-watsan-h-f/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('19b8841ce7605c93b59ffe3df037e4a1fad1866b182aeaec0be9f05b4ea4ed99', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Olam Agri J-9 Olam Agri recrute plusieurs postes 📍 Tchad 📋 CDD Administration & Finance', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/olam-agri-recrute-plusieurs-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/olam-agri-recrute-plusieurs-postes/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('81fc391ea0fe74af81b830a27902d647bc683a70419bcacd2a7a56c2af550741', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/olam-agri-recrute-plusieurs-postes/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/olam-agri-recrute-plusieurs-postes/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1fe25affb5c55adb250cc95d7a4c2c1f611e1182448a018de79511c4add74d82', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Norwegian Refugee Council (NRC) J-10 Finance Officer – Partenariat (NRC, Goma – RDC, juin 2026) 📍 RD Congo 📋 CDD Administration & Finance', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/finance-officer-partenariat-nrc-goma-rdc-juin-2026/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/finance-officer-partenariat-nrc-goma-rdc-juin-2026/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('36ce6661bdfc613f77d699710af65480e8d93f260ddfc08dcc7b55990b3c7d7a', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/finance-officer-partenariat-nrc-goma-rdc-juin-2026/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/finance-officer-partenariat-nrc-goma-rdc-juin-2026/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a2f4aedfce618b03a7b746bc0571c179efc908d19615c42e2ce6c78e0e741c2f', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Alertes emploi', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/alertes-emploi/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/alertes-emploi/', now(), 0, 0, '2026-06-12T09:31:02.795Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('264d969ad1a3b64159dac205006d1b7787baa9017a493e25b4889c3357b32ad3', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Duty Stations | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/duty_stations', 'A classer', 'needs_review', 'Duty Stations | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Duty Stations Countries 6th of October City, Egypt (4) Abala, Ethiopia (12) Abidjan, Côte d''Ivoire (6) Abilene, TX (1) Abu Dhabi, United Arab Emirates (2) Abuja, Nigeria (28) Accra, Ghana (4) Addis Ababa, Ethiopia (63) Aden, Yemen (1) Agadir, Morocco (2) Agra, India (5) Ahmedabad, India (1) Al Genaina, Sudan (1) Al Hasakah, Syria (1) Albany, NY , United States (5) Albemarle, NC (1) Alexandria, VA (8) Alofi, Niue (1) Alta Verapaz, Guatemala (1) Altadena, California (2) Amman, Jordan (25) Amsterdam, Netherlands (25) Ankara, Turkey (7) Antananarivo, Madagascar (4) Apia, Samoa (3) Arequipa, Peru (1) Arlington, United States (29) Asheville, NC (1) Asunción, Paraguay (1) Athens, Greece (22) Atlanta, United States (6) Austin, Texas (10) Baghdad, Iraq (2) Baltimore, United States (2) Bamako, Mali (11) Bangal', 'https://unjobs.org/duty_stations', '2026-06-12T09:31:46.403Z', 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d3a26523a1c4e5f61df157ea35a112e3f838026a35e3a4af5647e7ab4fd48c73', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Organizations', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/organizations', 'A classer', 'needs_review', null, 'https://unjobs.org/organizations', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7fe07bf7f453884998fbcdb12488954d6bb3a5a7771557b5655f37b33479a13b', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Vacancies with international organizations', 'UNjobs Burkina Faso', 'Burkina Faso', null, '2012-06-26', null, false, 'https://unjobs.org/closing', 'A classer', 'needs_review', 'Vacancies with international organizations - closing soon | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Vacancies with international organizations - closing soon &laquo; First < Prev 1 - 25 of 254 Next > Last &raquo; Gender Expert - based in Luxembourg European Investment Bank Updated: 2026-06-12T04:51:48Z Trade/Export Finance Officer - based in Luxembourg European Investment Bank Updated: 2026-06-12T04:51:33Z Trade/Export Finance Officer - based in Luxembourg European Investment Bank Updated: 2026-06-12T04:51:33Z Senior Social Risk Specialist - based in Luxembourg European Investment Bank Updated: 2026-06-12T04:51:17Z (Senior) Operational Assistant - based in Luxembourg European Investment Bank Updated: 2026-06-12T04:51:02Z (Senior) Operational Assistant - based in Luxembourg European Investment Bank Updated: 2026-06-12T04:51:02Z Sector Specialist - based in', 'https://unjobs.org/closing', '2026-06-12T09:32:01.023Z', 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1aef4001b5c2efd8384403cf760ff3d75acfd503e5fde54f9d69466341b9b071', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'IFDC Vacancy: Jeune Professionnel Agent Terrain (JP)', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1781172948365', 'A classer', 'needs_review', 'IFDC Vacancy: Jeune Professionnel Agent Terrain (JP) - Soil Values - Bureau des Programmes - Burkina Faso, Ouagadougou, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Jeune Professionnel Agent Terrain (JP) - Soil Values - Bureau des Programmes - Burkina Faso, Ouagadougou, Burkina Faso Organization: International Fertilizer Development Center (IFDC) Country: Burkina Faso City: Ouagadougou Office: IFDC in Ouagadougou, Burkina Faso Jeune Professionnel Agent Terrain (JP) - Soil Values - Bureau des Programmes - Burkina Faso LinkedIn Twitter Email Message Share In-Country Consultancy Ouagadougou ID: 20121585 Full-Time/Regular A propos de IFDC Le Centre international pour le developpement des engrais (IFDC) est une organisation internationale publique qui &oelig;uvre a la promotion de la sante des sols et au renforcement des systemes agricoles gr&acirc;c', 'https://unjobs.org/vacancies/1781172948365', '2026-06-12T09:32:03.196Z', 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('79d8ef589cfb71903d5a16bb480cedac01c261dbf912b8b533f55708910b888d', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'UNDP Vacancy: Midterm Review (MTR) of PONASI, Burkina Faso | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1781018896687', 'A classer', 'needs_review', 'UNDP Vacancy: Midterm Review (MTR) of PONASI, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Midterm Review (MTR) of PONASI, Burkina Faso Organization: UNDP - United Nations Development Programme Country: Burkina Faso City: Ouagadougou Office: UNDP Ouagadougou Midterm Review (MTR) of PONASI Reference: UNDP-BFA-00707 Beneficiary countries or territories: Burkina Faso Registration level: Basic Published on: 05-Jun-2026 Deadline on: 19-Jun-2026 12:00 (GMT -4.00) Reference: UNDP-BFA-00707 Beneficiary countries or territories: Burkina Faso Registration level: Basic Published on: 05-Jun-2026 Deadline on: 19-Jun-2026 12:00 (GMT -4.00) Description Description of the Assignment: INTERNATIONAL CONSULTANT Period of assignment/services : JUNE 19th 2026 Proposal should be submitted directly in the portal no later than indicated deadline. Any request for clarif', 'https://unjobs.org/vacancies/1781018896687', '2026-06-12T09:32:04.429Z', 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bfb43784386913b48984a17811d4ddc89d6b4b09d130b77c3ccaaad6bc22ea6a', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'UNDP Vacancy: Recrutement d''un (e) Consultant(e) national(e) pour réaliser une Étude, Burkina Faso | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1781019696952', 'A classer', 'needs_review', 'UNDP Vacancy: Recrutement d''un (e) Consultant(e) national(e) pour réaliser une Étude, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Recrutement d''un (e) Consultant(e) national(e) pour réaliser une Étude, Burkina Faso Organization: UNDP - United Nations Development Programme Country: Burkina Faso City: Ouagadougou Office: UNDP Ouagadougou Recrutement d''un (e) Consultant(e) national(e) pour realiser une &Eacute;tude Reference: UNDP-BFA-00702 Beneficiary countries or territories: Burkina Faso Registration level: Basic Published on: 04-Jun-2026 Deadline on: 15-Jun-2026 10:04 (GMT -4.00) Reference: UNDP-BFA-00702 Beneficiary countries or territories: Burkina Faso Registration level: Basic Published on: 04-Jun-2026 Deadline on: 15-Jun-2026 10:04 (GMT -4.00) Description Pays : BURKINA FASO Description de la mission : Recruter un (e) consultant(e) nation', 'https://unjobs.org/vacancies/1781019696952', '2026-06-12T09:32:05.675Z', 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2ff6bec2586918528e0c7d83b1757233f948578d8e16d1ffdd876b5a6cf38b88', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Vacancies in Ouagadougou, Burkina Faso | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, '2011-06-26', null, false, 'https://unjobs.org/duty_stations/oua', 'A classer', 'needs_review', 'Vacancies in Ouagadougou, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Vacancies in Ouagadougou, Burkina Faso &laquo; First < Prev 1 - 17 of 17 Next > Last &raquo; Jeune Professionnel Agent Terrain (JP) - Soil Values - Bureau des Programmes - Burkina Faso, Ouagadougou, Burkina Faso International Fertilizer Development Center (IFDC) Updated: 2026-06-11T12:25:42Z Midterm Review (MTR) of PONASI, Burkina Faso UNDP - United Nations Development Programme Updated: 2026-06-10T05:10:51Z Recrutement d''un (e) Consultant(e) national(e) pour réaliser une Étude, Burkina Faso UNDP - United Nations Development Programme Updated: 2026-06-10T04:57:28Z Active organizations in Ouagadougou UNDP - United Nations Development Programme 3 IMPACT Initiatives 2 Malaria Consortium 2 Clinton Health Access Initiative (CHAI) 2 Norwegian Refugee Council (NRC) 1 International F', 'https://unjobs.org/duty_stations/oua', '2026-06-12T09:32:07.504Z', 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('495a569248742f13609ac0fe90d9c29565840c56b8540dc631f30c292a0e9e7a', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'UNDP - United Nations Development Programme Ouagadougou 3', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/undp_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/undp_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2e218e5f01a0bfecf47e253acc3b73dd9f9e3441e758cec8d7804ead137a4353', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Vacancies with Malaria Consortium Ouagadougou, Burkina Faso | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, '2009-06-26', null, false, 'https://unjobs.org/offices/malaria-consortium_oua', 'A classer', 'needs_review', 'Vacancies with Malaria Consortium Ouagadougou, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Vacancies with Malaria Consortium Ouagadougou, Burkina Faso &laquo; First < Prev 1 - 2 of 2 Next > Last &raquo; VacancyTitle: Finance Assistant, Location: Ouagadougou The Vacancy Malaria Consortium is recruiting for a Finance Assistant to join our team in Ougadougou Malaria Consortium Updated: 2026-06-09T08:01:57Z VacancyTitle: Finance Assistant SMC, Location: Ouagadougou The Vacancy Malaria Consortium is recruiting for a temporary Finance Assistant to join our team in Malaria Consortium Updated: 2026-06-09T08:01:29Z &laquo; First < Prev 1 - 2 of 2 Next > Last &raquo; UNjobs Association of Geneva Not an official document of the United Nations Privacy Policy | Cookie Policy', 'https://unjobs.org/offices/malaria-consortium_oua', '2026-06-12T09:32:09.958Z', 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('40cbccc3acf3ac771c9c65c9fc0997d387c05647fca8a863a5bf2162c8ab4576', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'IMPACT Initiatives Ouagadougou 2', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/impact-initiatives_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/impact-initiatives_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0c81f20b35ead98352fe712edb0a547880419cbad99fff6a0b718c266dc64dd6', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'IUCN Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/iucn_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/iucn_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('65a58e116268ef243d38e261bcb833c42c60ff2bc1c8f6f273a93592c7e1680a', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'CHAI Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/chai_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/chai_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a496436aebd5ccb74ca04edbb08f194909d06d910edb0fe782b053c3b3e07e23', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Norwegian Refugee Council (NRC) Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/norwegian-refugee-council_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/norwegian-refugee-council_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('461ab5a2ef7824b68867fb8e8dd6e3c1dc90694df198ec61c72f8f1697ecde0c', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Clinton Health Access Initiative (CHAI) Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/chai_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/chai_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b1a6f7f1b83e5a006af9aacdabe2089a33b40eea26fb213364562310d4f253ae', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'SoCha Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/socha_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/socha_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('68a1c2a21a689571f61e47e3c24b822a505efa7e9807e3bb1f4d1082f46af876', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'WeWorld Onlus Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/weworld_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/weworld_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6a8738df6ed95243856c6bf46a8b15402bec1aacf648b523280ee377313a6726', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Médecins du Monde (MdM) Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/medecins-du-monde_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/medecins-du-monde_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('acefe0e57382efe8e02d1b817e558e16febfb33af92ce2079e62eef00413e8cc', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Pathfinder International Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/pathfinder-international_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/pathfinder-international_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('12892a9e41b05d349950d695bc90f4b2731cb1fa12e1c84fde8a5f5bc1a251a5', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Doctors with Africa CUAMM Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/cuamm_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/cuamm_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4fa68c0bf9dce6a0cc85aa32b5b65c15fbbef0cb00a630c569c0417e92734503', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'FHI 360 Kaya 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/fhi-360_746308883472211969', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/fhi-360_746308883472211969', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6c2a0f6d5497094701bc74824759c12f76d099a46329315b2513a7ad60eb7784', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'International Fertilizer Development Center (IFDC) Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/ifdc_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/ifdc_oua', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1a34dc2c14c28967f8ea1892254af798e89e35fc69f9b2c91efcd6fbb94ef8a7', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Recrutement de consultant national pour la revue à mis parcours du projet PONAS, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1781020998548', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1781020998548', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ec15565942550a8cdaf9758b1576318732f8fae26495d661067005463059ef65', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'VacancyTitle: Finance Assistant, Location: Ouagadougou', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1780962167818', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1780962167818', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f09ac0407c51d7e1f2d9020aa46835004dfbc5936ad841a7ab88d0d958b3168e', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'VacancyTitle: Finance Assistant SMC, Location: Ouagadougou', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1780962160024', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1780962160024', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('36ee53070bf0623a7cd39c4c3fe83f28251be1941765a1e3661b88b8860a0e8e', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Community Feedback Mechanism Technical Assistant Burkina Faso Ouagadougou, Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1780601628292', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1780601628292', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0d801558e7000b3c2939dd708d111db8d58b29b7d63dd725175f561eb9c56208', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Clinicien - Kaya Regional Office, Kaya, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1780603355285', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1780603355285', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9907d26a72bbd00b10cf407fa3fb3d467f477017cb33cb9a98c2340610c0f404', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Project Intern - LOGMe II, Burkina Faso Programme Office', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1780435969291', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1780435969291', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1d3824726dc2ca9a0ad0e95f875e9423cc5ca206b06e712f3e52776fafeb4fb8', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Communications and Marketing Specialist, Pathfinder Portuguese & English Countries', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1779895707052', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1779895707052', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('19ec09125a1ceb3f0c1929c45ac46474633ec0184a0f5fac16de716fbe8a40c6', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Enquêteurs / Chercheurs de terrain - Burkina Faso, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1779894488201', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1779894488201', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('59a5a35810f09e569c01a419638e946d0e81061b52fb14125889b4a13d55327b', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Admin/Finance Officer | Burkina Faso , Regione del Centro Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1779654022705', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1779654022705', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('06279499ce2abd4c21048281a9e03f1dad54944a8623f2e7d8ed48d680838a03', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Coordinateur administratif et logistique (F/H), Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1778710942800', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1778710942800', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ca230989b78c4ee84de7f02518f4063b8f607de49f008245280fd1d9d40f04f', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Head of Support Services Sahel, Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1778155544074', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1778155544074', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('744244c607b65b07bb62f2b81b26918aa12e646d1a4f27a2b6c27191c3d47ccf', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Épidémiologiste, Analyste de Recherche, Malaria | Epidemiologist, Research Analyst, Paludisme, Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1777682361421', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1777682361421', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4ee8e4f32dd143248b10d18f42b3bb3774f57a87b196dc4da0401a2da03c2c5a', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Associate, Malaria Case Management & Supply Chain Management, Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1776387758986', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1776387758986', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7ecf0afc4ca2d11885a7513d6e0292db868c8312d57ea40fcaa377930be2ec07', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Responsable de Recherche pour le Burkina Faso, Ouagadougou', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1775498982100', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1775498982100', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eafbdcd48ba853deb539586a1e768866796c85d1a2d01d5439695f39fc8390d3', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Responsable de Recherche pour le Burkina Faso, Ouagadougou', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1775498973018', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1775498973018', now(), 0, 0, '2026-06-12T09:31:44.331Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d56d3d10a1a34006f2537c384448cfa649fba37620a74bd4c32fad200816352', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Offres d''emploi', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/?page=offres', 'A classer', 'needs_review', 'Offres d''emploi - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière - Site d''annonces d''emploi Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous 854 offres d’emploi 01 Agent(e) de Bureau PUBLI&Eacute;E il y a 5 mois | DATE LIMITE LE 31 décembre 2025 | emploi | Ouagadougou Secteur d’activité : Mutualité sociale Secteurs d’activités additionnels : Santé et prestations sociales Spécialité concernée : Agent de soutien. Niveau du poste : cadre moyen. Nombre de poste : 01. Recruteur : Mutuelle des (…) 05 postes à pourvoir au sein d’une mutuelle nationale PUBLI&Eacute;E Décembre 2025 | DATE LIMITE LE 12 décembre 2025 | emploi | Ouagadougou POSTE A POURVOIR Un(e) Chef de Département des Prestations sociales et Assurance MISSIONS ET ACTIVITÉS DU POSTE Sous la responsabilité hiérarchique du Directeur Exécutif, le Chef ', 'https://emploi.lefaso.net/?page=offres', '2026-06-12T09:33:13.642Z', 0, 0, '2026-06-12T09:33:13.045Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a1a020964ac32078c695b4f00150d524d2e1d8e4fe96c573c6f285b4114fbaa2', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Conseil du recruteur', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/-Conseil-du-recruteur-.html', 'A classer', 'needs_review', 'Conseil du recruteur - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Accueil > Conseil du recruteur Conseil du recruteur Avis de recrutement d’un(e) Coordonnateur(trice) de Projet 30 août 2021, par Pascal Yé TERMES DE REFERENCE I. CONTEXTE ET JUSTIFICATION L’Association Sos Santé et Développement Paalga (ASD Paalga) est une organisation non gouvernementale (ONG) créée en 1991, qui travaille dans les domaines de : la formation, l’appui conseil, La sécurité alimentaire l’insertion socioprofessionnelle des couches vulnérables, la santé communautaire et l’adaptation aux changements climatiques, la Participation citoyenne et la gouvernance locale, l’Alphabétisation et l’éducation non formelle (…) 6 conseils pour réussir vos entretiens de recrutement 16 novembre', 'https://emploi.lefaso.net/-Conseil-du-recruteur-.html', '2026-06-12T09:33:14.325Z', 0, 0, '2026-06-12T09:33:13.045Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e6e8d93f4f41489002ed66ac6b9779272e812405417ab3882137c8205e4cd3e4', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Les entreprises qui recrutent en ce moment', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Les-entreprises-qui-recrutent-en-ce-moment.html', 'A classer', 'needs_review', 'Les entreprises qui recrutent en ce moment - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Accueil > Générale > Les entreprises qui recrutent en ce moment Les entreprises qui recrutent en ce moment vendredi 14 octobre 2016 UNFPA http://www.unfpa.org/jobs AFDB http://www.afdb.org/fr/ US Embassy https://ouagadougou.usembassy.gov/ GIZ https://www.giz.de/ CEDEAO http://www.ecowas.int/vacances-actuelles/?lang=fr Conseil du recruteur Avis de recrutement d’un(e) Coordonnateur(trice) de Projet TERMES DE REFERENCE I. CONTEXTE ET JUSTIFICATION L’Association Sos Santé et Développement Paalga (ASD Paalga) est une organisation non gouvernementale (ONG) créée en 1991, qui travaille dans (…) LEFASO.NET ● 6 conseils pour réussir vos entretiens de recrutement ● La recherch', 'https://emploi.lefaso.net/Les-entreprises-qui-recrutent-en-ce-moment.html', '2026-06-12T09:33:14.938Z', 0, 0, '2026-06-12T09:33:13.045Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7fce63993977d72365f6127902f50f13e0ac306049d986be8cb5400bba8d1b1b', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Nos partenaires', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Nos-partenaires.html', 'A classer', 'needs_review', 'Nos partenaires - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Accueil > Générale > Nos partenaires Nos partenaires samedi 1er octobre 2016 International Development Law Organisation (IDLO) Conseil du recruteur Avis de recrutement d’un(e) Coordonnateur(trice) de Projet TERMES DE REFERENCE I. CONTEXTE ET JUSTIFICATION L’Association Sos Santé et Développement Paalga (ASD Paalga) est une organisation non gouvernementale (ONG) créée en 1991, qui travaille dans (…) LEFASO.NET ● 6 conseils pour réussir vos entretiens de recrutement ● La recherche d’emploi ? ● Comment négocier une augmentation ? ● 5 règles pour bien gérer son temps Vidéo Conseil Comment réussir son entretien d’embauche ? Les entreprises qui recrutent http://www.ecowas.int/vacances-actuelles/?lan', 'https://emploi.lefaso.net/Nos-partenaires.html', '2026-06-12T09:33:15.555Z', 0, 0, '2026-06-12T09:33:13.045Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cede9ed4839cea1607c1b238172cfcc17f97078fcdc8ef44ba4a4512cacfb191', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Agent(e) de Bureau', 'Mutualité sociale Date de clôture de l', 'de Ouagadougou', '2025-12-31', '2026-06-11', '2025-12-31', false, 'https://emploi.lefaso.net/01-Agent-e-de-Bureau.html', 'A classer', 'needs_review', '01 Agent(e) de Bureau - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Agent(e) de Bureau 01 Agent(e) de Bureau offre deposee 11 juin 2026 par Mutualité sociale Date de clôture de l’offre : 31 décembre 2025 Secteur d’activité : Mutualité sociale Secteurs d’activités additionnels : Santé et prestations sociales Spécialité concernée : Agent de soutien. Niveau du poste : cadre moyen. Nombre de poste : 01. Recruteur : Mutuelle des Agents des Finances (MUAFI). Structure bénéficiaire : Mutuelle des Agents des Finances (MUAFI). Type de contrat : Contrat à durée déterminée (CDD). Lieu d’affectation : Ouagadougou. Dans le cadre du renforcement de ses capacités administrativ', 'https://emploi.lefaso.net/01-Agent-e-de-Bureau.html', '2026-06-12T09:33:16.173Z', 0, 0, '2026-06-12T09:33:13.045Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4e5f2183c8b69fcd72ffea16d6a5350dbf85cedf814e0b8347c95fe54aaab6e8', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chef de mission', 'GREY Date de clôture de l', 'Burkina Faso', '2025-11-03', '2026-06-11', '2025-11-03', false, 'https://emploi.lefaso.net/01-Chef-de-mission-et-controleurs-de-chantiers.html', 'A classer', 'needs_review', '01 Chef de mission - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chef de mission 01 Chef de mission offre deposee 11 juin 2026 par GREY Date de clôture de l’offre : 3 novembre 2025 Avis de recrutement pour les postes de chef de mission 1- INTITULE DU POSTE Chef de mission : un (01) 3- LIEU DU POSTE : Ouagadougou 4- MISSIONS PRINCIPALES : Chef de mission • Coordonner et superviser l’ensemble des activités de contrôle technique sur les chantiers. • Assurer la planification, la répartition et le suivi des missions des contrôleurs de travaux. • Garantir la conformité des travaux réalisés avec les normes, plans et cahiers de charges. • Élaborer les plans et devis est', 'https://emploi.lefaso.net/01-Chef-de-mission-et-controleurs-de-chantiers.html', '2026-06-12T09:33:16.887Z', 0, 0, '2026-06-12T09:33:13.045Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('488d0b7d2efa5785b742c5437207b83f05fda5a7f96e02066eea1332d7d74df6', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Dermatologue', 'HOSCO Date de clôture de l', 'Burkina Faso', '2025-10-27', '2026-06-12', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Dermatologue.html', 'A classer', 'needs_review', '01 Médecin Dermatologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Dermatologue 01 Médecin Dermatologue offre deposee 12 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Dermatologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat de', 'https://emploi.lefaso.net/01-Medecin-Dermatologue.html', '2026-06-12T09:33:17.499Z', 0, 0, '2026-06-12T09:33:13.046Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2abcc1f5b90604f10fecf7d7eb481a07bea79fd482e7729452d36a948e094ade', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Chirurgien maxillo-facial', 'HOSCO Date de clôture de l', 'Burkina Faso', '2025-10-27', '2026-06-12', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Chirurgien-maxillo-facial.html', 'A classer', 'needs_review', '01 Médecin Chirurgien maxillo-facial - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Chirurgien maxillo-facial 01 Médecin Chirurgien maxillo-facial offre deposee 12 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Chirurgien maxillo-facial : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/', 'https://emploi.lefaso.net/01-Medecin-Chirurgien-maxillo-facial.html', '2026-06-12T09:33:18.089Z', 0, 0, '2026-06-12T09:33:13.046Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d81c08f166e46e37b7c060f846c8fb81d1c8bb67c76b06fb370f50b6fe31d0b6', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Pneumologue', 'HOSCO Date de clôture de l', 'Burkina Faso', '2025-10-27', '2026-06-12', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Pneumologue.html', 'A classer', 'needs_review', '01 Médecin Pneumologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Pneumologue 01 Médecin Pneumologue offre deposee 12 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Pneumologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat de la ', 'https://emploi.lefaso.net/01-Medecin-Pneumologue.html', '2026-06-12T09:33:18.729Z', 0, 0, '2026-06-12T09:33:13.046Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d5e3434f0fea9c7d4e3fb0924bcaf7bc12508e707279355ef837a4d04f5deaa7', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Hématologue', 'HOSCO Date de clôture de l', 'Burkina Faso', '2025-10-27', '2026-06-12', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Hematologue.html', 'A classer', 'needs_review', '01 Médecin Hématologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Hématologue 01 Médecin Hématologue offre deposee 12 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Hématologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat de la ', 'https://emploi.lefaso.net/01-Medecin-Hematologue.html', '2026-06-12T09:33:19.344Z', 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4033dcedd93b49709cf8acafd716ae1942c4113a45fc7958af9dd5e22eeaf05b', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin ORL', 'Hôpital Saint Camille de Ouagadougou (HOSCO) Date de clôture de l', 'Burkina Faso', '2025-10-27', '2026-06-12', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-ORL.html', 'A classer', 'needs_review', '01 Médecin ORL - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin ORL 01 Médecin ORL offre deposee 12 juin 2026 par Hôpital Saint Camille de Ouagadougou (HOSCO) Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin ORL : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat', 'https://emploi.lefaso.net/01-Medecin-ORL.html', '2026-06-12T09:33:19.952Z', 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('85fd9c6a77e7aad5ae92d8d90d8b8206767a11f24b50a956a5630c209bd560e9', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Neurologue', 'Hôpital Saint Camille de Ouagadougou (HOSCO) Date de clôture de l', 'Burkina Faso', '2025-10-27', '2026-06-12', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Neurologue.html', 'A classer', 'needs_review', '01 Médecin Neurologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Neurologue 01 Médecin Neurologue offre deposee 12 juin 2026 par Hôpital Saint Camille de Ouagadougou (HOSCO) Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Neurologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers so', 'https://emploi.lefaso.net/01-Medecin-Neurologue.html', '2026-06-12T09:33:20.566Z', 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f9a3962e1ac5da02ed8d71c8340e6bc1eb834e88eb9e9427c92491a06e01c272', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chef du service communication', 'HAGE Matériaux Date de clôture de l', 'Burkina Faso', '2017-09-15', '2026-06-12', '2017-09-15', false, 'https://emploi.lefaso.net/01-Chef-du-service-communication.html', 'A classer', 'needs_review', '01 Chef du service communication - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chef du service communication 01 Chef du service communication offre deposee 12 juin 2026 par HAGE Matériaux Date de clôture de l’offre : 15 septembre 2017 Capacités liées à l’emploi avoir une maîtrise parfaite de l’expression écrite et orale/être immédiatement disponible/être doté d’un bon esprit d’analyse et de synthèse et d’une bonne capacité de gestion du stress/être créatif,curieux et avoir une ouverture d’esprit et le sens de l’écoute/être réactif et doté d’une bonne capacité d’organisation du travail/avoir un très bon niveau de culture générale et une excellente aptitude à la c', 'https://emploi.lefaso.net/01-Chef-du-service-communication.html', '2026-06-12T09:33:21.185Z', 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f17ab841951b63ea811f939c079fd8cce5430cad6359e52685743d474e9eaa40', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chef de publicité', 'Une importante agence de Communication Date de clôture de l', 'Burkina Faso', '2017-09-14', '2026-06-12', '2017-09-14', false, 'https://emploi.lefaso.net/01-Chef-de-publicite.html', 'A classer', 'needs_review', '01 Chef de publicité - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chef de publicité 01 Chef de publicité offre deposee 12 juin 2026 par Une importante agence de Communication Date de clôture de l’offre : 14 septembre 2017 Capacités liées à l’emploi travail sous pression/très bonne capacité à organiser et gérer les priorités/et avoir un fort esprit d’initiative/être immédiatement disponible/autres Connaissance en informatique NP Condition d’âge NP Composition du dossier un CV détaillé/une lettre de motivation/une copie de la pièce d’identité/une copie des diplômes et des attestations diverses Procedure de recrutement Présélection sur dossier/entretien oral avec ', 'https://emploi.lefaso.net/01-Chef-de-publicite.html', '2026-06-12T09:33:21.778Z', 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('593ef96a6c8dba4633b399c130a2c9ec02e0231ecdefe3abdf0dad9e51a573f1', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Pharmacien', 'Une Entreprise de distribution de matériel et équipements Date de clôture de l', 'Burkina Faso', '2017-08-29', '2026-06-12', '2017-08-29', false, 'https://emploi.lefaso.net/01-Pharmacien.html', 'A classer', 'needs_review', '01 Pharmacien - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Pharmacien 01 Pharmacien offre deposee 12 juin 2026 par Une Entreprise de distribution de matériel et équipements Date de clôture de l’offre : 29 août 2017 Capacités liées à l’emploi être inscrit sur le Tableau de l’Ordre des Pharmaciens du Burkina et en règle vis-à-vis de l’Ordre/aptitude à travailler sous pression/autres Connaissance en informatique NP Condition d’âge NP Diplôme ou niveau Doctorat Composition du dossier CV sincère et acutalisé daté et signé/lettre de motivation/photocopie légalisée du diplôme et des attestations de travail/Merci d’envoyer votre candidature à : dos_consultants@yahoo.fr', 'https://emploi.lefaso.net/01-Pharmacien.html', '2026-06-12T09:33:22.367Z', 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ab48e2c72919fe404f373472504b422ed4f614ab042cd2b77cd353efd969377c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chargé de recouvrement', 'Une institution de la place Date de clôture de l', 'Burkina Faso', '2017-08-26', '2026-06-11', '2017-08-26', false, 'https://emploi.lefaso.net/01-Charge-de-recouvrement.html', 'A classer', 'needs_review', '01 Chargé de recouvrement - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chargé de recouvrement 01 Chargé de recouvrement offre deposee 11 juin 2026 par Une institution de la place Date de clôture de l’offre : 26 août 2017 Capacités liées à l’emploi diplôme reconnu par l’Etat Burkinabè ou un diplôme équivalent/avoir une capacité d’organisation,de rigueur,de flexibilité,d’anticipation de réactivité et une forte autonomie/avoir une capacité de communication aisée,de travail en équipe,d’analyse et de synthèse/être disponible et dynamique/être de bonne moralité/être de nationalité burkinabè/autres Connaissance en informatique Maîtriser le logiciel spécifique de recou', 'https://emploi.lefaso.net/01-Charge-de-recouvrement.html', '2026-06-12T09:33:23.026Z', 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1eccd425b51fa7a9a8080f5b6034b7f8aa956935cee07811964c8e9d05cbe805', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '02 Médecin Oncologues médical et chirurgical', 'HOSCO Date de clôture de l', 'Burkina Faso', '2025-10-27', '2026-06-11', '2025-10-27', false, 'https://emploi.lefaso.net/02-Medecin-Oncologues-medical-et-chirurgical.html', 'A classer', 'needs_review', '02 Médecin Oncologues médical et chirurgical - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 02 Médecin Oncologues médical et chirurgical 02 Médecin Oncologues médical et chirurgical offre deposee 11 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Oncologues médical et chirurgical : 02 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être', 'https://emploi.lefaso.net/02-Medecin-Oncologues-medical-et-chirurgical.html', '2026-06-12T09:33:23.642Z', 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('938d2113df7330a264c07438281f1fc339061e96c2c2c98171fa631bb14fe90c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '02 Chefs de mission ou chefs de projet', 'Cabinet YONS Associates Date de clôture de l', 'Burkina Faso', '2018-04-30', '2026-06-11', '2018-04-30', false, 'https://emploi.lefaso.net/02-Chefs-de-mission-ou-chefs-de-projet.html', 'A classer', 'needs_review', '02 Chefs de mission ou chefs de projet - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 02 Chefs de mission ou chefs de projet 02 Chefs de mission ou chefs de projet offre deposee 11 juin 2026 par Cabinet YONS Associates Date de clôture de l’offre : 30 avril 2018 Le cabinet Yons Associates recrute pour le compte d’une importante société basée à Kossodo les profils suivants : 02 Chefs de mission ou chefs de projet Qualifications, compétences et aptitudes – Etre titulaire d’un diplôme d’Ingénieur Génie Hydraulique, Génie Civil ou Génie Rural, – Justifier d’une expérience professionnelle de cinq (05) ans dans le domaine du BTP, Mission : assurer le pilotage, organisation', 'https://emploi.lefaso.net/02-Chefs-de-mission-ou-chefs-de-projet.html', '2026-06-12T09:33:24.237Z', 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9074a05022ddb182e61ec7ca93e0d49afc4c1b572313181f86b435407a28cb12', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '02 Ingénieurs chargés d&#8217;affaires/Mines', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/02-Ingenieurs-charges-d-affaires-Mines.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/02-Ingenieurs-charges-d-affaires-Mines.html', now(), 0, 0, '2026-06-12T09:33:13.048Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f69dcfb6d18b779ffe1212c219f723a12067babeecf3d16cddb05e8ba3d64f3a', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', now(), 0, 0, '2026-06-12T09:33:13.049Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('262cf87917b5317227eec7102f0130576671c8e696a6de23335848434a668b6a', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '6 conseils pour réussir vos entretiens de recrutement', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/6-conseils-pour-reussir-vos-entretiens-de-recrutement.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/6-conseils-pour-reussir-vos-entretiens-de-recrutement.html', now(), 0, 0, '2026-06-12T09:33:13.049Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('56c0c9800a8b0224254c6b1170a8a5a43cd3df682affe3837a0bd065373a967c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'La recherche d’emploi ?', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Comment-rechercher-efficacement-un-stage-ou-un-emploi.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Comment-rechercher-efficacement-un-stage-ou-un-emploi.html', now(), 0, 0, '2026-06-12T09:33:13.049Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bac8b8a935d09327783b4e086125d12822c194e312ba0f2570baa623b514f998', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Comment négocier une augmentation ?', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Comment-negocier-une-augmentation.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Comment-negocier-une-augmentation.html', now(), 0, 0, '2026-06-12T09:33:13.049Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('53bcf2a79795e6ff7fd9e9257327f8647632cfb65aaf71e14d360ab80487b913', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '5 règles pour bien gérer son temps', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/5-regles-pour-bien-gerer-son-temps.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/5-regles-pour-bien-gerer-son-temps.html', now(), 0, 0, '2026-06-12T09:33:13.049Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6b6e08e25e0295e52becdec508a65984c12fa2c18dc4535d3d20ade0a81a010f', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Comment réussir son entretien d&#8217;embauche ?', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Comment-reussir-son-entretien-d-embauche.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Comment-reussir-son-entretien-d-embauche.html', now(), 0, 0, '2026-06-12T09:33:13.049Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4ef7fdff8e9eed1ae3c179c07879dd4261c99737d25c25714f7d6d7d7f83f7e6', 'burkina24-emploi', 'Burkina24 Emploi', 'https://burkina24.com/', 'Burkina Faso : Le gouvernement suspend tous les concours de beauté sur l’ensemble du territoire', 'Burkina24 Emploi', 'Burkina Faso', null, '2038-33-25', null, false, 'https://burkina24.com/2026/06/08/burkina-faso-le-gouvernement-suspend-tous-les-concours-de-beaute-sur-lensemble-du-territoire/', 'A classer', 'needs_review', '--> >--> >--> window._taboola = window._taboola || []; _taboola.push({article:''auto''}); !function (e, f, u, i) { if (!document.getElementById(i)){ e.async = 1; e.src = u; e.id = i; f.parentNode.insertBefore(e, f); } }(document.createElement(''script''), document.getElementsByTagName(''script'')[0], ''//cdn.taboola.com/libtrc/burkina24/loader.js'', ''tb_loader_script''); if(window.performance && typeof window.performance.mark == ''function'') {window.performance.mark(''tbl_ic'');} Burkina Faso : Le gouvernement suspend tous les concours de beauté sur l’ensemble du territoire vendredi , 12 juin 2026 FLASH INFOS Programme MOST de l’UNESCO : Le Pr Mamadou Lamine Sanogo passe le témoin à Dr Amado Kaboré Kaya : Un employé de commerce remporte plus de 31 millions F CFA à la LONAB Génie électrique : Professionnels, étudiants et chercheurs réunis pour relever les défis énergétiques du Burkina Faso Circulatio', 'https://burkina24.com/2026/06/08/burkina-faso-le-gouvernement-suspend-tous-les-concours-de-beaute-sur-lensemble-du-territoire/', '2026-06-12T09:33:27.066Z', 0, 0, '2026-06-12T09:33:26.318Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
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
values ('b5c0563e-a39c-4a12-889c-12bef75c1db5'::uuid, 'e05b148dd6adcaf86461ccc0c28b34a570a5838beaa18635d365ab219b1f8df6', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a', 'BFemploi', 'Burkina Faso', 'Bureau', 'Consultation', 'Non communique', '2026-06-12', null, 'A verifier', 'https://www.bfemploi.com/annonce-details-3876.html', 'https://www.bfemploi.com/annonce-details-3876.html', 'Appel à propositions pour la mise en œuvre d’une enquête de couverture post-campagne de supplémentation en vitamine a - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche C', array['Bureau', 'Burkina Faso', 'BFemploi', 'concours']::text[], 70, 0, 'review', '2026-06-12T09:28:40.355Z', now())
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
values ('91aefe66-1c79-4f15-80e4-8721364b84b4'::uuid, '4a1ec186344a99a0fe4622a72b0da387d2849a7d6663710e71ce89b523e804c2', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'BTP et chantier', 'Mission', 'Non communique', '2026-06-12', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', null, array['BTP et chantier', 'Ouagadougou', 'Emploiburkina', 'climatisation', 'commercial']::text[], 45, 0, 'review', '2026-06-12T09:29:01.485Z', now())
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
values ('e01eea1c-916e-43a7-8a5d-95bfc3503569'::uuid, '6460fa0f21bb12dbf277c31cf962c53b6ae4b5a0515dd3ed3c23b9b940b16560', 'Assistant Financier – Malaria Consortium', 'HumanitaireHub', 'Ouagadougou', 'Finance et administration', 'CDD', 'Non communique', '2026-06-12', '2026-06-22', '22 juin 2026', 'https://humanitairehub.com/emploi/assistant-financier-malaria-consortium/', 'https://humanitairehub.com/emploi/assistant-financier-malaria-consortium/', 'Assistant Financier – Malaria Consortium - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant Financier – Malaria Consortium ← Retour aux offres Malaria Consortium Assistant Financier – Malaria Consortium 📍 Ouagadougou, Burkina Faso · 📄 CDD ⏰ Deadline 21 Juin 2026 J-9 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Administration & Finance Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 💼 Offre d’emploi : Assistant Financier – Malaria Consortium Burkina Faso 📍 Lieu : Ouagadougou, Burkina Faso 📅 Date de publication : juin 2026 ⏳ Date limite de candidature : 22 juin 2026 🕒 Type de contrat : CDD – 12 mois (possibilité de renouvellement) 💰 Sala', array['Finance et administration', 'Ouagadougou', 'HumanitaireHub', 'humanitaire', 'finance', 'assistant']::text[], 70, 0, 'review', '2026-06-12T09:31:02.792Z', now())
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
values ('8bcc3b88-b82e-4794-8c6a-9dd3705e2109'::uuid, 'f69dcfb6d18b779ffe1212c219f723a12067babeecf3d16cddb05e8ba3d64f3a', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet', 'LeFaso.net Recrutement', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', '2026-06-12', null, 'A verifier', 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', null, array['ONG', 'Burkina Faso', 'LeFaso.net Recrutement', 'projet']::text[], 45, 0, 'review', '2026-06-12T09:33:13.049Z', now())
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
values ('af96dc19-71d4-44dc-82eb-7af59c406d28'::uuid, '1aef4001b5c2efd8384403cf760ff3d75acfd503e5fde54f9d69466341b9b071', 'IFDC Vacancy: Jeune Professionnel Agent Terrain (JP)', 'UNjobs Burkina Faso', 'Ouagadougou', 'Metiers terrain et informels', 'Mission', 'Non communique', '2026-06-12', null, 'A verifier', 'https://unjobs.org/vacancies/1781172948365', 'https://unjobs.org/vacancies/1781172948365', 'IFDC Vacancy: Jeune Professionnel Agent Terrain (JP) - Soil Values - Bureau des Programmes - Burkina Faso, Ouagadougou, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Jeune Professionnel Agent Terrain (JP) - Soil Values - Bureau des Programmes - Burkina Faso, Ouagadougou, Burkina Faso Organization: International Fertilizer Development Center (IFDC) Country: Burkina Faso City: Ouagadougou Office: IFDC in Ouagadougou, Burkina Faso Jeune Professionnel Agent Terrain (JP) - Soil Values - Bureau des Programmes - Burkina Faso LinkedIn Twitter Email Message Share In-Country Consultancy Ouagadougou ID: 20121585 Full-Time/Regular A propos de IFDC Le Centre international pour le developpement des engrais (IFDC) est une organisation internationale publique qui &oelig;uvre a la promotion de la sante des sols et au renforcement des systemes agricoles gr&acirc;c', array['Metiers terrain et informels', 'Ouagadougou', 'UNjobs Burkina Faso', 'programme', 'terrain', 'sante']::text[], 70, 0, 'review', '2026-06-12T09:31:44.331Z', now())
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
values ('263d5313-6512-4118-87bc-e76ad1124754'::uuid, 'b511815ecc63b96528e92d1dc57c70a84d96bba339499d4479ed34c313701920', 'Cash Academy Program Coordinator', 'BFemploi', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', '2026-06-11', null, 'A verifier', 'https://www.bfemploi.com/annonce-details-3875.html', 'https://www.bfemploi.com/annonce-details-3875.html', 'Cash Academy Program Coordinator - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Ex', array['Bureau', 'Burkina Faso', 'BFemploi', 'concours']::text[], 70, 0, 'review', '2026-06-12T09:28:40.357Z', now())
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
values ('73a70515-0acd-40d3-83b1-df05e5eb6ddf'::uuid, '5f975014e999374308feb174735df90a8a4c3c0bde3f1d0a8a729f7993fe6816', 'Sales Manager- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Bureau', 'A verifier', 'Non communique', '2026-06-12', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/sales-manager-ouagadougou-302227', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/sales-manager-ouagadougou-302227', null, array['Bureau', 'Ouagadougou', 'Emploiburkina']::text[], 45, 0, 'review', '2026-06-12T09:29:01.485Z', now())
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
values ('654a64f4-9281-4074-8de6-a7aa7aae4cbd'::uuid, '0c6185d245afd0d36c77400642187a8725a4dbdfc9bd9dbf5ed09afab010f07e', 'Assistant Financier SMC – Malaria Consortium', 'HumanitaireHub', 'Ouagadougou', 'Finance et administration', 'CDD', 'Non communique', '2026-06-12', '2026-06-21', '21 juin 2026', 'https://humanitairehub.com/emploi/assistant-financier-smc-malaria-consortium/', 'https://humanitairehub.com/emploi/assistant-financier-smc-malaria-consortium/', 'Assistant Financier SMC – Malaria Consortium - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant Financier SMC – Malaria Consortium ← Retour aux offres Malaria Consortium Assistant Financier SMC – Malaria Consortium 📍 Ouagadougou, Burkina Faso · 📄 CDD ⏰ Deadline 21 Juin 2026 J-9 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Administration & Finance Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 💼 Offre d’emploi : Assistant Financier SMC – Malaria Consortium Burkina Faso 📍 Lieu : Ouagadougou, Burkina Faso 💰 Salaire annuel : 3 985 847 CFA 🕒 Type de contrat : CDD – 6 mois (temps plein, temporaire) 🎓 Niveau requis : Bac +2 en finance, compt', array['Finance et administration', 'Ouagadougou', 'HumanitaireHub', 'humanitaire', 'finance', 'assistant']::text[], 70, 0, 'review', '2026-06-12T09:31:02.792Z', now())
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
values ('6dd49ca0-b7bb-4788-8cb5-281604876f3d'::uuid, '1d3824726dc2ca9a0ad0e95f875e9423cc5ca206b06e712f3e52776fafeb4fb8', 'Communications and Marketing Specialist, Pathfinder Portuguese & English Countries', 'UNjobs Burkina Faso', 'Burkina Faso', 'Commerce et vente', 'CDD', 'Non communique', '2026-06-12', null, 'A verifier', 'https://unjobs.org/vacancies/1779895707052', 'https://unjobs.org/vacancies/1779895707052', null, array['Commerce et vente', 'Burkina Faso', 'UNjobs Burkina Faso', 'marketing']::text[], 45, 0, 'review', '2026-06-12T09:31:44.331Z', now())
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
values ('5c0a7e1e-d18e-4cba-89a6-48fe91abcf55'::uuid, '085b3a6f88412be227a0ad7cab435ebb74a788f01ccf518af6e1668bf4bc59f7', 'Responsable Relations Bailleurs H/F Tout Pays', 'BFemploi', 'Burkina Faso', 'ONG', 'CDD', 'Non communique', '2026-06-09', null, 'A verifier', 'https://www.bfemploi.com/annonce-details-3874.html', 'https://www.bfemploi.com/annonce-details-3874.html', 'Responsable Relations Bailleurs H/F Tout Pays - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Info', array['ONG', 'Burkina Faso', 'BFemploi', 'bailleur', 'concours']::text[], 70, 0, 'review', '2026-06-12T09:28:40.357Z', now())
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
values ('49eca44c-f02c-478a-8794-5dc7addca836'::uuid, '17344c89107eb36cad953c9766d296e6dc93695e7b7078311536c718f8ba52de', 'Secrétaire Comptable- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Finance et administration', 'CDD', 'Non communique', '2026-06-12', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-302588', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-comptable-ouagadougou-302588', null, array['Finance et administration', 'Ouagadougou', 'Emploiburkina', 'comptable', 'secretaire']::text[], 45, 0, 'review', '2026-06-12T09:29:01.485Z', now())
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
values ('9476d1cc-ad0f-43db-8d1e-b1053b45cf56'::uuid, 'dd10c6132fdffff7f47de0af4e4f1e2e289b31fa9e98b4753c3d5fa94c7ff271', 'Programme Officer - School Meals', 'BFemploi', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', '2026-06-08', null, 'A verifier', 'https://www.bfemploi.com/annonce-details-3873.html', 'https://www.bfemploi.com/annonce-details-3873.html', 'Programme Officer - School Meals - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Ex', array['ONG', 'Burkina Faso', 'BFemploi', 'programme', 'officer', 'concours']::text[], 70, 0, 'review', '2026-06-12T09:28:40.357Z', now())
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
values ('4d8bb0a2-2e68-4121-85ed-79e64a35e415'::uuid, '55269b4fca460f79148fbb8c606d39713477605c18ae35263b0fba5a645c0927', 'Executive Secretary- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Bureau', 'A verifier', 'Non communique', '2026-06-12', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/executive-secretary-ouagadougou-303736', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/executive-secretary-ouagadougou-303736', null, array['Bureau', 'Ouagadougou', 'Emploiburkina']::text[], 45, 0, 'review', '2026-06-12T09:29:01.485Z', now())
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
values ('6b07b09a-8f62-43cb-8004-79fb421cb50b'::uuid, '5114bd3206f770cea9589ae9281ad2010314447a0fd584998f1f9d722af673b0', 'Responsable de Recherche', 'BFemploi', 'Ouagadougou', 'Bureau', 'A verifier', 'Non communique', '2026-06-04', null, 'A verifier', 'https://www.bfemploi.com/annonce-details-3871.html', 'https://www.bfemploi.com/annonce-details-3871.html', 'Responsable de Recherche - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Co', array['Bureau', 'Ouagadougou', 'BFemploi', 'concours']::text[], 70, 0, 'review', '2026-06-12T09:28:40.357Z', now())
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
values ('6b06210f-2bd2-4b73-8f8a-fdd7322033c0'::uuid, 'dd07b60720e6a48b03e5f25fb941efa31fdc58338bc343c11ad3633f55d780af', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi', 'Emploiburkina', 'Bagassi', 'Transport et logistique', 'CDD', 'Non communique', '2026-06-12', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', null, array['Transport et logistique', 'Bagassi', 'Emploiburkina', 'magasinier']::text[], 45, 0, 'review', '2026-06-12T09:29:01.485Z', now())
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
values ('8b269a20-a282-4152-8f4a-fc8f8cd09864'::uuid, 'ac8e8a256b510daa371cf72207a33bceea3a9c2e12142b2e5a3035a07c01d797', 'Enquêteurs / Chercheurs de terrain', 'BFemploi', 'Burkina Faso', 'Metiers terrain et informels', 'Mission', 'Non communique', '2026-06-03', null, 'A verifier', 'https://www.bfemploi.com/annonce-details-3870.html', 'https://www.bfemploi.com/annonce-details-3870.html', 'Enquêteurs / Chercheurs de terrain - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides', array['Metiers terrain et informels', 'Burkina Faso', 'BFemploi', 'terrain', 'concours']::text[], 70, 0, 'review', '2026-06-12T09:28:40.357Z', now())
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
values ('0ef2e8f6-8203-4ff9-8821-acaf13e92c2f'::uuid, '416c39ed141e3c248a2d74ed7a393055a000647a7b5f0af202dd0a05509eee00', 'Manager- Work From Home', 'Emploiburkina', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', '2026-06-12', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', null, array['Bureau', 'Burkina Faso', 'Emploiburkina']::text[], 45, 0, 'review', '2026-06-12T09:29:01.486Z', now())
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
values ('00083432-89be-442b-855f-bbadad7a4d53'::uuid, '7f08c84ad3f5e743609f4a14aa4637642de5902afa4b9b359f66f390ddd15775', 'Specialiste Safeguarding Regional', 'BFemploi', 'Burkina Faso', 'Bureau', 'CDD', 'Non communique', '2026-06-01', null, 'A verifier', 'https://www.bfemploi.com/annonce-details-3869.html', 'https://www.bfemploi.com/annonce-details-3869.html', 'Specialiste Safeguarding Regional - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides E', array['Bureau', 'Burkina Faso', 'BFemploi', 'concours']::text[], 70, 0, 'review', '2026-06-12T09:28:40.357Z', now())
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
values ('fb751adf-b6cd-4579-862f-0dc22b2e91c3'::uuid, 'db86e6a3396863c8983e2d1bb0d497e701884b8e6e3798465e0547d19e140cb3', 'ANGULAR Developer (M/F)', 'Emploiburkina', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', '2026-06-12', null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', null, array['Bureau', 'Burkina Faso', 'Emploiburkina']::text[], 45, 0, 'review', '2026-06-12T09:29:01.486Z', now())
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
values ('593ea82e-2292-4568-8c01-ee8b6492db6d'::uuid, 'a8c215957c183ce487b40f2097393bea1adc9878e69ca349579b0b1235bd2dcb', 'Coordinateur Administratif et Logistique', 'BFemploi', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', '2026-05-18', null, 'A verifier', 'https://www.bfemploi.com/annonce-details-3866.html', 'https://www.bfemploi.com/annonce-details-3866.html', 'Coordinateur Administratif et Logistique - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - G', array['ONG', 'Burkina Faso', 'BFemploi', 'coordinateur', 'logistique', 'administratif', 'concours']::text[], 70, 0, 'review', '2026-06-12T09:28:40.357Z', now())
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
