-- Emplois Burkina seed generated from local JSON data.
-- Generated at 2026-06-25T12:23:39.218Z.
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
values ('travail-burkina', 'Travail Burkina', 'https://www.travail-burkina.com/', 'job_board', 2, 'manual_only', array['emploi', 'job', 'offre', 'recrutement']::text[], array['inscription', 'login', 'cv', 'formation', 'recruteur']::text[], 'Le site expose surtout des categories et taxonomies sans flux detail fiable exploitable en automatique. A reprendre plus tard avec controle manuel.', now())
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
values ('rmo-burkina', 'RMO Job Center', 'https://www.rmo-jobcenter.com/fr/nos-offres-emploi.html', 'recruiter', 2, 'manual_only', array['offre', 'emploi', 'job']::text[], array['candidature-spontanee', 'login', 'contact']::text[], 'La page publique disponible remonte surtout des offres d''autres pays et du contenu editorial. Mise en veille auto jusqu''a un connecteur Burkina fiable.', now())
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
values ('unv-opportunities', 'UNV Opportunities', 'https://app.unv.org/opportunities', 'multilateral', 2, 'manual_only', array['opportunities', 'burkina', 'volunteer']::text[], array['login']::text[], 'Portail officiel des Volontaires des Nations Unies. Utile pour volontariat national et international.', now())
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
values ('who-careers', 'WHO Careers', 'https://careers.who.int/careersection/ex/jobsearch.ftl', 'multilateral', 2, 'manual_only', array['jobsearch', 'burkina', 'consultant']::text[], array['login']::text[], 'Portail officiel OMS/WHO. Important pour sante publique, consultance et coordination de projets.', now())
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
values ('unesco-careers', 'UNESCO Careers', 'https://careers.unesco.org/go/All-jobs-openings/782502/', 'multilateral', 2, 'manual_only', array['jobs', 'openings', 'consultant', 'burkina']::text[], array['login']::text[], 'Portail officiel UNESCO. A surveiller pour education, culture, communication et consultance.', now())
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
values ('fao-careers', 'FAO Careers', 'https://jobs.fao.org/careersection/fao_external/jobsearch.ftl', 'multilateral', 2, 'manual_only', array['jobsearch', 'burkina', 'consultant']::text[], array['login']::text[], 'Portail officiel FAO pour agriculture, resilience, nutrition et consultance.', now())
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
values ('wfp-careers', 'WFP Careers', 'https://wd3.myworkdaysite.com/recruiting/wfp/job_openings', 'multilateral', 2, 'manual_only', array['job_openings', 'burkina', 'consultant']::text[], array['login']::text[], 'Portail officiel Programme Alimentaire Mondial pour operations, logistique et postes terrain.', now())
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
values ('afdb-careers', 'African Development Bank Careers', 'https://www.afdb.org/en/about-us/careers/current-vacancies', 'multilateral', 3, 'manual_only', array['careers', 'vacancies', 'consultant', 'burkina']::text[], array['login']::text[], 'Banque Africaine de Developpement. Utile pour postes experts, projets et consultance regionale.', now())
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
values ('world-bank-careers', 'World Bank Group Careers', 'https://worldbankgroup.csod.com/ux/ats/careersite/1/home', 'multilateral', 3, 'manual_only', array['careersite', 'burkina', 'consultant']::text[], array['login']::text[], 'Portail officiel Banque mondiale. A suivre pour projets, operations, data et consultance.', now())
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
values ('giz-careers', 'GIZ Careers', 'https://jobs.giz.de/', 'organization', 3, 'manual_only', array['job', 'burkina', 'africa']::text[], array['login']::text[], 'Portail officiel GIZ. Utile pour cooperation, gouvernance, climat et missions d''expertise.', now())
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
values ('un-careers', 'UN Careers', 'https://careers.un.org/lbw/home.aspx?viewtype=SJ&vacancy=All', 'multilateral', 2, 'manual_only', array['vacancy', 'job', 'careers']::text[], array['login']::text[], 'Portail officiel des Nations Unies pour postes internationaux, P, G, consultance et terrain.', now())
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
values ('ilo-jobs', 'ILO Jobs', 'https://jobs.ilo.org/', 'multilateral', 2, 'manual_only', array['job', 'jobs', 'consult']::text[], array['login']::text[], 'Portail officiel de l''OIT/ILO. Important pour emploi, travail decent, protection sociale et digitalisation du travail.', now())
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
values ('iaea-careers', 'IAEA Careers', 'https://iaea.taleo.net/careersection/ex/jobsearch.ftl', 'multilateral', 2, 'manual_only', array['jobsearch', 'job', 'vacancy']::text[], array['login']::text[], 'Portail officiel de l''AIEA/IAEA. Peut contenir des postes IT, data, securite, ingenierie et support.', now())
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
values ('unido-careers', 'UNIDO Careers', 'https://careers.unido.org/', 'multilateral', 2, 'manual_only', array['vacancies', 'job', 'consult']::text[], array['login']::text[], 'Portail officiel de l''ONUDI/UNIDO. Pertinent pour industrie, projets, transformation digitale et data.', now())
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
values ('itu-jobs', 'ITU Jobs', 'https://jobs.itu.int/', 'multilateral', 2, 'manual_only', array['job', 'openings', 'consultant', 'ict']::text[], array['login']::text[], 'Portail officiel de l''UIT/ITU. Source majeure pour ICT, telecom, cyber, ingenierie et transformation numerique.', now())
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
values ('unops-jobs', 'UNOPS Jobs', 'https://jobs.unops.org/', 'multilateral', 2, 'manual_only', array['vacancy', 'job', 'jobs']::text[], array['login']::text[], 'Portail officiel UNOPS. Frequent pour projets, operations, procurement, infrastructure et IT.', now())
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
values ('unhcr-careers', 'UNHCR Careers', 'https://www.unhcr.org/careers.html', 'multilateral', 2, 'manual_only', array['career', 'job', 'vacancy']::text[], array['login']::text[], 'Portail officiel du HCR/UNHCR. Source serieuse pour terrain, data, information management et protection.', now())
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
values ('iom-careers', 'IOM Careers', 'https://www.iom.int/careers', 'multilateral', 2, 'manual_only', array['career', 'job', 'vacancy']::text[], array['login']::text[], 'Portail officiel OIM/IOM. Pertinent pour migration, operations, data, ICT et gestion de l''information.', now())
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
values ('unfpa-jobs', 'UNFPA Jobs', 'https://www.unfpa.org/jobs', 'multilateral', 2, 'manual_only', array['jobs', 'consultant', 'vacancy']::text[], array['login']::text[], 'Portail officiel UNFPA pour programmes, operations, data et consultance.', now())
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
values ('un-women-jobs', 'UN Women Jobs', 'https://www.unwomen.org/en/about-us/employment', 'multilateral', 2, 'manual_only', array['employment', 'jobs', 'consultant']::text[], array['login']::text[], 'Portail officiel ONU Femmes. Peut contenir des postes operations, programme, digital et data.', now())
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
values ('unep-jobs', 'UNEP Work With Us', 'https://www.unep.org/work-with-us', 'multilateral', 2, 'manual_only', array['work-with-us', 'job', 'consult']::text[], array['login']::text[], 'Portail officiel PNUE/UNEP. Pertinent pour environnement, GIS, data, digital et projets.', now())
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
values ('ifad-jobs', 'IFAD Jobs', 'https://jobs.ifad.org/', 'multilateral', 2, 'manual_only', array['job', 'jobs', 'vacancy']::text[], array['login']::text[], 'Portail officiel du FIDA/IFAD. Source serieuse pour projets, rural, operations, ICT et data.', now())
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
values ('wto-vacancies', 'WTO Vacancies', 'https://www.wto.org/english/thewto_e/vacan_e/vacan_e.htm', 'multilateral', 3, 'manual_only', array['vacan', 'job', 'intern']::text[], array['login']::text[], 'Portail officiel de l''OMC/WTO. Peut contenir des fonctions data, analyse, securite et systems.', now())
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
values ('icao-careers', 'ICAO Careers', 'https://careers-new.icao.int/', 'multilateral', 3, 'manual_only', array['career', 'job', 'vacancy']::text[], array['login']::text[], 'Portail officiel OACI/ICAO. Utile pour aviation, systems, data et gestion internationale.', now())
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
values ('imo-jobs', 'IMO Jobs', 'https://jobs.imo.org/', 'multilateral', 3, 'manual_only', array['job', 'jobs', 'consult']::text[], array['login']::text[], 'Portail officiel OMI/IMO. Source institutionnelle complementaire pour operations, systems et digital.', now())
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
values ('ifrc-careers', 'IFRC Careers', 'https://www.ifrc.org/careers', 'ngo', 3, 'manual_only', array['careers', 'jobs', 'vacancies']::text[], array['login']::text[], 'Portail officiel Federation internationale Croix-Rouge / Croissant-Rouge.', now())
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
values ('oxfam-careers', 'Oxfam Careers', 'https://careers.oxfam.org.uk/', 'ngo', 3, 'manual_only', array['job', 'jobs', 'vacancy']::text[], array['login']::text[], 'Portail officiel Oxfam. Source internationale credible pour humanitaire, digital, data et programme.', now())
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
values ('care-international-careers', 'CARE Careers', 'https://careers.care.org/', 'ngo', 3, 'manual_only', array['job', 'jobs', 'career']::text[], array['login']::text[], 'Portail officiel CARE. Pertinent pour programme, operations, digital et support international.', now())
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
values ('irc-careers', 'IRC Careers', 'https://careers.rescue.org/', 'ngo', 3, 'manual_only', array['job', 'jobs', 'careers']::text[], array['login']::text[], 'Portail officiel International Rescue Committee. Source serieuse pour humanitaire, data et information management.', now())
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
values ('mercy-corps-careers', 'Mercy Corps Careers', 'https://careers.mercycorps.org/', 'ngo', 3, 'manual_only', array['job', 'jobs', 'career']::text[], array['login']::text[], 'Portail officiel Mercy Corps. Peut contenir operations, IT, digital et support programme.', now())
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
values ('concern-worldwide-jobs', 'Concern Worldwide Jobs', 'https://jobs.concern.net/', 'ngo', 3, 'manual_only', array['job', 'jobs', 'vacancy']::text[], array['login']::text[], 'Portail officiel Concern Worldwide. Source humanitaire serieuse et diversifiee.', now())
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
values ('acted-careers', 'ACTED Careers', 'https://careers.acted.org/', 'ngo', 3, 'manual_only', array['career', 'job', 'vacancy']::text[], array['login']::text[], 'Portail officiel ACTED. Pertinent pour terrain, GIS, data, systems et operations.', now())
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
values ('relief-international-careers', 'Relief International Careers', 'https://www.reliefinternational.org/careers/', 'ngo', 3, 'manual_only', array['career', 'job', 'vacancy']::text[], array['login']::text[], 'Portail officiel Relief International. Source credible pour programmes, sante, operations et support IT.', now())
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
values ('snv-careers', 'SNV Careers', 'https://snv.org/careers', 'organization', 3, 'manual_only', array['career', 'job', 'vacancy']::text[], array['login']::text[], 'Portail officiel SNV. Utile pour projets, data, digitalisation et assistance technique.', now())
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
values ('technoserve-jobs', 'TechnoServe Jobs', 'https://jobs.technoserve.org/', 'organization', 3, 'manual_only', array['job', 'jobs', 'career']::text[], array['login']::text[], 'Portail officiel TechnoServe. Peut remonter des postes projet, digital, data et operations.', now())
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
values ('microsoft-careers', 'Microsoft Careers', 'https://jobs.careers.microsoft.com/global/en/search', 'organization', 4, 'manual_only', array['jobs', 'search', 'africa', 'remote']::text[], array['login']::text[], 'Portail officiel Microsoft. Ajoute une couche entreprise internationale credible pour les profils IT et cloud.', now())
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
values ('oracle-careers', 'Oracle Careers', 'https://careers.oracle.com/jobs/', 'organization', 4, 'manual_only', array['jobs', 'careers', 'remote']::text[], array['login']::text[], 'Portail officiel Oracle. Utile pour systemes, cloud, data et support applicatif international.', now())
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
values ('cisco-careers', 'Cisco Careers', 'https://jobs.cisco.com/jobs/SearchJobs/', 'organization', 4, 'manual_only', array['jobs', 'searchjobs', 'remote']::text[], array['login']::text[], 'Portail officiel Cisco. Pertinent pour reseau, securite, cloud et support technique.', now())
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
values ('jooble-burkina', 'Jooble Burkina Faso', 'https://jooble.org/SearchResult?ukw=&rgns=Burkina%20Faso', 'aggregator', 2, 'review_required', array['emploi', 'job', 'burkina']::text[], array['login']::text[], 'Agregateur mondial. Utile pour veille, a eviter en extraction massive.', now())
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
values ('optioncarriere-burkina', 'Optioncarriere Burkina Faso', 'https://www.optioncarriere.com/emploi?s=&l=Burkina+Faso', 'aggregator', 2, 'review_required', array['emploi', 'offre', 'burkina']::text[], array['login']::text[], 'Agregateur emploi. Lier les offres vers les sources originales quand possible.', now())
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
values ('telegram-whatsapp-community-watch', 'Communautes WhatsApp Telegram Emploi', 'https://emplois-burkina.com/contacts/', 'social_group', 1, 'manual_only', array['emploi', 'recrutement', 'artisan', 'service']::text[], '{}', 'Source indirecte: collecter via formulaires, admins de groupes et partenariats, puis verifier avant publication.', now())
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
values ('aib-communiques-emploi', 'AIB Communiques emploi', 'https://www.aib.media/', 'media', 3, 'manual_only', array['emploi', 'recrutement', 'concours', 'formation', 'communique']::text[], array['politique', 'sport']::text[], 'Veille presse publique pour communiques locaux, concours, recrutements communaux et formations.', now())
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
values ('sidwaya-communiques-emploi', 'Sidwaya Communiques', 'https://www.sidwaya.info/', 'media', 3, 'manual_only', array['emploi', 'recrutement', 'concours', 'formation', 'communique']::text[], array['politique', 'sport']::text[], 'Veille manuelle des annonces publiques, communiques institutionnels et opportunites locales.', now())
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
values ('radio-communautaire-veille', 'Radios et annonces communautaires', 'https://emplois-burkina.com/contacts.html', 'community_channel', 1, 'manual_only', array['emploi', 'artisan', 'chantier', 'journalier', 'service', 'apprentissage']::text[], '{}', 'Canal inclusif pour offres entendues a la radio ou dans les quartiers. Soumission via formulaire/WhatsApp puis verification admin.', now())
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
values ('marches-artisans-submissions', 'Marches, ateliers et artisans', 'https://emplois-burkina.com/contacts.html', 'informal_market', 1, 'manual_only', array['macon', 'soudeur', 'menuisier', 'plombier', 'electricien', 'tailleur', 'chauffeur', 'apprenti']::text[], '{}', 'Collecte via relais terrain, syndicats, ateliers, maitres artisans et formulaires simples. Publication uniquement apres verification.', now())
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
values ('mairies-communes-veille', 'Mairies et communes', 'https://emplois-burkina.com/contacts.html', 'local_government', 2, 'manual_only', array['recrutement', 'communique', 'chantier', 'formation', 'appel']::text[], '{}', 'Veille locale pour chantiers communaux, agents temporaires, appels a candidatures et travaux de proximite.', now())
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
values ('centres-formation-apprentissage', 'Centres de formation et apprentissage', 'https://emplois-burkina.com/contacts.html', 'training', 2, 'manual_only', array['apprentissage', 'formation', 'stage', 'atelier', 'metier']::text[], '{}', 'Canal pour stages, apprentissage metier, alternance, formations courtes et insertion professionnelle.', now())
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
insert into sources (id, name, url, type, priority, collection, include_url, exclude_url, notes, updated_at)
values ('devbusiness-consulting', 'Development Business Consulting', 'https://www.devbusiness.com/Search/Consulting/', 'development_marketplace', 2, 'manual_only', array['consulting', 'africa', 'burkina']::text[], array['login']::text[], 'Source internationale serieuse pour missions de consultance financees par bailleurs et projets publics.', now())
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
values ('upwork-remote', 'Upwork Remote Jobs', 'https://www.upwork.com/nx/jobs/search/', 'freelance_platform', 2, 'manual_only', array['jobs', 'remote', 'freelance']::text[], array['login']::text[], 'Plateforme mondiale de freelance. Bonne porte d''entree pour consultance, design, redaction, support et developpement.', now())
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
values ('fiverr-freelance', 'Fiverr Freelance', 'https://www.fiverr.com/categories/programming-tech', 'freelance_platform', 3, 'manual_only', array['freelance', 'remote', 'gig']::text[], array['login']::text[], 'Plateforme freelance utile pour services numeriques et missions courtes. Profil et reputation a construire proprement.', now())
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
values ('remoteok-jobs', 'Remote OK', 'https://remoteok.com/', 'remote_board', 3, 'manual_only', array['remote', 'jobs']::text[], array['login']::text[], 'Tableau mondial de travail a distance. Rechercher remote, support, engineering, design ou operations.', now())
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
values ('weworkremotely-jobs', 'We Work Remotely', 'https://weworkremotely.com/remote-jobs/search?term=africa', 'remote_board', 3, 'manual_only', array['remote', 'jobs', 'africa']::text[], array['login']::text[], 'Site reconnu pour travail a distance. Les mots utiles sont remote, customer support, operations, product et africa.', now())
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
values ('afriquejob-burkina', 'AfriqueJob Burkina Faso', 'https://www.afriquejob.com/emploi/burkina-faso/', 'job_board', 7, 'manual_only', '{}', '{}', 'Grand aggregateur africain - section Burkina', now())
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
values ('expertisenf-bf', 'Expertise France Afrique', 'https://www.expertisefrance.fr/offres-d-emploi?zone=Afrique+subsaharienne', 'ngo', 6, 'manual_only', '{}', '{}', 'Expertise technique internationale, missions Burkina', now())
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
values ('africa-job-bf', 'Africa-Job Burkina Faso', 'https://www.africa-job.com/emploi/burkina-faso', 'job_board', 6, 'manual_only', '{}', '{}', 'Portail emploi Afrique - section Burkina', now())
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
values ('recrutement-bf-direct', 'Recrutement BF', 'https://www.recrutement.bf/', 'job_board', 8, 'manual_only', '{}', '{}', 'Site dedie au recrutement au Burkina Faso', now())
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
values ('emploi-public-bf', 'Emploi Public Burkina', 'https://www.emploi-public.bf/', 'government', 9, 'manual_only', '{}', '{}', 'Offres emploi secteur public Burkina Faso', now())
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
values ('0a823de0f1a9beae68fc625e77b86577523cff4ec19f8c3b0958db47b614da8e', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Liste des annonces', 'BFemploi', 'Administration-Gestion', '2026-07-12', '2026-06-24', '2026-07-12', false, 'https://www.bfemploi.com/emplois-annonces.html', 'A classer', 'needs_review', 'Liste des annonces - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours', 'https://www.bfemploi.com/emplois-annonces.html', '2026-06-25T12:11:39.927Z', 0, 0, '2026-06-25T12:11:38.623Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('13d18bc699b8f81821d2385d49b19a04ca2bb5c12153c05e0debad252e0e4c80', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'BFemploi.com', 'BFemploi', 'Burkina Faso', null, null, null, false, 'https://www.bfemploi.com/examens-concours', 'A classer', 'needs_review', 'BFemploi.com - Liste des pages - Infos Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Con', 'https://www.bfemploi.com/examens-concours', '2026-06-25T12:11:40.575Z', 0, 0, '2026-06-25T12:11:38.623Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('aca4c3653df020e64c88f764b32fce4deb50f0fafb7c2879670cd13d18cc1c80', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'BFemploi.com', 'BFemploi', 'Burkina Faso', null, null, null, false, 'https://www.bfemploi.com/examens-concours', 'A classer', 'needs_review', 'BFemploi.com - Liste des pages - Infos Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Con', 'https://www.bfemploi.com/examens-concours', '2026-06-25T12:11:41.207Z', 0, 0, '2026-06-25T12:11:38.621Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('651e1ed0b1a3928a77801966d8defa7290a6859620f2ce23526f142a8f0162c7', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Delegado/a de Salud, Agua y Saneamiento', 'BFemploi', 'Burkina Faso', '2026-07-12', '2026-06-24', '2026-07-12', false, 'https://www.bfemploi.com/annonce-details-3883.html', 'A classer', 'needs_review', 'Delegado/a de Salud, Agua y Saneamiento - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Gu', 'https://www.bfemploi.com/annonce-details-3883.html', '2026-06-25T12:11:41.923Z', 0, 0, '2026-06-25T12:11:39.269Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d323737c722c32b9a688f2fc7a0a3999ff23372513efe9e45fcb4339abdb4463', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Volunteer Specialist', 'BFemploi', 'Burkina Faso', '2026-08-31', '2026-06-23', '2026-08-31', false, 'https://www.bfemploi.com/annonce-details-3882.html', 'A classer', 'needs_review', 'Volunteer Specialist - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concou', 'https://www.bfemploi.com/annonce-details-3882.html', '2026-06-25T12:11:42.715Z', 0, 0, '2026-06-25T12:11:39.269Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ca4c8f74e88c3a2995a82a12d84afb847523ceffb8f9a8e2fc061b28680bf36a', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Coordinateur·trice Financier·e', 'BFemploi', 'DU POSTE', '2026-06-30', '2026-06-22', '2026-06-30', false, 'https://www.bfemploi.com/annonce-details-3881.html', 'A classer', 'needs_review', 'Coordinateur·trice Financier·e - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Exam', 'https://www.bfemploi.com/annonce-details-3881.html', '2026-06-25T12:11:43.523Z', 0, 0, '2026-06-25T12:11:39.269Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('430c3e9488347993650f6ab367506e280ef6ca97c2baab177df4a8e55169fadd', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Responsable Administration de Projet', 'BFemploi', 'de mission Les frais d', '2026-06-25', '2026-06-15', '2026-06-25', false, 'https://www.bfemploi.com/annonce-details-3878.html', 'A classer', 'needs_review', 'Responsable Administration de Projet - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guide', 'https://www.bfemploi.com/annonce-details-3878.html', '2026-06-25T12:11:44.570Z', 0, 0, '2026-06-25T12:11:39.269Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5114bd3206f770cea9589ae9281ad2010314447a0fd584998f1f9d722af673b0', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Responsable de Recherche', 'BFemploi', 'Ouagadougou', '2026-06-30', '2026-06-04', '2026-06-30', false, 'https://www.bfemploi.com/annonce-details-3871.html', 'A classer', 'needs_review', 'Responsable de Recherche - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Co', 'https://www.bfemploi.com/annonce-details-3871.html', '2026-06-25T12:11:45.357Z', 0, 0, '2026-06-25T12:11:39.270Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ac8e8a256b510daa371cf72207a33bceea3a9c2e12142b2e5a3035a07c01d797', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Enquêteurs / Chercheurs de terrain', 'BFemploi', 'Burkina Faso', '2026-06-26', '2026-06-03', '2026-06-26', false, 'https://www.bfemploi.com/annonce-details-3870.html', 'A classer', 'needs_review', 'Enquêteurs / Chercheurs de terrain - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides ', 'https://www.bfemploi.com/annonce-details-3870.html', '2026-06-25T12:11:46.020Z', 0, 0, '2026-06-25T12:11:39.270Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a8c215957c183ce487b40f2097393bea1adc9878e69ca349579b0b1235bd2dcb', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Coordinateur Administratif et Logistique', 'BFemploi', 'dans le courant des mois de mai et juin', '2026-08-17', '2026-05-18', '2026-08-17', false, 'https://www.bfemploi.com/annonce-details-3866.html', 'A classer', 'needs_review', 'Coordinateur Administratif et Logistique - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - G', 'https://www.bfemploi.com/annonce-details-3866.html', '2026-06-25T12:11:46.819Z', 0, 0, '2026-06-25T12:11:39.270Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7469e2e30dc36f18653500c264fc7cf2f4bc1a06e43ffa6861a10ead9c3a1d08', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Delegado/a de Salud, Agua y Saneamiento', 'BFemploi', 'Burkina Faso', '2026-07-12', '2026-06-24', '2026-07-12', false, 'https://www.bfemploi.com/annonce-details-3883.html', 'A classer', 'needs_review', 'Delegado/a de Salud, Agua y Saneamiento - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Gu', 'https://www.bfemploi.com/annonce-details-3883.html', '2026-06-25T12:11:47.450Z', 0, 0, '2026-06-25T12:11:39.269Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('198129fff28dbc5aa66b75279253ad69a267b84a4fd20cf3042b1ebf9f343916', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Volunteer Specialist', 'BFemploi', 'Burkina Faso', '2026-08-31', '2026-06-23', '2026-08-31', false, 'https://www.bfemploi.com/annonce-details-3882.html', 'A classer', 'needs_review', 'Volunteer Specialist - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concou', 'https://www.bfemploi.com/annonce-details-3882.html', '2026-06-25T12:11:48.248Z', 0, 0, '2026-06-25T12:11:39.269Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('611dc156bb7bb304f4fd18101f30c813ba5f07058f99c976cb3d5851e638ba05', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Coordinateur·trice Financier·e', 'BFemploi', 'DU POSTE', '2026-06-30', '2026-06-22', '2026-06-30', false, 'https://www.bfemploi.com/annonce-details-3881.html', 'A classer', 'needs_review', 'Coordinateur·trice Financier·e - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Exam', 'https://www.bfemploi.com/annonce-details-3881.html', '2026-06-25T12:11:49.036Z', 0, 0, '2026-06-25T12:11:39.269Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1dfe078b4105fc5429483b3bc12504caf75b9490d57a027efddc44a79c78ba6f', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Catalogue des formations - deuxième partie 2026', 'BFemploi', 'Burkina Faso', '2026-06-26', '2026-06-19', '2026-06-26', false, 'https://www.bfemploi.com/annonce-details-3880.html', 'A classer', 'needs_review', 'Catalogue des formations - deuxième partie 2026 - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles In', 'https://www.bfemploi.com/annonce-details-3880.html', '2026-06-25T12:11:49.685Z', 0, 0, '2026-06-25T12:11:39.269Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('772b2ac508a7ad7959aa7112738d7fcfb4b82bf75fbfa48ea2176c224ccf5498', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Responsable Administration de Projet', 'BFemploi', 'de mission Les frais d', '2026-06-25', '2026-06-15', '2026-06-25', false, 'https://www.bfemploi.com/annonce-details-3878.html', 'A classer', 'needs_review', 'Responsable Administration de Projet - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guide', 'https://www.bfemploi.com/annonce-details-3878.html', '2026-06-25T12:11:50.485Z', 0, 0, '2026-06-25T12:11:39.270Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eae1b7bc1c2f5fda14b96a22ae7ea0301999cdf51fc8258a915bb39689324aae', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Responsable de Recherche', 'BFemploi', 'Ouagadougou', '2026-06-30', '2026-06-04', '2026-06-30', false, 'https://www.bfemploi.com/annonce-details-3871.html', 'A classer', 'needs_review', 'Responsable de Recherche - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Co', 'https://www.bfemploi.com/annonce-details-3871.html', '2026-06-25T12:11:51.273Z', 0, 0, '2026-06-25T12:11:39.270Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5a6cd0b1780af17a8ed8e72ae2bf98727bca8f627a8ea1596a3980325d84836d', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Enquêteurs / Chercheurs de terrain', 'BFemploi', 'Burkina Faso', '2026-06-26', '2026-06-03', '2026-06-26', false, 'https://www.bfemploi.com/annonce-details-3870.html', 'A classer', 'needs_review', 'Enquêteurs / Chercheurs de terrain - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides ', 'https://www.bfemploi.com/annonce-details-3870.html', '2026-06-25T12:11:51.934Z', 0, 0, '2026-06-25T12:11:39.270Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a871818364e9adca05703cf9b7ea52a1213f9753b1e0a24b5d992a9711c22a7c', 'bfemploi', 'BFemploi', 'https://www.bfemploi.com/', 'Coordinateur Administratif et Logistique', 'BFemploi', 'dans le courant des mois de mai et juin', '2026-08-17', '2026-05-18', '2026-08-17', false, 'https://www.bfemploi.com/annonce-details-3866.html', 'A classer', 'needs_review', 'Coordinateur Administratif et Logistique - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - G', 'https://www.bfemploi.com/annonce-details-3866.html', '2026-06-25T12:11:52.579Z', 0, 0, '2026-06-25T12:11:39.270Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4b6b5059e62eb218f3838b1d66a2287dd6e7ba1e19d5cd4e257db158522b89fa', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Rechercher un emploi', 'Emploiburkina', 'commun Fixer librement vos tarifs horaires Préparer les cours et accompagner les', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', 'Emplois au Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Rechercher un emploi Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filter Production, maintenance, qualité (6) Apply Production,', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', '2026-06-25T12:12:15.044Z', 0, 0, '2026-06-25T12:12:05.139Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a67deb385f61f41bace8e9f895ddd1a56021f53399f3af93662fb1e58d86900e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Commande d''annonces', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recrutement/annonce', 'A classer', 'needs_review', 'Recrutement entreprise : l''annonce pour une offre d''emploi au Burkina Faso Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV 0 Se connecter S´inscrire Commande d''annonces Publiez maintenant vos offres d´emploi et trouvez les bonnes compétences pour vos projets. Nos packs annonces 1 annonce Basic Publiez gratuitement jusqu´à 3 annonces Basic par mois ! Gratuit Publier une annonce Basic Logo gratuit sur votre annonce Restez visible auprès des candidats. Votre logo est inséré gratuitement sur vos annonces et dans l´annuaire des recruteurs. Alerte par email des candidatures reçues Soyez informé à tout moment par email de la réception de nouvelles candidatures à vos annonces. Réception de candidatures de profils non-inscrits sur le site Recevez plus de candidatures : Recevez des candidatures de profil', 'https://www.emploiburkina.com/recrutement/annonce', '2026-06-25T12:12:15.713Z', 0, 0, '2026-06-25T12:12:05.139Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3ddb7b293fa18699660073da852bc2615bf07c0b8dc3b7220fecf855a9ff1f9a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Informatique, nouvelles technologies Burkina Faso', 'Emploiburkina', 'commun Fixer librement vos tarifs horaires Préparer les cours et accompagner les', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A31', 'A classer', 'needs_review', 'Emplois Informatique, nouvelles technologies Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Informatique, nouvelles technologies Burkina Faso Mes critères de recherche Informatique, nouvelles technologies ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) A', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A31', '2026-06-25T12:12:16.410Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('523378de962f436d309ca57fdad9a2967ffc4d8e4a70ee4ac1931f51b0438d85', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Commercial, vente Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A29', 'A classer', 'needs_review', 'Emplois Commercial, vente Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Commercial, vente Burkina Faso Mes critères de recherche Commercial, vente ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filter Production,', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A29', '2026-06-25T12:12:17.093Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5b8eb74ff8fea606aa8b69b2b87e98db5bcdd5b9df8ea6b1c89e1c3089204781', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Marketing, communication Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A33', 'A classer', 'needs_review', 'Emplois Marketing, communication Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Marketing, communication Burkina Faso Mes critères de recherche Marketing, communication ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filt', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A33', '2026-06-25T12:12:17.685Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4c45aa00d0e2415e4e9db47f1a0a752c9e4ebf107f8fb7eb3f33fafd1c4ac06a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Transport, logistique Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A28', 'A classer', 'needs_review', 'Emplois Transport, logistique Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Transport, logistique Burkina Faso Mes critères de recherche Transport, logistique ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A28', '2026-06-25T12:12:18.272Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7b460570a93eec41715bfe6c55f29ad0cc458d5e528699eb4efdebf49884389b', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Production, maintenance, qualité Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A37', 'A classer', 'needs_review', 'Emplois Production, maintenance, qualité Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Production, maintenance, qualité Burkina Faso Mes critères de recherche Production, maintenance, qualité ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métie', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A37', '2026-06-25T12:12:18.864Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d7693dbf660bf28a3c229ece986e960b561f9f2ad9abd058e75e8ac890449f02', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Gestion, comptabilité, finance Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A30', 'A classer', 'needs_review', 'Emplois Gestion, comptabilité, finance Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Gestion, comptabilité, finance Burkina Faso Mes critères de recherche Gestion, comptabilité, finance ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métier', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A30', '2026-06-25T12:12:19.455Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5ed0a783fae604d77488dbf07224d58286acf339730e8dd9e3ba630e5f7c1ab2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Management, direction générale Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A32', 'A classer', 'needs_review', 'Emplois Management, direction générale Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Management, direction générale Burkina Faso Mes critères de recherche Management, direction générale ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métier', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A32', '2026-06-25T12:12:20.036Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3fe82482fd6b4469c83ed41bc6d6934b9899ff6ac995bf0da7bcf71767f1f3a4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Métiers des services Burkina Faso', 'Emploiburkina', 'commun Fixer librement vos tarifs horaires Préparer les cours et accompagner les', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A35', 'A classer', 'needs_review', 'Emplois Métiers des services Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Métiers des services Burkina Faso Mes critères de recherche Métiers des services ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services Métiers du BTP (4) Apply Métiers du BTP filter Prod', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A35', '2026-06-25T12:12:21.010Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a45c98c242ad9c0a39a5c279e891da7281bbc2f3c426d39c2220bd51e5cb2d94', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Métiers du BTP Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A36', 'A classer', 'needs_review', 'Emplois Métiers du BTP Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Métiers du BTP Burkina Faso Mes critères de recherche Métiers du BTP ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP Production, main', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A36', '2026-06-25T12:12:21.770Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('73391cf940b2483762ac76078eb57072e637bf792b0949018f963ff69f286f52', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Métiers de la santé et du social Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A34', 'A classer', 'needs_review', 'Emplois Métiers de la santé et du social Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Métiers de la santé et du social Burkina Faso Mes critères de recherche Métiers de la santé et du social ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Mé', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_metiers%3A34', '2026-06-25T12:12:22.498Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3fbe3b42ecfc6b5dc7ed2fbe6d00834c00f3677df50cb0d7f6d00042c0f6fc93', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Rechercher un emploi', 'Emploiburkina', 'commun Fixer librement vos tarifs horaires Préparer les cours et accompagner les', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', 'Emplois au Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Rechercher un emploi Métiers Achats (1) Apply Achats filter Commercial, vente (13) Apply Commercial, vente filter Gestion, comptabilité, finance (5) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (48) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (4) Apply Management, direction générale filter Marketing, communication (10) Apply Marketing, communication filter Métiers de la santé et du social (2) Apply Métiers de la santé et du social filter Métiers des services (4) Apply Métiers des services filter Métiers du BTP (4) Apply Métiers du BTP filter Production, maintenance, qualité (6) Apply Production,', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', '2026-06-25T12:12:23.189Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('83854165d8ac8570fa73c67c7092f1acb30fb487d1b74a6b8f0581fe68ffa293', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Informatique, SSII, Internet Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A133', 'A classer', 'needs_review', 'Emplois Informatique, SSII, Internet Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Informatique, SSII, Internet Burkina Faso Mes critères de recherche Informatique, SSII, Internet ⤫ Métiers Achats (0) Commercial, vente (3) Apply Commercial, vente filter Gestion, comptabilité, finance (1) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (46) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (1) Apply Management, direction générale filter Marketing, communication (4) Apply Marketing, communication filter Métiers de la santé et du social (0) Métiers des services (0) Métiers du BTP (0) Production, maintenance, qualité (0) R&D, gestion de projets (0) RH, for', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A133', '2026-06-25T12:12:25.309Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('194a17d0e3fbf76d77a61d91dc89c72d62dd44494619ee87d782fc571a1b1389', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Equip. électriques, électroniques, optiques, précision Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A123', 'A classer', 'needs_review', 'Emplois Equip. électriques, électroniques, optiques, précision Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Equip. électriques, électroniques, optiques, précision Burkina Faso Mes critères de recherche Equip. électriques, électroniques, optiques, précision ⤫ Métiers Achats (0) Commercial, vente (5) Apply Commercial, vente filter Gestion, comptabilité, finance (0) Informatique, nouvelles technologies (1) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (0) Marketing, communication (3) Apply Marketing, communication filter Métiers de la santé et du social (0) Métiers des services (0) Métiers du BTP (1) Apply Métiers du BTP filter Production, maintenance, qualité (0) R&D, gestion de pr', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A123', '2026-06-25T12:12:26.275Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('af7cae31ac826b856f58ae5bd76e621b82b24b56369edfcc21e3ec2bd8ec220c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Ingénierie, études développement Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A134', 'A classer', 'needs_review', 'Emplois Ingénierie, études développement Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Ingénierie, études développement Burkina Faso Mes critères de recherche Ingénierie, études développement ⤫ Métiers Achats (0) Commercial, vente (1) Apply Commercial, vente filter Gestion, comptabilité, finance (1) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (2) Apply Informatique, nouvelles technologies filter Juridique (0) Management, direction générale (0) Marketing, communication (0) Métiers de la santé et du social (0) Métiers des services (1) Apply Métiers des services filter Métiers du BTP (0) Production, maintenance, qualité (1) Apply Production, maintenance, qualité filter R&D, gestion de projets (0', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A134', '2026-06-25T12:12:27.200Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0f379cfd2453fad63bc765b76dfd3496b72643bf210b05b2855cc739286a5c11', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Services autres Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A150', 'A classer', 'needs_review', 'Emplois Services autres Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Services autres Burkina Faso Mes critères de recherche Services autres ⤫ Métiers Achats (1) Apply Achats filter Commercial, vente (2) Apply Commercial, vente filter Gestion, comptabilité, finance (2) Apply Gestion, comptabilité, finance filter Informatique, nouvelles technologies (0) Juridique (0) Management, direction générale (0) Marketing, communication (0) Métiers de la santé et du social (0) Métiers des services (0) Métiers du BTP (0) Production, maintenance, qualité (0) R&D, gestion de projets (0) RH, formation (0) Secrétariat, assistanat (1) Apply Secrétariat, assistanat filter Télémarketing, téléassistance (0) Tourisme, hôtellerie, restauration (0) Tra', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A150', '2026-06-25T12:12:28.097Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('80d21b0fb43ae64e5e52921e929e9e269c9a8cd8c0f4b38217a90d99db5e9771', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois Agroalimentaire Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A22', 'A classer', 'needs_review', 'Emplois Agroalimentaire Burkina Faso | Emploiburkina.com Disponible sur --> Offres IT Freelance Accueil Candidat Offres d''emploi Ils recrutent Accueil recruteur Trouver des CV Packs annonces Packs CV Se connecter S´inscrire Emplois Agroalimentaire Burkina Faso Mes critères de recherche Agroalimentaire ⤫ Métiers Achats (0) Commercial, vente (0) Gestion, comptabilité, finance (0) Informatique, nouvelles technologies (0) Juridique (0) Management, direction générale (0) Marketing, communication (0) Métiers de la santé et du social (1) Apply Métiers de la santé et du social filter Métiers des services (0) Métiers du BTP (0) Production, maintenance, qualité (4) Apply Production, maintenance, qualité filter R&D, gestion de projets (0) RH, formation (0) Secrétariat, assistanat (0) Télémarketing, téléassistance (0) Tourisme, hôtellerie, restauration (0) Transport, logistique (0) Secteurs d''activi', 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A22', '2026-06-25T12:12:28.920Z', 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f9ff469b9b9c6e79da688dfe7673bbfd7f8b59fe0b0c1b1a96e999137360cd12', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Automobile, matériels de transport, répar...', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A24', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A24', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d0420a8bbaef2622b3b8f6f28e9df21e43d291c400463e0c849b802233ba86e5', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'BTP, construction', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A26', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A26', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cb7d41d8bded5c2bf4b2ed5e89c91fe9c823dd9f3f71cff2b39356c01a7f78ad', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Chimie, pétrochimie, matières premières, ...', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A115', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A115', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ecc872bdb48876b6abc0baf4501146f88d4c892caa562b974aa58519e5003b9a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Conseil, audit, comptabilité', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A116', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_secteur%3A116', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c80ddd55eadc78df8e3c8b1df53e1e9e060e936c3ca03ba41d3bb9f24888017f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Tous les secteurs d''activité', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('710a42581afc48703044d349dc4d03731b87d099b0585c5dd661d297cac6c858', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A943', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A943', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1c80a1b59018ab8065e05838b237053b3d26b299b4bf6322df4e19834a6d9792', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'International', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A947', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A947', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f0310208920f717dac3da5bf8d7351f9d8477a03c3d44e37f8c1504c524622ef', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Bobo Dioulasso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A58', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A58', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ec843539b2135058e164cabc150f706edbad13e37ff6e912f2f20db01b3a215', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Dédougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A59', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A59', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('73b2eed0fc72888286dadece5c5924f13e9e968853e4c71a43c450aeebcf0250', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Fada N''Gourma', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A61', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso?f%5B0%5D=im_field_offre_region%3A61', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0f8cf7e9b6c7f7c7d4d6fbd7e5e24fb701770634cb962b8cba0f7601ae25c918', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Toutes les régions', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4a1ec186344a99a0fe4622a72b0da387d2849a7d6663710e71ce89b523e804c2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('00035919f04f9c1a5e99599be475cbd5981305cd103a75f2234b012a0f8cf279', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Courtier(ère) en Énergie B2B (Télétravail)- France', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/courtierere-energie-b2b-teletravail-france-288855', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/courtierere-energie-b2b-teletravail-france-288855', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('dd07b60720e6a48b03e5f25fb941efa31fdc58338bc343c11ad3633f55d780af', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ba382968d247e7208a4a40ece1747c1b22ff367900788d1ad421a342b748a14', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Offre de Stage- BTP, Architecture- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/offre-stage-btp-architecture-ouagadougou-304056', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/offre-stage-btp-architecture-ouagadougou-304056', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('416c39ed141e3c248a2d74ed7a393055a000647a7b5f0af202dd0a05509eee00', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Manager- Work From Home', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', now(), 0, 0, '2026-06-25T12:12:05.140Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('562f67805435acedf337c043c78a3122ae7eda45732a33ce03d7e387e7d814c0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Secrétaire- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-ouagadougou-304085', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-ouagadougou-304085', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ff4e325a277b0f77d6d9cfbc043698d39d66756419c6c6bc518d379ecc85994f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Chargé(e) d’Opérations et Développement- Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-operations-developpement-ouagadougou-304191', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-operations-developpement-ouagadougou-304191', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('875ee4aaf7d176be6a3ed24b47d0020f8dc7e9c1480ae7f7df7065f2dd7723e4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Directeur Général / Enseignement Supérieur / Telecom- Ouaga', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/directeur-general-enseignement-superieur-telecom-ouaga-304284', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/directeur-general-enseignement-superieur-telecom-ouaga-304284', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('db86e6a3396863c8983e2d1bb0d497e701884b8e6e3798465e0547d19e140cb3', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'ANGULAR Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/angular-developer-mf-210713', now(), 0, 0, '2026-06-25T12:12:08.013Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d433d18d7103fb188e21a11f668c33673d04aefe11eec7c9f87d529363abf6a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Toutes les offres d´emploi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fe2b148138f77d8260ff59e653965606d78c6e30e5abbf15b45e7f2e22dfee06', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Qui sommes-nous ?', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/qui-sommes-nous', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/qui-sommes-nous', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fb31aea5641f7b4206fc30bd0f6377895daebaa7f02138bf88b15ed6c2b643d4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Plan du site', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/plan-site', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/plan-site', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a6148d1f633c866e32f86493c5ae7ef1099d3517e4ef21837a774fc8f876fca5', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Achats Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1127', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1127', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9cb4a6e41a10c742d21e6076caa209f18e4ddd349c1253bdb7961825c2d484ab', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Commercial, vente Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A29', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A29', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('359c3adc9fdccb2f58552da79a7f65e56c771ed9609772ebfd6e4efe925844eb', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Gestion, comptabilité, finance Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A30', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A30', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1d4f9fc71e0b8f0cb623c074c855b0483bfdc04e81ba0554dd4bda0cf295b8a4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Informatique, nouvelles technologies Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A31', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A31', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('aa1bee8d42bef13890cf9d153be72aa031a7c27d471dc05a95ae0252d23926b0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Juridique Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1115', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A1115', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('634e1ddb3ea86a1d131c0522fdb31f85b0d0c90fc6997ad27dabb466d9f262fe', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Management, direction générale Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A32', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A32', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6e00c135a458dfe06f2db5973b3cd4b816f4bf6e631b15717ad5aa2d6b23d659', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Marketing, communication Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A33', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A33', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('871c5797c16bc0ac8a467e3f803866605ea308a52b53cef20886c9e8356d6a2f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Métiers de la santé et du social Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A34', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A34', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('60e9e1d2a3de05dd934d8d74dfb78a014414f373516c299794b13f455f0dd8bc', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Métiers des services Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A35', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A35', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7534521dde6336d819dfa1fc08fbc8139c16b288e6cab8f8b21ccbd44ef6e7d0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Métiers du BTP Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A36', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A36', now(), 0, 0, '2026-06-25T12:12:05.141Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8f6825eb59f5de18cc0ed6fa2ddddfc05bfa3450920d490be049a671f797afea', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Production, maintenance, qualité Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A37', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A37', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5a3f2891c05efeb70309c238967bf647e2210f2dfbbf786420be25c416799a9f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'R&D, gestion de projets Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A39', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A39', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bade8806cea03af221a439ec86bea2c518fd190d0a846560831092a20d563e8d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Secrétariat, assistanat Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A40', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A40', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8d34e7590459d34d1545b3986d7a64a7825fe4354bac7892ca05865acc328988', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Télémarketing, téléassistance Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A525', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A525', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2084593a4d55b4a9fa9dc95b90aaeebeb360439a62cc44999caba92537168fd7', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Tourisme, hôtellerie, restauration Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A41', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A41', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d6c7850ce3af5142612a42f753d9b5f4bbcbe4aea3ec05edd8b584a3756d2a5a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Transport, logistique Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A28', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_metiers%3A28', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3b5d1fd0a7ed2607c818bebb82d079310f58950fa3c68b51aeb9541b95653514', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Banfora Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A57', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A57', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5000ff5b3af87660a0d1ec14ede82ab51d0a87bf590a9c189e75f1089ca66ff0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Bobo Dioulasso Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A58', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A58', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9d7b6032505f1bd8ac06fc13634baf96c30a68e75114c3d2908c1f507c01c816', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Dédougou Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A59', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A59', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ce3167fe23bc786eee8dcd193b77963aafb79620fa87dd7ecc13ea8588ab88bf', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Dori Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A60', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A60', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ed7f28c845f35710df2c302dff347d6c90dec01cad0761cd83bae9412ea01a6e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Fada N''Gourma Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A61', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A61', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0cb977e378cfa0b17a9f52c1d1b6e4c7e30c010f316ad314c8d27f5457385921', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Gaoua Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A62', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A62', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bf5eb8b52a3c828ca5425fe6e09130dc9337eca48ccf16e0d147e5e443784909', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Kaya Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A63', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A63', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('24d44f57fc7f5f9b28523bdc9ca25d1364b79ff1e4ceed65255ed8acfe0ad740', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Koudougou Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A64', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A64', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('52b3c9662113ab39036d30c613e53a98aa9b99724be30fe3a9d8580dcf917d1c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Manga Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A65', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A65', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('507ed5b68b866b48a4876a9b309bd8209bb88ff0bbd11efc3fbd0fdbcb04888d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ouagadougou Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A943', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A943', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('87fcffd33952406df861c06b54095d952a83fabe54b219473fdca74256912120', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ouahigouya Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A944', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A944', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9344a5538cb558ca901b37062e5856778a15eed30379c1fdc82e5b64399e2bcd', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Tenkodogo Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A945', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A945', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8cebf9906683e3d089bf1b50e606e9f9cf3b3b9b3279b546fe56a51407dc2856', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ziniaré Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A946', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso/?f[0]=im_field_offre_region%3A946', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('234d3df03926e110efee4f796ddc5d3d6ebbf7bd9f22d84d2c4d8c326c77b68c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ingénieurs', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/emplois-actifs/ingenieurs', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/emplois-actifs/ingenieurs', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ea082bf4cd1006738689f92973bb8a3889ffba4e4e3a721713a30008a7bc2c00', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emplois actifs', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/emplois-actifs', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/emplois-actifs', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c206193d3b0bbe21f7248a2e64dbbae1179c696c5b041de23d7f0b7dad7ed145', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Ingénieurs', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recrutements-permanents/ingenieurs', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recrutements-permanents/ingenieurs', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2999d8c01d620d99550f50c5cb932b6fddcc169095f2c7be39f81369a96d610d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Recrutements permanents', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recrutements-permanents', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recrutements-permanents', now(), 0, 0, '2026-06-25T12:12:14.354Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c232c5a7b77ac7f8b38bd62f5c7d4ae9d8b3ed11c4dfa2cdbd67463df581fb8d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Maroc', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.ma/', 'A classer', 'needs_review', null, 'https://www.emploi.ma/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e01b6d95403fb0baa1e742e2d0064be5fd5516d761a4913dae2f0b4279b3152d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Côte d’Ivoire', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.ci/', 'A classer', 'needs_review', null, 'https://www.emploi.ci/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('def39cf101ad8eb9f972a5a738419c39d96a3495d8033d9129558ade98cf1b05', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Congo', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cg/', 'A classer', 'needs_review', null, 'https://www.emploi.cg/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('71f746e1c8958e589a5e56d37466646c69095f0b7e87a7e408921a706fe1a9de', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Cameroun', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cm/', 'A classer', 'needs_review', null, 'https://www.emploi.cm/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('095f5cf1a656012f19e6f61e56bf58e20ce974fb241c1ddf760b876ce357037d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Sénégal', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploisenegal.com/', 'A classer', 'needs_review', null, 'https://www.emploisenegal.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4e19b80358354197d729caeca3148520990cdbe3f37ae9eafc437053a5736d44', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0063f82b586801f66a9213033a19f3be972b01974f5d875917bbec6b035dfca0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Guinée', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiguinee.com/', 'A classer', 'needs_review', null, 'https://www.emploiguinee.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6218771d455ca3ee68df23bff407d0f69a1a67db85166b2a3aecc8d221161238', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Togo', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.tg/', 'A classer', 'needs_review', null, 'https://www.emploi.tg/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('70cb0d16b85094d0fea05512d4aaca4035d316aeb2662940e16d8c75286763fd', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Gabon', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.ga/', 'A classer', 'needs_review', null, 'https://www.emploi.ga/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a690540c614f6ba7146721715e833048adaf9a1da645ea2c42a6d2aec064fcdb', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Mauritanie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploimauritanie.com/', 'A classer', 'needs_review', null, 'https://www.emploimauritanie.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9d9cdd4192106a5ba2389a482c32497e420a57c6ab14a536e9fd9a1e872fc24c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Bénin', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploibenin.com/', 'A classer', 'needs_review', null, 'https://www.emploibenin.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1d92e7bf0bacc9b8ed7b74349c1f760365558a3476f79a9a9efc990e8cbbd7ff', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Mali', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploimali.com/', 'A classer', 'needs_review', null, 'https://www.emploimali.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e120ec35b514b0baf425176472b7d3f156c1b0b54468392f32840888ddd6ad94', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Congo RDC', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cd/', 'A classer', 'needs_review', null, 'https://www.emploi.cd/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7b31d59f897e374b34890e8f8ceb171a523c57144ee1d6155732dafa5fcedfc2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Algérie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.algeriejob.com/', 'A classer', 'needs_review', null, 'https://www.algeriejob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f4943b501811685abd8caf6b0bc5c68e5a8c4a27dff9651b779525a8e4a1de3c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Tunisie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploitunisie.com/', 'A classer', 'needs_review', null, 'https://www.emploitunisie.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('10d60900e28075b6cb304488c372392e828fcfbb4b8d272019def046372fc523', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Niger', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.nigerjob.net/', 'A classer', 'needs_review', null, 'https://www.nigerjob.net/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1623526900bf377c95fffd9dd1f133143a8bac6282e5fc6dbf66d5c2d7765da7', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Tchad', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.td/', 'A classer', 'needs_review', null, 'https://www.emploi.td/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7e78216c20b625819e745686893bfd669a04196f6ae279f0614688ce69af57b6', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Burundi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.bi/', 'A classer', 'needs_review', null, 'https://www.emploi.bi/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f6864d2693995c1576df2d2a07c45dad046cb336d7441c5ecbd1fcbd6003123e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Ghana', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.ghanajob.com/', 'A classer', 'needs_review', null, 'https://www.ghanajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c74711399d85c41568e1280308d2fb000148176831fd569bc2e96ae4dcf76639', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Nigeria', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.nigeriajob.com/', 'A classer', 'needs_review', null, 'https://www.nigeriajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f8be71c45636291279405cf57e30a85d6216ddb4c1c37791123b45350cd41005', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Kenya', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.kenyajob.com/', 'A classer', 'needs_review', null, 'https://www.kenyajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7ca0b3b220078eeda86eb0b74e46bab6a10bdc9d0798b915e159d973501db5ef', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Ouganda', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.ugandajob.com/', 'A classer', 'needs_review', null, 'https://www.ugandajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('30453f4fbaa2d2b7a85103081b341abd8178f20def42545a73ab7ceb0e167a51', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Rwanda', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.rwandajob.com/', 'A classer', 'needs_review', null, 'https://www.rwandajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a5d0c9cdd55fc62812c5cf2fbddf39fd0770b9f9aa60be8656ccbcd448ad50ad', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Tanzanie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.tanzajob.com/', 'A classer', 'needs_review', null, 'https://www.tanzajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c98ecd5ded490eff2c04886180588217adb996dd98ec66cbdb1a08922661e2e3', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Botswana', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.botswajob.com/', 'A classer', 'needs_review', null, 'https://www.botswajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b088c0adaa209b4d5266bf497a2c9bd50e838022c4db67927e7b9990f38e3686', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Malawi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.malawijob.com/', 'A classer', 'needs_review', null, 'https://www.malawijob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4b00d395bf5e6c452f11ba5e15b1c41c66fbc97a6570a431fa172c9019e863e4', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Namibie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.namijob.com/', 'A classer', 'needs_review', null, 'https://www.namijob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('739e3e1d6fd86d9ea7aa0e5efb373d00fd1ce626c2dcf65d59c86d6aebb85c90', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Zambie', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.zambiajob.com/', 'A classer', 'needs_review', null, 'https://www.zambiajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('834c3f5226266842c092ada46c0e0f7e786bdea4db26da5942de4070ab315ca0', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Zimbabwe', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.zimbajob.com/', 'A classer', 'needs_review', null, 'https://www.zimbajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f660c9ce71ee45e8bf617334cec53b4ccf4bbfa8bff7cab5f621bcb34d167413', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Sierra Leone', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.sierraleonejob.com/', 'A classer', 'needs_review', null, 'https://www.sierraleonejob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1492447d76e90aa9075e6e56d2ded993e7acf31d0a8db490c54f1b24eed40d1a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Afrique du Sud', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.zajob.com/', 'A classer', 'needs_review', null, 'https://www.zajob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d00300f29858c8188798ecf763b29d9bc38c029cf238ffcaec852836c180607', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Soudan du Sud', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.southsudanjob.com/', 'A classer', 'needs_review', null, 'https://www.southsudanjob.com/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2cda0bc49f3549a025932ca713163c9096334099a7da3576934f47711cb777be', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Emploi Centrafrique', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploi.cf/', 'A classer', 'needs_review', null, 'https://www.emploi.cf/', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5fbf3fc41b08fa029c4a4853ed9bddc18231580fdec8c2d424a1e59210a43d4d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Mentions légales', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/mentions-legales', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/mentions-legales', now(), 0, 0, '2026-06-25T12:12:05.142Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('659b22d65aa34a5ec1df9b81a6f9912775bcb230412ff7e5aad1b4495a7c3f52', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Propriété Intellectuelle', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/propriete-intellectuelle', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/propriete-intellectuelle', now(), 0, 0, '2026-06-25T12:12:14.355Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d1453f891616480538c060abf7fc0b7efad29c925b19af7e7fde6df7259fab8c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Recherche', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/recherche-jobs-burkina-faso', now(), 0, 0, '2026-06-25T12:12:05.143Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f9fac3c57afb71677590af91c0ada6eb3df5be7059c0a796b9db097e60598f86', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Technico Commercial en Climatisation Haut de Gamme - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', now(), 0, 0, '2026-06-25T12:12:09.335Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fdf7e0c718562d388c011dc6cf3fe4f51ef9c2f4880562bcc541a22820199dff', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Courtier(ère) en Énergie B2B (Télétravail) - France', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/courtierere-energie-b2b-teletravail-france-288855', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/courtierere-energie-b2b-teletravail-france-288855', now(), 0, 0, '2026-06-25T12:12:14.352Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e6c5ff837c93e563d59bdd13bb1b70fae774dbcacdcd46d4b7efe30bf68c8563', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Courtier(ère) en Énergie B2B - France', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/courtierere-energie-b2b-france-291557', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/courtierere-energie-b2b-france-291557', now(), 0, 0, '2026-06-25T12:12:14.353Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('86ab0ca19da238703622c0b892792d30b46fa53e109be1f13b1829a088499992', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Magazine Keeper Junior (Magasinier) H/F - Bagassi', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', now(), 0, 0, '2026-06-25T12:12:11.476Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7b76d30016d0594cb40b39357c63b62a6aa46b71faebd85614bb044851ac1a77', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Blastman H/F - Mogtedo et Boungou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/blastman-hf-mogtedo-boungou-303949', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/blastman-hf-mogtedo-boungou-303949', now(), 0, 0, '2026-06-25T12:12:12.503Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6ba2314af6ef0cf5de027df29d07558be99fd05f9514ce5c6349dcb737791f45', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Manager - Work From Home', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manager-work-from-home-304064', now(), 0, 0, '2026-06-25T12:12:14.353Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ce829b12d518fad23222d5daaec084cef639780e5351ab880770aec24b3364d3', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Secrétaire - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-ouagadougou-304085', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/secretaire-ouagadougou-304085', now(), 0, 0, '2026-06-25T12:12:05.844Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b6f1faf1166f090ae6e383345f994fc3d5fd8b434b42a07f93f66c1992b5d0b6', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Chargé(e) d’Opérations et Développement - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-operations-developpement-ouagadougou-304191', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-operations-developpement-ouagadougou-304191', now(), 0, 0, '2026-06-25T12:12:10.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4f24c649b8e26b36e1ee5a9d8ea2a716dbd9dbc2ea6a3dd1921b586b17753894', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Directeur Général / Enseignement Supérieur / Telecom - Ouaga', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/directeur-general-enseignement-superieur-telecom-ouaga-304284', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/directeur-general-enseignement-superieur-telecom-ouaga-304284', now(), 0, 0, '2026-06-25T12:12:14.353Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0095372865e4a46485e131dd3a8075d8433d53f3d30679f6b81a951bf23a262f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Stagiaire Secretaire Comptable (Stage de pré-emploi) - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-secretaire-comptable-stage-pre-emploi-ouagadougou-304468', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-secretaire-comptable-stage-pre-emploi-ouagadougou-304468', now(), 0, 0, '2026-06-25T12:12:13.518Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('19e6998470250f20e1792cc1fc229327ae8ecffa0d56bdba639aa30b22668f01', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Magasinier(ère) - International', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magasinierere-international-304626', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magasinierere-international-304626', now(), 0, 0, '2026-06-25T12:12:05.845Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('660226243552f26326b606e4c41469d56c75a7f124413bfb5992417a46d88905', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Stagiaire Communication Marketing - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-communication-marketing-ouagadougou-304706', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-communication-marketing-ouagadougou-304706', now(), 0, 0, '2026-06-25T12:12:10.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b0427968629cb5e4ad2367eefcc65ffc88601faf590f64b7342965656114367d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Stagiaire en Infographie et Montage Vidéo - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-infographie-montage-video-ouagadougou-304711', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-infographie-montage-video-ouagadougou-304711', now(), 0, 0, '2026-06-25T12:12:10.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7530670d00298dadd8939b8c1b4c8913147344b176db853b60c782da5479e569', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Stagiaire Ingénieur Technico-Commercial Électricité - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-ingenieur-technico-commercial-electricite-ouagadougou-304722', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-ingenieur-technico-commercial-electricite-ouagadougou-304722', now(), 0, 0, '2026-06-25T12:12:10.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d6caa8f6cbeafd8cb358b544f1a6eab69dddf43db48b0d81e826615634af923f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Chauffeur Particulier - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chauffeur-particulier-ouagadougou-305080', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chauffeur-particulier-ouagadougou-305080', now(), 0, 0, '2026-06-25T12:12:11.476Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9009453312033588601a07f50ca73f2eb81c7855643a75d7cfac54dfae745544', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Agent de Liaison - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/agent-liaison-ouagadougou-305083', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/agent-liaison-ouagadougou-305083', now(), 0, 0, '2026-06-25T12:12:11.476Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a4d99043b0d271eec4b1c8051f253b90a90769464821f3a5ee7b3e0bb7b90e41', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Assistant(e) Administratif(ve) - Burkina Faso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/assistante-administratifve-burkina-faso-305157', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/assistante-administratifve-burkina-faso-305157', now(), 0, 0, '2026-06-25T12:12:13.518Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('667b7145a8887c7db689baaf8f146b2228ef99cfee2b5ceb1272a54c59698b3a', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Affilié Marketing - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/affilie-marketing-ouagadougou-305291', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/affilie-marketing-ouagadougou-305291', now(), 0, 0, '2026-06-25T12:12:10.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b1a9e70ed82014896d075518a7bd8c38a62407edb6674e694fe835cd52f5d664', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Responsable QHSE H/F - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/responsable-qhse-hf-ouagadougou-305571', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/responsable-qhse-hf-ouagadougou-305571', now(), 0, 0, '2026-06-25T12:12:12.503Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('74a054fdf74698b7d5c69321126eba3e8f5027a97f535a07d24979b484835b98', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Chargé(e) d’Opérations et Développement - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-operations-developpement-ouagadougou-306489', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-operations-developpement-ouagadougou-306489', now(), 0, 0, '2026-06-25T12:12:10.497Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('682e48ba9bbf54e2a6536246bcfc7ba06837f825f4c190ad22f0ecd7a8fc77bb', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Chargé (e) d’Opérations et Développement - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/charge-e-operations-developpement-ouagadougou-306494', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/charge-e-operations-developpement-ouagadougou-306494', now(), 0, 0, '2026-06-25T12:12:11.476Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('77022179c4cf846259c5f093253ccbf3a62f5249f1095b81b4836709ac97d81c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Professeur Particulier - Toutes Les Villes', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/professeur-particulier-toutes-villes-306891', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/professeur-particulier-toutes-villes-306891', now(), 0, 0, '2026-06-25T12:12:08.013Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('62999b0348132965dfa05c204b814af1908ae920c6585609374f55bccfd9a39f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Commercial Terrain - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/commercial-terrain-ouagadougou-307250', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/commercial-terrain-ouagadougou-307250', now(), 0, 0, '2026-06-25T12:12:09.335Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6209f3fb54aebcd21d8182811c5999c100e299ddbd722a9cfac3bb0ac4ce7d18', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Coursier Conducteur de Véhicules Automobiles Poids Léger - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/coursier-conducteur-vehicules-automobiles-poids-leger-ouagadougou-307275', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/coursier-conducteur-vehicules-automobiles-poids-leger-ouagadougou-307275', now(), 0, 0, '2026-06-25T12:12:12.503Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('af5f530c82dee78c17a0d2bbfb3255faa37bf7dbf09e2080262ff78d4f73f9a3', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Développeur (euse) Backend - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/developpeur-euse-backend-ouagadougou-308426', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/developpeur-euse-backend-ouagadougou-308426', now(), 0, 0, '2026-06-25T12:12:08.013Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f1ac7d905a4b6533c0e35c8b1ebaad2402d221a340a6b3017bea9042471f761f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Technico-Commercial(e) - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commerciale-ouagadougou-309753', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commerciale-ouagadougou-309753', now(), 0, 0, '2026-06-25T12:12:10.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('862715d3ded07cd38f311627e51867a24e7c501f8c462fee9a6e20befc874511', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Expert(e) en Développement et Maintenance de Systèmes Applicatifs - International', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/experte-developpement-maintenance-systemes-applicatifs-international', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/experte-developpement-maintenance-systemes-applicatifs-international', now(), 0, 0, '2026-06-25T12:12:08.013Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0776b5b3f62c486b0537ea1dbfc7055e04d3c459980a0c26dce2e5399ac4530b', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Expert(e) en Développement d’Applications Mobiles et Solutions Digital - International', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/experte-developpement-applications-mobiles-solutions-digital-international', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/experte-developpement-applications-mobiles-solutions-digital-international', now(), 0, 0, '2026-06-25T12:12:08.013Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2e5338a5f95eba4c6cc00ef4b7c9326e8eedddad69e6b04f7dd31b638deb6147', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'DevOps Engineer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/devops-engineer-mf-210714', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/devops-engineer-mf-210714', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('19031402c2390b9a63d8a1dd78557b815221a98bd7ca6bb412172dec7ba099af', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'DOTNET Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/dotnet-developer-mf-210715', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/dotnet-developer-mf-210715', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a05e5a891e33944a144e4cf1b21c5685ec31bdd506cf8b98ccbb0316ef03b911', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'IOS Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/ios-developer-mf-210716', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/ios-developer-mf-210716', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0a43163e9a6392f42821344c3076a3cdbc22c221d1a81ff0694deff83ccb1923', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'JAVA Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/java-developer-mf-210717', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/java-developer-mf-210717', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fb00fb909032a5ebdae6f3c204852f7886a3934b5956a098cdf2056c2fa3ae84', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'JAVA JEE Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/java-jee-developer-mf-210718', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/java-jee-developer-mf-210718', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0e5937ec4aa7b20665ae2f936cf3bc0cca6e7f5067e408e696fa7215102f88fb', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'JAVASCRIPT Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/javascript-developer-mf-210719', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/javascript-developer-mf-210719', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0621f1afd104c4a169f734b138a36a93bc55e4ae46683cb992fc665f436fdd8f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'KOTLIN Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/kotlin-developer-mf-210720', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/kotlin-developer-mf-210720', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fc8c59dd2381bdff263acd64dd9163c9380786bb7e867e778573937d6bb8d555', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'LARAVEL Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/laravel-developer-mf-210721', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/laravel-developer-mf-210721', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4d5e96d30cc61ca625506d1426ef878f901a92b7d9c27ef7c5f8f154896edb24', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'NODE.JS Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/nodejs-developer-mf-210722', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/nodejs-developer-mf-210722', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0b4ff64a3c747dcdc7fc5697755ea59fd79fcf5bbecf61d801238d1179e79400', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'OBJECTIVE-C Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/objective-c-developer-mf-210723', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/objective-c-developer-mf-210723', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c0a8f72cc1357150f531220a4c0600b45f28323e1058f2e04d47acba24d7d311', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'PHP Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/php-developer-mf-210724', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/php-developer-mf-210724', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('36e6ed0a7483c15d61696682855b58541a92ab69a291a06a20ec4f4c42f8ec99', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'PYTHON Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/python-developer-mf-210725', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/python-developer-mf-210725', now(), 0, 0, '2026-06-25T12:12:08.014Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('19b76ba5e3778de75a1420f88ac38b4bc16a04c35efe5aff87d6119f60e4d78f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'QA Tester (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/qa-tester-mf-210726', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/qa-tester-mf-210726', now(), 0, 0, '2026-06-25T12:12:08.015Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('506c0ef813e01ab3d7de6a9425fad5b6d69ac333529d1ce8634e12721b3cd12f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'REACT Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/react-developer-mf-210727', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/react-developer-mf-210727', now(), 0, 0, '2026-06-25T12:12:08.015Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('557815ce9ccd1bc816ae43e5f95065f98a3a9cc4108a52d3dc1da43ee3dc15f9', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'RUBY ON RAILS Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/ruby-on-rails-developer-mf-210728', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/ruby-on-rails-developer-mf-210728', now(), 0, 0, '2026-06-25T12:12:08.015Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('182ac6601ce4da5ee328e0d54a66050ecf91c0a2fe6d1dd77587764d3bff05ec', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'SWIFT Developer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/swift-developer-mf-210729', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/swift-developer-mf-210729', now(), 0, 0, '2026-06-25T12:12:08.015Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('63bddfbc048200bbe4ad5f1e859270af5957c6869806fd997d8fc622a0042176', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Test and Validation Engineer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/test-validation-engineer-mf-210730', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/test-validation-engineer-mf-210730', now(), 0, 0, '2026-06-25T12:12:08.015Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4c30cad1631348cb6f182137f23215e195bc160997a5d809412f48433d123e4f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Test Automation Engineer (M/F)', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/test-automation-engineer-mf-210731', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/test-automation-engineer-mf-210731', now(), 0, 0, '2026-06-25T12:12:08.015Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9f68251cb2c9627a7e0922361419cacfefd7b0cb00e40167cee0724565511a7f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Commercial Terrain - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/commercial-terrain-ouagadougou-307336', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/commercial-terrain-ouagadougou-307336', now(), 0, 0, '2026-06-25T12:12:09.335Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a4dc16f4ae2989d24c217a4244ce0994cf90aa19c16fdede0604cc1041dbf715', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Chargé(e) d’Affaires - Sécurité Privée et Gardiennage - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-affaires-securite-privee-gardiennage-ouagadougou-307844', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-affaires-securite-privee-gardiennage-ouagadougou-307844', now(), 0, 0, '2026-06-25T12:12:09.336Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('829806673604fb369472ab2574e3431e642c4733b2ab996bc4af354c7f35d4a2', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Agent Commercial Indépendant (H/F) - Ouagadougou - Bobo Dioulasso', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/agent-commercial-independant-hf-ouagadougou-bobo-dioulasso-308129', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/agent-commercial-independant-hf-ouagadougou-bobo-dioulasso-308129', now(), 0, 0, '2026-06-25T12:12:09.336Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eaafa7f1a3c6cc27a8c3c750a3d240eda4c85fcca8c3abe47efe0019ade63f25', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Agent Commercial (H/F) - Bobo-Dioulasso, Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/agent-commercial-hf-bobo-dioulasso-ouagadougou-308283', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/agent-commercial-hf-bobo-dioulasso-ouagadougou-308283', now(), 0, 0, '2026-06-25T12:12:09.336Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eefbb4a38e74c1a1656efea3f489a422aba096fd0d491e6ed3af066834a2abb9', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Manoeuvre - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manoeuvre-ouagadougou-308457', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/manoeuvre-ouagadougou-308457', now(), 0, 0, '2026-06-25T12:12:09.336Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('54e7c3088a80c7fa2f534ae52d92778514569fd645f7986ede25497f50bebc9c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Commercial Terrain - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/commercial-terrain-ouagadougou-309368', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/commercial-terrain-ouagadougou-309368', now(), 0, 0, '2026-06-25T12:12:11.476Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d9cf7e4bdc720ebd427ace2674bbbe65ba7151804f68d361d9db857409067cf7', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Traducteur Professionel - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/traducteur-professionel-ouagadougou-308045', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/traducteur-professionel-ouagadougou-308045', now(), 0, 0, '2026-06-25T12:12:10.498Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d319d6c107ac43be537a9642a858c18ace522047226cac49da002ba9d4f5140d', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Stagiaire - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-ouagadougou-310777', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-ouagadougou-310777', now(), 0, 0, '2026-06-25T12:12:11.476Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4e662822b2230422a4637267cc90196d95194f9e61a598f61ec9e7fe3c35e3eb', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Journalier de Production H/F - International', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/journalier-production-hf-international-308443', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/journalier-production-hf-international-308443', now(), 0, 0, '2026-06-25T12:12:12.504Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8de77331074ab0be5913e108140e1d3f7022741914f4fa389a160299fc55ab8c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Mécanicien de Machinerie Agricole - International', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/mecanicien-machinerie-agricole-international-308873', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/mecanicien-machinerie-agricole-international-308873', now(), 0, 0, '2026-06-25T12:12:12.504Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2724eea9da977ac8bdff756aa34f04083b0aba149587713fff06bd624b264e2e', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Chauffeur(e) de Fardier - International', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chauffeure-fardier-international-308874', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chauffeure-fardier-international-308874', now(), 0, 0, '2026-06-25T12:12:12.504Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c8e436b1fa0949213201602ddf41ab3fa1752fdb4f944554cbb6fdd90e121e0c', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Comptable et Chargé(e) Administratif(ve) - Oiuagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/comptable-chargee-administratifve-oiuagadougou-309369', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/comptable-chargee-administratifve-oiuagadougou-309369', now(), 0, 0, '2026-06-25T12:12:13.518Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f76c279e37b6f9caf54570651d923075ea27c2f8919859b3b8870a737ce35c6f', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Chargé(e) des Finances et de L’Administration - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-finances-administration-ouagadougou-309643', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-finances-administration-ouagadougou-309643', now(), 0, 0, '2026-06-25T12:12:13.518Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3b3bd0704400510e5dab70d3776fe607a9a297fe1876dc3151945842cfb69720', 'emploiburkina', 'Emploiburkina', 'https://www.emploiburkina.com/', 'Comptable des Immobilisations et Rapprochements des Comptes Bancaires - Ouagadougou', 'Emploiburkina', 'Burkina Faso', null, null, null, false, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/comptable-immobilisations-rapprochements-comptes-bancaires-ouagadougou', 'A classer', 'needs_review', null, 'https://www.emploiburkina.com/offre-emploi-burkina-faso/comptable-immobilisations-rapprochements-comptes-bancaires-ouagadougou', now(), 0, 0, '2026-06-25T12:12:13.519Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0d0fccf51f00436830fcd616766e1e6193922e9212ebc9d572af4440cbad3fa8', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'MAG recrute 02 postes', 'HumanitaireHub', 'Senegal', '2026-06-30', null, '2026-06-30', false, 'https://humanitairehub.com/emploi/mag-recrute-02-postes/', 'A classer', 'needs_review', 'MAG recrute 02 postes - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion MAG recrute 02 postes ← Retour aux offres MAG (Mines Advisory Group) MAG recrute 02 postes 📍 Sénégal · 📄 CDD ⏰ Deadline 12 Juil 2026 J-17 📧 Postuler par email → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Sénégal Pays Sénégal Date de clôture Non précisée Organisation MAG MAG (Mines Advisory Group) est une organisation humanitaire internationale basée à Manchester, au Royaume-Uni, et opérant dans 32 pays. Nous enlevons les mines terrestres et les munitions non explosées pour libérer des terres et les rendre sûr', 'https://humanitairehub.com/emploi/mag-recrute-02-postes/', '2026-06-25T12:12:41.693Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('84e70b86e1444037669dcbae4f91db923d26918cedf5833db0d4cc1951328331', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'MAG recrute 02 postes', 'HumanitaireHub', 'Senegal', '2026-06-30', null, '2026-06-30', false, 'https://humanitairehub.com/emploi/mag-recrute-02-postes/', 'A classer', 'needs_review', 'MAG recrute 02 postes - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion MAG recrute 02 postes ← Retour aux offres MAG (Mines Advisory Group) MAG recrute 02 postes 📍 Sénégal · 📄 CDD ⏰ Deadline 12 Juil 2026 J-17 📧 Postuler par email → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Sénégal Pays Sénégal Date de clôture Non précisée Organisation MAG MAG (Mines Advisory Group) est une organisation humanitaire internationale basée à Manchester, au Royaume-Uni, et opérant dans 32 pays. Nous enlevons les mines terrestres et les munitions non explosées pour libérer des terres et les rendre sûr', 'https://humanitairehub.com/emploi/mag-recrute-02-postes/', '2026-06-25T12:12:42.288Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c06905e9d23b70c5ce1d0040dae9167aa4841a38f8a53c0d56fd3f075178e419', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant aux achats', 'HumanitaireHub', 'RDC', '2026-07-08', null, '2026-07-08', false, 'https://humanitairehub.com/emploi/assistant-aux-achats/', 'A classer', 'needs_review', 'Assistant aux achats - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant aux achats ← Retour aux offres PNUD / UNDP Assistant aux achats 📍 RDC · 📄 CDD ⏰ Deadline 08 Juil 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Logistique Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu RDC Pays RDC Date de clôture 08 juillet 2026 Organisation PNUD Mission et objectifs Le Programme des Nations unies pour le développement (PNUD) fait partie des programmes et fonds de l’ONU. Son rôle est d’aider les pays en développement en leur fournissant des conseils mais également en plaidant leurs causes pour l’octroi de dons. POSTE : A', 'https://humanitairehub.com/emploi/assistant-aux-achats/', '2026-06-25T12:12:42.891Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2b7ccd61ab7e99388c2f9305be8554cec4bb249252bac6a299130baba6f3c5e4', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant aux achats', 'HumanitaireHub', 'RDC', '2026-07-08', null, '2026-07-08', false, 'https://humanitairehub.com/emploi/assistant-aux-achats/', 'A classer', 'needs_review', 'Assistant aux achats - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant aux achats ← Retour aux offres PNUD / UNDP Assistant aux achats 📍 RDC · 📄 CDD ⏰ Deadline 08 Juil 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Logistique Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu RDC Pays RDC Date de clôture 08 juillet 2026 Organisation PNUD Mission et objectifs Le Programme des Nations unies pour le développement (PNUD) fait partie des programmes et fonds de l’ONU. Son rôle est d’aider les pays en développement en leur fournissant des conseils mais également en plaidant leurs causes pour l’octroi de dons. POSTE : A', 'https://humanitairehub.com/emploi/assistant-aux-achats/', '2026-06-25T12:12:43.499Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c0378ef37d2668a1837eb7de363937918e59949de3671b80588a6a3a9dfa0bfa', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Chargé(e) de projet principal(e) – Nutrition', 'HumanitaireHub', 'Nigeria', '2026-07-01', '2026-06-24', '2026-07-01', false, 'https://humanitairehub.com/emploi/chargee-de-projet-principale-nutrition/', 'A classer', 'needs_review', 'Chargé(e) de projet principal(e) - Nutrition - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Chargé(e) de projet principal(e) – Nutrition ← Retour aux offres Catholic Relief Services (CRS) Chargé(e) de projet principal(e) – Nutrition 📍 Nigeria · 📄 CDD ⏰ Deadline 01 Juil 2026 J-6 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Nutrition Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Nigeria Pays Nigeria Date de clôture 01 juillet 2026 Organisation CRS Catholic Relief Services est l’agence humanitaire internationale officielle de la communauté catholique aux États-Unis. Elle œuvre pour sauver, protéger et transformer des vies', 'https://humanitairehub.com/emploi/chargee-de-projet-principale-nutrition/', '2026-06-25T12:12:44.111Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('17f94d850fb05e969717ff6f7a5c12b54f65b9fc82a083b7541f316e7dade274', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Chargé(e) de projet principal(e) – Nutrition', 'HumanitaireHub', 'Nigeria', '2026-07-01', '2026-06-24', '2026-07-01', false, 'https://humanitairehub.com/emploi/chargee-de-projet-principale-nutrition/', 'A classer', 'needs_review', 'Chargé(e) de projet principal(e) - Nutrition - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Chargé(e) de projet principal(e) – Nutrition ← Retour aux offres Catholic Relief Services (CRS) Chargé(e) de projet principal(e) – Nutrition 📍 Nigeria · 📄 CDD ⏰ Deadline 01 Juil 2026 J-6 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Nutrition Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Nigeria Pays Nigeria Date de clôture 01 juillet 2026 Organisation CRS Catholic Relief Services est l’agence humanitaire internationale officielle de la communauté catholique aux États-Unis. Elle œuvre pour sauver, protéger et transformer des vies', 'https://humanitairehub.com/emploi/chargee-de-projet-principale-nutrition/', '2026-06-25T12:12:44.754Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b492e3fd6873206fa3c7545c5c8b98b4a56752c3a759e30367959094350f3a81', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant principal RH', 'HumanitaireHub', 'Dakar', '2026-07-08', null, '2026-07-08', false, 'https://humanitairehub.com/emploi/assistant-principal-rh/', 'A classer', 'needs_review', 'Assistant principal RH - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant principal RH ← Retour aux offres UNOPS Assistant principal RH 📍 Sénégal · 📄 CDD ⏰ Deadline 08 Juil 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Ressources Humaines Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Dakar, Sénégal Pays Sénégal Date de clôture 08 juillet 2026 Organisation UNOPS Intitulé du poste : Assistant principal RH Catégorie d’emploi : Ressources humaines Lieu(x) d’affectation : Dakar Niveau d’ancienneté : Niveau d’entrée Niveau ICS : ICS 05 Type de contrat : ICA – LICA – Support – Régulier Niveau du contrat : LICA 5 M', 'https://humanitairehub.com/emploi/assistant-principal-rh/', '2026-06-25T12:12:45.358Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('718a19b4ac53e50ed1145d48fc28f92166d423bb522805834ed66b136cf3a70e', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant principal RH', 'HumanitaireHub', 'Dakar', '2026-07-08', null, '2026-07-08', false, 'https://humanitairehub.com/emploi/assistant-principal-rh/', 'A classer', 'needs_review', 'Assistant principal RH - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant principal RH ← Retour aux offres UNOPS Assistant principal RH 📍 Sénégal · 📄 CDD ⏰ Deadline 08 Juil 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Ressources Humaines Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Dakar, Sénégal Pays Sénégal Date de clôture 08 juillet 2026 Organisation UNOPS Intitulé du poste : Assistant principal RH Catégorie d’emploi : Ressources humaines Lieu(x) d’affectation : Dakar Niveau d’ancienneté : Niveau d’entrée Niveau ICS : ICS 05 Type de contrat : ICA – LICA – Support – Régulier Niveau du contrat : LICA 5 M', 'https://humanitairehub.com/emploi/assistant-principal-rh/', '2026-06-25T12:12:45.970Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7b6784290245066f17848100104721ffd4b1fb615adf87c98bf9a4f2a53eaa90', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable MEAL – RCCE, Responsabilisation et Protection', 'HumanitaireHub', 'Bunia', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-meal-rcce-responsabilisation-et-protection/', 'A classer', 'needs_review', 'Responsable MEAL – RCCE, Responsabilisation et Protection - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable MEAL – RCCE, Responsabilisation et Protection ← Retour aux offres International Rescue Committee (IRC) Responsable MEAL – RCCE, Responsabilisation et Protection 📍 RD Congo · 📄 CDD ⏰ Deadline 12 Juil 2026 J-17 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale MEAL (Suivi, Évaluation, Apprentissage) Protection, Genre & Inclusion Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Bunia, RDC Pays RDC Date de clôture Non précisée Organisation IRC Le Comité international de secours (IRC) intervient lors des crises human', 'https://humanitairehub.com/emploi/responsable-meal-rcce-responsabilisation-et-protection/', '2026-06-25T12:12:46.584Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8a5d0664aa4b42369ea5c44f2094016e50d1412691edb8ccaf27c2eff04ed205', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable MEAL – RCCE, Responsabilisation et Protection', 'HumanitaireHub', 'Bunia', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-meal-rcce-responsabilisation-et-protection/', 'A classer', 'needs_review', 'Responsable MEAL – RCCE, Responsabilisation et Protection - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable MEAL – RCCE, Responsabilisation et Protection ← Retour aux offres International Rescue Committee (IRC) Responsable MEAL – RCCE, Responsabilisation et Protection 📍 RD Congo · 📄 CDD ⏰ Deadline 12 Juil 2026 J-17 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale MEAL (Suivi, Évaluation, Apprentissage) Protection, Genre & Inclusion Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Bunia, RDC Pays RDC Date de clôture Non précisée Organisation IRC Le Comité international de secours (IRC) intervient lors des crises human', 'https://humanitairehub.com/emploi/responsable-meal-rcce-responsabilisation-et-protection/', '2026-06-25T12:12:47.182Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c6c0378023c4123bbb6314b475db049dbb64403a58f6975baf1283e15ac4a52c', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable MEAL – IPC/WASH', 'HumanitaireHub', 'Bunia', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-meal-ipc-wash/', 'A classer', 'needs_review', 'Responsable MEAL – IPC/WASH - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable MEAL – IPC/WASH ← Retour aux offres International Rescue Committee (IRC) Responsable MEAL – IPC/WASH 📍 RDC · 📄 CDD ⏰ Deadline 12 Juil 2026 J-17 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale MEAL (Suivi, Évaluation, Apprentissage) Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Bunia, RDC Pays RDC Date de clôture Non précisée Organisation IRC Le Comité international de secours (IRC) intervient lors des crises humanitaires les plus graves au monde, contribuant à rétablir la santé, la sécurité, l’éducation, le bien-être économique et l’aut', 'https://humanitairehub.com/emploi/responsable-meal-ipc-wash/', '2026-06-25T12:12:47.800Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('17e347eec763f8bb22e5899eae28662a356fd3c1ee895311e2a5b37412687fd1', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable MEAL – IPC/WASH', 'HumanitaireHub', 'Bunia', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-meal-ipc-wash/', 'A classer', 'needs_review', 'Responsable MEAL – IPC/WASH - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable MEAL – IPC/WASH ← Retour aux offres International Rescue Committee (IRC) Responsable MEAL – IPC/WASH 📍 RDC · 📄 CDD ⏰ Deadline 12 Juil 2026 J-17 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale MEAL (Suivi, Évaluation, Apprentissage) Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Bunia, RDC Pays RDC Date de clôture Non précisée Organisation IRC Le Comité international de secours (IRC) intervient lors des crises humanitaires les plus graves au monde, contribuant à rétablir la santé, la sécurité, l’éducation, le bien-être économique et l’aut', 'https://humanitairehub.com/emploi/responsable-meal-ipc-wash/', '2026-06-25T12:12:48.405Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('525798f44295a124039ebabda9eaaecd19fa445f1410aa16f36ad67c810963b8', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant Administratif', 'HumanitaireHub', 'RDC', '2026-07-08', null, '2026-07-08', false, 'https://humanitairehub.com/emploi/assistant-administratif/', 'A classer', 'needs_review', 'Assistant Administratif - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant Administratif ← Retour aux offres PNUD / UNDP Assistant Administratif 📍 RDC · 📄 CDD ⏰ Deadline 08 Juil 2026 J-13 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Agence des Nations Unies Management & Coordination Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu RDC Pays RDC Date de clôture 08 juillet 2026 Organisation PNUD Le Programme des Nations unies pour le développement fait partie des programmes et fonds de l’ONU. Son rôle est d’aider les pays en développement en leur fournissant des conseils mais également en plaidant leurs causes pour l’octroi de dons. Descript', 'https://humanitairehub.com/emploi/assistant-administratif/', '2026-06-25T12:12:49.008Z', 0, 0, '2026-06-25T12:12:41.078Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('05930033f574ec846d38d98c20d7e4b239744ce157a9f063c9c3154eed51f256', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Assistant Administratif', 'HumanitaireHub', 'RDC', '2026-07-08', null, '2026-07-08', false, 'https://humanitairehub.com/emploi/assistant-administratif/', 'A classer', 'needs_review', 'Assistant Administratif - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant Administratif ← Retour aux offres PNUD / UNDP Assistant Administratif 📍 RDC · 📄 CDD ⏰ Deadline 08 Juil 2026 J-13 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Agence des Nations Unies Management & Coordination Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu RDC Pays RDC Date de clôture 08 juillet 2026 Organisation PNUD Le Programme des Nations unies pour le développement fait partie des programmes et fonds de l’ONU. Son rôle est d’aider les pays en développement en leur fournissant des conseils mais également en plaidant leurs causes pour l’octroi de dons. Descript', 'https://humanitairehub.com/emploi/assistant-administratif/', '2026-06-25T12:12:49.606Z', 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2e3bd7caf24996622c09beea467fb86685ac07c6d3f101ee16dea41befbfc9a4', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable du suivi et de l&rsquo;évaluation', 'HumanitaireHub', 'du poste', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-du-suivi-et-de-levaluation/', 'A classer', 'needs_review', 'Responsable du suivi et de l''évaluation - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable du suivi et de l&rsquo;évaluation ← Retour aux offres Family Health International (FHI360) Responsable du suivi et de l&rsquo;évaluation 📍 Sénégal · 📄 CDD ⏰ Deadline 06 Juil 2026 J-11 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale MEAL (Suivi, Évaluation, Apprentissage) Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Responsable du suivi et de l&rsquo;évaluation lieux : Sénégal (n&rsquo;importe lequel) type de temps : À temps plein publié le : Offre publiée il y a 2 jours temps restant pour postuler : Date de fin : 6 juillet 2026 numéro de demand', 'https://humanitairehub.com/emploi/responsable-du-suivi-et-de-levaluation/', '2026-06-25T12:12:50.217Z', 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3056ce69c495dce477353605c7bb4ffdbf9f58ee25708ee0693c81e208772df0', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Responsable du suivi et de l&rsquo;évaluation', 'HumanitaireHub', 'du poste', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-du-suivi-et-de-levaluation/', 'A classer', 'needs_review', 'Responsable du suivi et de l''évaluation - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable du suivi et de l&rsquo;évaluation ← Retour aux offres Family Health International (FHI360) Responsable du suivi et de l&rsquo;évaluation 📍 Sénégal · 📄 CDD ⏰ Deadline 06 Juil 2026 J-11 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale MEAL (Suivi, Évaluation, Apprentissage) Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Responsable du suivi et de l&rsquo;évaluation lieux : Sénégal (n&rsquo;importe lequel) type de temps : À temps plein publié le : Offre publiée il y a 2 jours temps restant pour postuler : Date de fin : 6 juillet 2026 numéro de demand', 'https://humanitairehub.com/emploi/responsable-du-suivi-et-de-levaluation/', '2026-06-25T12:12:50.819Z', 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b6253de6a6c35c56bdf00ae864ea883ff155a42593d584585481350519983a35', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'FHI 360 recrute 04 postes', 'HumanitaireHub', 'du Travail', null, '2026-07-02', null, false, 'https://humanitairehub.com/emploi/fhi-360-recrute-04-postes/', 'A classer', 'needs_review', 'FHI 360 recrute 04 postes - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion FHI 360 recrute 04 postes ← Retour aux offres Family Health International (FHI360) FHI 360 recrute 04 postes 📍 Burkina Faso · 📄 CDD ⏰ Deadline 02 Juil 2026 J-7 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale Santé Santé Mentale & Soutien Psychosocial Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : 04 Lieu du Travail : Burkina Faso Date de Soumission : 02/07/2026 Description de l’emploi Poste 1 : Agent de santé maternelle et infantile et de nutrition _ Tenkodogo lieux : Tenkodogo, Burkina Faso type de temps : À temps plein temps re', 'https://humanitairehub.com/emploi/fhi-360-recrute-04-postes/', '2026-06-25T12:12:51.421Z', 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('48bf71c7a40f8ae28f3142b64fc475049613353b6beae2619358802cf6374091', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'FHI 360 recrute 04 postes', 'HumanitaireHub', 'du Travail', null, '2026-07-02', null, false, 'https://humanitairehub.com/emploi/fhi-360-recrute-04-postes/', 'A classer', 'needs_review', 'FHI 360 recrute 04 postes - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion FHI 360 recrute 04 postes ← Retour aux offres Family Health International (FHI360) FHI 360 recrute 04 postes 📍 Burkina Faso · 📄 CDD ⏰ Deadline 02 Juil 2026 J-7 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale Santé Santé Mentale & Soutien Psychosocial Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : 04 Lieu du Travail : Burkina Faso Date de Soumission : 02/07/2026 Description de l’emploi Poste 1 : Agent de santé maternelle et infantile et de nutrition _ Tenkodogo lieux : Tenkodogo, Burkina Faso type de temps : À temps plein temps re', 'https://humanitairehub.com/emploi/fhi-360-recrute-04-postes/', '2026-06-25T12:12:52.023Z', 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d73091dd8989114c7cbe32bef12013b135e6200a1b86794b19d5201f64c8d449', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'UNICEF J-5 UNICEF recrute 09 stagiaires 📍 Niger 📋 Stage Plusieurs Secteurs', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/unicef-recrute-09-stagiaires/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/unicef-recrute-09-stagiaires/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('56a4515f26fbdcccad4387a7e4229afbf6703ca3063104bb8846893af3401005', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/unicef-recrute-09-stagiaires/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/unicef-recrute-09-stagiaires/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('71ce3f902f701306c8786f92fe36e3872f142af84f6199d6008c47f210185f44', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'ENABEL J-15 Expert.e en planification urbaine et territoriale 📍 RD Congo 📋 CDD Plusieurs Secteurs', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/expert-e-en-planification-urbaine-et-territoriale/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/expert-e-en-planification-urbaine-et-territoriale/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9e5108eaf3d3fe742b3cefd5df28127dda045b868167266a8386755165a11cf8', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/expert-e-en-planification-urbaine-et-territoriale/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/expert-e-en-planification-urbaine-et-territoriale/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0800cdf0f8c6e09d10a6ce4fc5d8a7580ba2c4442ca1232c8c0497346050bb80', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'ENABEL J-15 Expert.e en gouvernance minière HK &#038; L 📍 RD Congo 📋 CDD Gouvernance & Plaidoyer', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/expert-e-en-gouvernance-miniere-hk-l/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/expert-e-en-gouvernance-miniere-hk-l/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c64952afd758e5d63aea72b6962111b411670c65f2e812485ec58b26bf44c5d0', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/expert-e-en-gouvernance-miniere-hk-l/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/expert-e-en-gouvernance-miniere-hk-l/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('404a370639724180e860b22da400d0ff776323176c8487e446dbfd728358da52', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'ENABEL J-15 Coordonnateur.trice Logistique 📍 RD Congo 📋 CDD Logistique', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordonnateur-trice-logistique/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordonnateur-trice-logistique/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ad5068c2c394877624224366966909292e6c5d4b518e3615cc16a86b108294c', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/coordonnateur-trice-logistique/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/coordonnateur-trice-logistique/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f97dbaaef366a4951f03ffcd9d428c4a616f4e08d351881294b679d58869b2bf', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'AECF J-11 Responsable de portefeuille 📍 Bénin 📋 CDD Grants & Subventions', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-de-portefeuille/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-de-portefeuille/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9fdbd8d9d46024736de3c931ff6ae68697d65b6b706e5c9200ed99d3c5b707bf', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-de-portefeuille/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-de-portefeuille/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('002866013bdfbbf0a58f4e131bbbb5f1a1ecac249eda398b9ba39b6c820befbd', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'La Croix-Rouge espagnole (CRE) J-20 Chef de délégation 📍 RD Congo 📋 CDD Management & Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/chef-de-delegation/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/chef-de-delegation/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3a0bfd093f8b4cf6d9cca2de8d879979aa374716ac4ed281affbff14b214efae', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/chef-de-delegation/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/chef-de-delegation/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b5884e1724ffea73e77c5105f197b84e43206087562e26695c15e401bd312be0', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'FICR (Fédération Internationale Croix-Rouge) J-4 Officier, CEA/RCC 📍 RD Congo 📋 CDD Plusieurs Secteurs', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/officier-cea-rcc/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/officier-cea-rcc/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('15a31b12a7956da1019024c41119a0b80af2f237d792feadcb14946355adf078', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/officier-cea-rcc/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/officier-cea-rcc/', now(), 0, 0, '2026-06-25T12:12:41.079Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b547abd0815340fbe0ed765c4e41bf792e69043e18efdbd4492639d431ece8c3', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'World Vision J-13 Responsable principal de l&rsquo;HEA 📍 RD Congo 📋 CDD Abris & NFI Shelter WASH (Eau, Hygiène, Assainissement)', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-principal-de-lhea/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-principal-de-lhea/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a817194ec5a7518577bc4241aea552cf7c0473d76c919191a43bc75392a04749', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/responsable-principal-de-lhea/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/responsable-principal-de-lhea/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('363ceaac8ab9754e958ec6135fa40710e242d98219cf0850597a0a5567a2893d', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Family Health International (FHI360) J-14 Conseiller technique Polio 📍 RD Congo 📋 CDD Santé Santé Mentale & Soutien Psychosocial', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/conseiller-technique-polio/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/conseiller-technique-polio/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3bea376b2a7a69b680d1e72c6953948dadc07f31a06930596ec253af775e5348', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/conseiller-technique-polio/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/conseiller-technique-polio/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('434580f6bec3a80a23e845a694d3bef7e21ca2b9dd5188d01f96603560462654', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Danish Refugee Council (DRC) J-13 02 Chefs d&rsquo;équipe de protection 📍 Éthiopie 📋 CDD Protection, Genre & Inclusion', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/02-chefs-dequipe-de-protection/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/02-chefs-dequipe-de-protection/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('195c4aabaca368dabce8c3b0bcfd7363a313389449b031dd4d9d3b4dc410c6c4', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/02-chefs-dequipe-de-protection/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/02-chefs-dequipe-de-protection/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3783381f4f3ca92249b6b0fcd0af442d72c630cbd2f55b7e05d6b5b902ea5f30', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Médecins Sans Frontières (MSF) J-12 Psychiatre (H/F) 📍 Niger 📋 CDD Santé Mentale & Soutien Psychosocial', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/psychiatre-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/psychiatre-h-f/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('734ecfad8643f8e3c718969acededc5382c3c7f39e300f838b4b71303940da6e', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/psychiatre-h-f/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/psychiatre-h-f/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fc59232c5e67d82d6ca2ff69363af657e06f506545d70a3c8dcabca889c409f7', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'World Vision J-1 02 Opérateurs radio 📍 Niger 📋 CDD Logistique Sécurité', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/02-operateurs-radio/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/02-operateurs-radio/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('279e2f8ebf710070e6bdaf47f6335c7f94cb325c1dbab8f4d1de02ddcb59a498', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/02-operateurs-radio/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/02-operateurs-radio/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2cb7e0283dac9794e76265dd58bd4add2999344a48d14c87abe1e39d23f2cd24', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Concern Worldwide J-11 Contrôleur·se financier·ère national 📍 Centrafrique 📋 CDD Administration & Finance Management & Coordination Support', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/controleur%c2%b7se-financier%c2%b7ere-national/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/controleur%c2%b7se-financier%c2%b7ere-national/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9a65cee9a2cb4cee274d3c1b1497b8db6f90762576e9ba95911a36a2e02fc01a', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/controleur%c2%b7se-financier%c2%b7ere-national/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/controleur%c2%b7se-financier%c2%b7ere-national/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('352c07abbedea8ee4518d1e59418e01b22a6e3b57140e6d9b0f6d048d1009939', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'International Cocoa Initiative (ICI) J-17 Agent.es Techniques (AT) 📍 Cameroun 📋 CDD Protection, Genre & Inclusion', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/agent-es-techniques-at/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/agent-es-techniques-at/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e7a34e6316368ecd33d01316582101742a5ce69ba3f98155d5f83fc22c072002', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/agent-es-techniques-at/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/agent-es-techniques-at/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ab9a20539cb545028cd302ef8c527a2c426cf6b0bbeea3b4ed4c4150cb93ca8f', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'International Cocoa Initiative (ICI) J-17 Assistant.e Finance, Administration et Logistique 📍 Cameroun 📋 CDD Administration & Finance', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/assistant-e-finance-administration-et-logistique/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/assistant-e-finance-administration-et-logistique/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ff906fc78011bf95459bebcaa8893c456c20ae6158a73f36586e6dda9f442c49', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/assistant-e-finance-administration-et-logistique/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/assistant-e-finance-administration-et-logistique/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f88355cbea396d97fbfc4db3c15dda79bace76e72c7738731474357311c5dee8', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'PNUD / UNDP J-6 Associé de programme 📍 Mali 📋 CDD Administration & Finance Communication Coordination', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/associe-de-programme/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/associe-de-programme/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('283e2c7e3f8cea02c332fe6faf7f7834e01e58a4a10d08582326e484d93c283d', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Voir l''offre →', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/emploi/associe-de-programme/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/emploi/associe-de-programme/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a2f4aedfce618b03a7b746bc0571c179efc908d19615c42e2ce6c78e0e741c2f', 'humanitairehub', 'HumanitaireHub', 'https://humanitairehub.com/', 'Alertes emploi', 'HumanitaireHub', 'Burkina Faso', null, null, null, false, 'https://humanitairehub.com/alertes-emploi/', 'A classer', 'needs_review', null, 'https://humanitairehub.com/alertes-emploi/', now(), 0, 0, '2026-06-25T12:12:41.080Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('264d969ad1a3b64159dac205006d1b7787baa9017a493e25b4889c3357b32ad3', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Duty Stations | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/duty_stations', 'A classer', 'needs_review', 'Duty Stations | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Duty Stations Countries 6th of October City, Egypt (4) Abala, Ethiopia (12) Abidjan, Côte d''Ivoire (6) Abilene, TX (1) Abu Dhabi, United Arab Emirates (1) Abuja, Nigeria (28) Accra, Ghana (4) Addis Ababa, Ethiopia (60) Aden, Yemen (1) Agadir, Morocco (2) Agra, India (5) Ahmedabad, India (1) Al Genaina, Sudan (1) Al Hasakah, Syria (1) Albany, NY (1) Albemarle, NC (1) Alexandria, VA (8) Alofi, Niue (1) Altadena, California (2) Amman, Jordan (25) Amsterdam, Netherlands (24) Ankara, Turkey (7) Antananarivo, Madagascar (4) Apia, Samoa (3) Arequipa, Peru (1) Arlington, United States (29) Asheville, NC (1) Asunción, Paraguay (1) Athens, Greece (22) Atlanta, United States (4) Austin, Texas (10) Baghdad, Iraq (2) Baltimore, United States (2) Bamako, Mali (11) Bangalore, India (10) Bangkok, Thailand (9) Bangui', 'https://unjobs.org/duty_stations', '2026-06-16T09:30:24.601Z', 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d3a26523a1c4e5f61df157ea35a112e3f838026a35e3a4af5647e7ab4fd48c73', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Organizations I | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/organizations', 'A classer', 'needs_review', 'Organizations I | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Other organizations UN and Intergovernmental Organizations ADB - Asian Development Bank (23) AIIB - Asian Infrastructure Investment Bank (17) ASEAN - Association of Southeast Asian Nations (2) AU - African Union (1) Africa50 (8) Aga Khan Development Network (AKDN) (18) Bruegel (2) CABI (3) CTBTO - Preparatory Commission for the Comprehensive Nuclear-Test-Ban Treaty Organisation (2) Catholic Agency for Overseas Development (CAFOD) (4) Center for International Forestry Research (CIFOR) (1) DESA - Department of Economic and Social Affairs (11) DGACM - Department for General Assembly and Conference Management (2) DGC - Department of Global Communications (7) DMSPC - Department of Management Strategy, Policy and Compliance (6) DOS - Department of Operational Support (19) DPKO - Department of Peacekeepin', 'https://unjobs.org/organizations', '2026-06-16T09:30:26.033Z', 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('41a10de234c4f219d5481f851161661227adc16ae1e50c1a938ee0b7b5f88697', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'IRC Vacancy: Pédiatre Référent (HF), Ouahigouya, Burkina Faso | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1781558900820', 'A classer', 'needs_review', 'IRC Vacancy: Pédiatre Référent (HF), Ouahigouya, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Pédiatre Référent (HF), Ouahigouya, Burkina Faso Organization: International Rescue Committee (IRC) Country: Burkina Faso Field location: Ouahigouya Office: IRC in Ouahigouya The International Rescue Committee (IRC) responds to the world''s worst humanitarian crises, helping to restore health, safety, education, economic wellbeing, and power to people devastated by conflict and disaster. Founded in 1933 at the call of Albert Einstein, the IRC is one of the world''s largest international humanitarian non-governmental organizations (INGO), at work in more than 40 countries and 29 U.S. cities helping people to survive, reclaim control of their future and strengthen their communities. A force for humanity, IRC employees deliver lasting impact by restoring saf', 'https://unjobs.org/vacancies/1781558900820', '2026-06-16T09:30:27.418Z', 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('79d8ef589cfb71903d5a16bb480cedac01c261dbf912b8b533f55708910b888d', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'UNDP Vacancy: Midterm Review (MTR) of PONASI, Burkina Faso | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', '2026-06-19', null, '2026-06-19', false, 'https://unjobs.org/vacancies/1781018896687', 'A classer', 'needs_review', 'UNDP Vacancy: Midterm Review (MTR) of PONASI, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Midterm Review (MTR) of PONASI, Burkina Faso Organization: UNDP - United Nations Development Programme Country: Burkina Faso City: Ouagadougou Office: UNDP Ouagadougou Midterm Review (MTR) of PONASI Reference: UNDP-BFA-00707 Beneficiary countries or territories: Burkina Faso Registration level: Basic Published on: 05-Jun-2026 Deadline on: 19-Jun-2026 12:00 (GMT -4.00) Reference: UNDP-BFA-00707 Beneficiary countries or territories: Burkina Faso Registration level: Basic Published on: 05-Jun-2026 Deadline on: 19-Jun-2026 12:00 (GMT -4.00) Description Description of the Assignment: INTERNATIONAL CONSULTANT Period of assignment/services : JUNE 19th 2026 Proposal should be submitted directly in the portal no later than indicated deadline. Any request for clarif', 'https://unjobs.org/vacancies/1781018896687', '2026-06-16T09:30:29.051Z', 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bfb43784386913b48984a17811d4ddc89d6b4b09d130b77c3ccaaad6bc22ea6a', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'UNDP Vacancy: Recrutement d''un (e) Consultant(e) national(e) pour réaliser une Étude, Burkina Faso | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', '2026-06-15', null, '2026-06-15', false, 'https://unjobs.org/vacancies/1781019696952', 'A classer', 'needs_review', 'UNDP Vacancy: Recrutement d''un (e) Consultant(e) national(e) pour réaliser une Étude, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Recrutement d''un (e) Consultant(e) national(e) pour réaliser une Étude, Burkina Faso Organization: UNDP - United Nations Development Programme Country: Burkina Faso City: Ouagadougou Office: UNDP Ouagadougou Recrutement d''un (e) Consultant(e) national(e) pour realiser une &Eacute;tude Reference: UNDP-BFA-00702 Beneficiary countries or territories: Burkina Faso Registration level: Basic Published on: 04-Jun-2026 Deadline on: 15-Jun-2026 10:04 (GMT -4.00) Reference: UNDP-BFA-00702 Beneficiary countries or territories: Burkina Faso Registration level: Basic Published on: 04-Jun-2026 Deadline on: 15-Jun-2026 10:04 (GMT -4.00) Description Pays : BURKINA FASO Description de la mission : Recruter un (e) consultant(e) nation', 'https://unjobs.org/vacancies/1781019696952', '2026-06-16T09:30:30.249Z', 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4fbd12e1dcd7d953a10b54614a5abb9e6b4e5bcec2e276289cadc9f97d913aa2', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Vacancies in Ouagadougou, Burkina Faso | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, '2010-06-26', null, false, 'https://unjobs.org/duty_stations/oua', 'A classer', 'needs_review', 'Vacancies in Ouagadougou, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Vacancies in Ouagadougou, Burkina Faso &laquo; First < Prev 1 - 15 of 15 Next > Last &raquo; Midterm Review (MTR) of PONASI, Burkina Faso UNDP - United Nations Development Programme Updated: 2026-06-10T05:10:51Z Recrutement d''un (e) Consultant(e) national(e) pour réaliser une Étude, Burkina Faso UNDP - United Nations Development Programme Updated: 2026-06-10T04:57:28Z Recrutement de consultant national pour la revue à mis parcours du projet PONAS, Burkina Faso UNDP - United Nations Development Programme Updated: 2026-06-10T04:35:37Z Active organizations in Ouagadougou UNDP - United Nations Development Programme 3 IMPACT Initiatives 2 Malaria Consortium 2 Clinton Health Access Initiative (CHAI) 2 Norwegian Refugee Council (NRC) 1 SoCha 1 Pathfinder International 1 WeWorld Onlu', 'https://unjobs.org/duty_stations/oua', '2026-06-16T09:30:31.816Z', 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('18df458cebe7bc3d6f5628fbe9a0ee7f03073c56c83d525bea281046c54469bb', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Vacancies in Ouahigouya, Burkina Faso | UNjobs', 'UNjobs Burkina Faso', 'Burkina Faso', null, '2016-06-26', null, false, 'https://unjobs.org/field_locations/1558041948815', 'A classer', 'needs_review', 'Vacancies in Ouahigouya, Burkina Faso | UNjobs Toggle navigation Latest Duty Stations Organizations Closing Soon Vacancies in Ouahigouya, Burkina Faso &laquo; First < Prev 1 - 1 of 1 Next > Last &raquo; Ouahigouya, Burkina Faso All jobs in Burkina Faso Pédiatre Référent (HF), Ouahigouya Burkina International Rescue Committee (IRC) Updated: 2026-06-16T07:44:45Z &laquo; First < Prev 1 - 1 of 1 Next > Last &raquo; UNjobs Association of Geneva Not an official document of the United Nations Privacy Policy | Cookie Policy', 'https://unjobs.org/field_locations/1558041948815', '2026-06-16T09:30:33.354Z', 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('495a569248742f13609ac0fe90d9c29565840c56b8540dc631f30c292a0e9e7a', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'UNDP - United Nations Development Programme Ouagadougou 3', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/undp_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/undp_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2e218e5f01a0bfecf47e253acc3b73dd9f9e3441e758cec8d7804ead137a4353', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Malaria Consortium Ouagadougou 2', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/malaria-consortium_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/malaria-consortium_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('40cbccc3acf3ac771c9c65c9fc0997d387c05647fca8a863a5bf2162c8ab4576', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'IMPACT Initiatives Ouagadougou 2', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/impact-initiatives_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/impact-initiatives_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c6552983b2e4627e2a32b69e0222505ae311343d63bb7c9fad80057a649f3ccb', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'IRC Ouahigouya 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/theirc_1558041948815', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/theirc_1558041948815', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('65a58e116268ef243d38e261bcb833c42c60ff2bc1c8f6f273a93592c7e1680a', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'CHAI Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/chai_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/chai_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a496436aebd5ccb74ca04edbb08f194909d06d910edb0fe782b053c3b3e07e23', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Norwegian Refugee Council (NRC) Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/norwegian-refugee-council_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/norwegian-refugee-council_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('461ab5a2ef7824b68867fb8e8dd6e3c1dc90694df198ec61c72f8f1697ecde0c', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Clinton Health Access Initiative (CHAI) Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/chai_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/chai_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b1a6f7f1b83e5a006af9aacdabe2089a33b40eea26fb213364562310d4f253ae', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'SoCha Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/socha_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/socha_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('68a1c2a21a689571f61e47e3c24b822a505efa7e9807e3bb1f4d1082f46af876', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'WeWorld Onlus Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/weworld_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/weworld_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6a8738df6ed95243856c6bf46a8b15402bec1aacf648b523280ee377313a6726', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Médecins du Monde (MdM) Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/medecins-du-monde_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/medecins-du-monde_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('acefe0e57382efe8e02d1b817e558e16febfb33af92ce2079e62eef00413e8cc', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Pathfinder International Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/pathfinder-international_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/pathfinder-international_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('12892a9e41b05d349950d695bc90f4b2731cb1fa12e1c84fde8a5f5bc1a251a5', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Doctors with Africa CUAMM Ouagadougou 1', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/offices/cuamm_oua', 'A classer', 'needs_review', null, 'https://unjobs.org/offices/cuamm_oua', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1a34dc2c14c28967f8ea1892254af798e89e35fc69f9b2c91efcd6fbb94ef8a7', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Recrutement de consultant national pour la revue à mis parcours du projet PONAS, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1781020998548', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1781020998548', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ec15565942550a8cdaf9758b1576318732f8fae26495d661067005463059ef65', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'VacancyTitle: Finance Assistant, Location: Ouagadougou', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1780962167818', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1780962167818', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f09ac0407c51d7e1f2d9020aa46835004dfbc5936ad841a7ab88d0d958b3168e', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'VacancyTitle: Finance Assistant SMC, Location: Ouagadougou', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1780962160024', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1780962160024', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('74b09f4256c37d120d97dafbbf5fd33fa4964e1be24c3e38bbbcbae2a392d5a5', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Community Feedback Mechanism Technical Assistant, Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1780601628292', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1780601628292', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1d3824726dc2ca9a0ad0e95f875e9423cc5ca206b06e712f3e52776fafeb4fb8', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Communications and Marketing Specialist, Pathfinder Portuguese & English Countries', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1779895707052', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1779895707052', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('19ec09125a1ceb3f0c1929c45ac46474633ec0184a0f5fac16de716fbe8a40c6', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Enquêteurs / Chercheurs de terrain - Burkina Faso, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1779894488201', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1779894488201', now(), 0, 0, '2026-06-16T09:30:22.979Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('59a5a35810f09e569c01a419638e946d0e81061b52fb14125889b4a13d55327b', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Admin/Finance Officer | Burkina Faso , Regione del Centro Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1779654022705', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1779654022705', now(), 0, 0, '2026-06-16T09:30:22.980Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('06279499ce2abd4c21048281a9e03f1dad54944a8623f2e7d8ed48d680838a03', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Coordinateur administratif et logistique (F/H), Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1778710942800', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1778710942800', now(), 0, 0, '2026-06-16T09:30:22.980Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8ca230989b78c4ee84de7f02518f4063b8f607de49f008245280fd1d9d40f04f', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Head of Support Services Sahel, Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1778155544074', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1778155544074', now(), 0, 0, '2026-06-16T09:30:22.980Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('744244c607b65b07bb62f2b81b26918aa12e646d1a4f27a2b6c27191c3d47ccf', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Épidémiologiste, Analyste de Recherche, Malaria | Epidemiologist, Research Analyst, Paludisme, Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1777682361421', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1777682361421', now(), 0, 0, '2026-06-16T09:30:22.980Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4ee8e4f32dd143248b10d18f42b3bb3774f57a87b196dc4da0401a2da03c2c5a', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Associate, Malaria Case Management & Supply Chain Management, Ouagadougou, Burkina Faso', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1776387758986', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1776387758986', now(), 0, 0, '2026-06-16T09:30:22.980Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7ecf0afc4ca2d11885a7513d6e0292db868c8312d57ea40fcaa377930be2ec07', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Responsable de Recherche pour le Burkina Faso, Ouagadougou', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1775498982100', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1775498982100', now(), 0, 0, '2026-06-16T09:30:22.980Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('eafbdcd48ba853deb539586a1e768866796c85d1a2d01d5439695f39fc8390d3', 'unjobs-burkina', 'UNjobs Burkina Faso', 'https://unjobs.org/duty_stations/burkina-faso', 'Responsable de Recherche pour le Burkina Faso, Ouagadougou', 'UNjobs Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://unjobs.org/vacancies/1775498973018', 'A classer', 'needs_review', null, 'https://unjobs.org/vacancies/1775498973018', now(), 0, 0, '2026-06-16T09:30:22.980Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e53429d16fc49baee18bfc2a62437cd0ffa82e910f2ae7eb415e1fcbff2ac91e', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'MCH & Nutrition Officer - Kaya', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/mch-nutrition-officer-kaya', 'A classer', 'needs_review', '--> MCH & Nutrition Officer - Kaya - FHI 360 Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro MCH & Nutrition Officer - Kaya Support the implementation of maternal, neonatal, child health and nutrition activities. FHI 360 Open positions at FHI 360 Kaya ( Burkina Faso ) Show advice for this position Open application form Overview Support the implementation of maternal, neonatal, child health and nutrition activities. You have: Diplôme de Sage-femme/Maïeuticien d''État ou d''ingénieur en soins infirmiers et obstétricaux. Minimum 5 années d''expérience dans la mise en œuvre d''activités de santé maternelle, néonatale, infantile et/ou nutritionnelle. Expérience en supervision formative/mentorat et renforcement des capacités des prestataires de santé. Capacité à analyser et à interpréter des données, à identifier des erreurs et à préparer des rapports. Excellentes compétences e', 'https://untalent.org/jobs/mch-nutrition-officer-kaya', '2026-06-25T12:13:10.893Z', 0, 0, '2026-06-25T12:13:09.862Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fd43e5ef3433fca38a7f5d9d7d0ec115e23eb29aa2910b8338528e5f9a547ec7', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Every open position in the UN located in Burkina Faso', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'A classer', 'needs_review', '--> Every open position in the UN located in Burkina Faso Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Every open position in the UN located in Burkina Faso Get the new vacancies Receive the new vacancies for this search right into your inbox, every week. Get weekly alerts Save Hours on Job Hunting Stand out in the crowd and fast-track your dream role. Try Pro &rarr; FHI 360 MCH & Nutrition Officer - Kaya Kaya ( Burkina Faso ) Support the implementation of maternal, neonatal, child health and nutrition activities. More info Apply now UNICEF - United Nations Children''s Fund Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR Ouagadougou ( Burkina Faso ) Provide technical and operational support to SBC strategies for nutrition. 12 days left More info Apply now Partner --> Networking isn’t just for job seekers—it’s for future leaders', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', '2026-06-25T12:13:12.211Z', 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b3528878b2c98835fc5e107568039282478dc2db1732ee696dee29fa9fb29247', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'MCH & Nutrition Officer - Kaya', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/mch-nutrition-officer-kaya', 'A classer', 'needs_review', '--> MCH & Nutrition Officer - Kaya - FHI 360 Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro MCH & Nutrition Officer - Kaya Support the implementation of maternal, neonatal, child health and nutrition activities. FHI 360 Open positions at FHI 360 Kaya ( Burkina Faso ) Show advice for this position Open application form Overview Support the implementation of maternal, neonatal, child health and nutrition activities. You have: Diplôme de Sage-femme/Maïeuticien d''État ou d''ingénieur en soins infirmiers et obstétricaux. Minimum 5 années d''expérience dans la mise en œuvre d''activités de santé maternelle, néonatale, infantile et/ou nutritionnelle. Expérience en supervision formative/mentorat et renforcement des capacités des prestataires de santé. Capacité à analyser et à interpréter des données, à identifier des erreurs et à préparer des rapports. Excellentes compétences e', 'https://untalent.org/jobs/mch-nutrition-officer-kaya', '2026-06-25T12:13:13.309Z', 0, 0, '2026-06-25T12:13:09.862Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6770a405b737d36ec347f9f9bcb04efde09dc60207adc82049b0b62e0a5bcf64', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Welcome', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/mch-nutrition-officer-kaya/apply', 'A classer', 'needs_review', '--> Connection to the UN Talent platform Welcome Your personal email address We''ll send a connexion link to this email. Sign in Sign in with Google Sign in with Linkedin Pro membership Post a new job Post-Adjusted Purchasing Power On social Network Agencies, Offices and Departments Locations, cities and countries Contracts in the United Nations Internship positions Entry positions Mid positions Senior positions Consultant positions Volunteering positions Not an official document of the United Nations You can provide feedback or partnership requests with the contact form . This is an open project . Privacy Policy - Terms and Conditions - Cancellation Copyright &copy; 2026', 'https://untalent.org/jobs/mch-nutrition-officer-kaya/apply', '2026-06-25T12:13:14.354Z', 0, 0, '2026-06-25T12:13:09.862Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1c3528fbf5654a435ad43925f8e55d83415e48c894842446481eff3f48158329', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Every open position at UNICEF located in Burkina Faso', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs-at-unicef/in-anything/contract-all/burkina-faso', 'A classer', 'needs_review', '--> Every open position at UNICEF located in Burkina Faso Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Every open position at UNICEF located in Burkina Faso UNICEF - United Nations Children''s Fund Get the new vacancies Receive the new vacancies for this search right into your inbox, every week. Get weekly alerts Unlock the Next Level of Your Career Quest Seamless search, smarter applications, superior results. Activate Pro &rarr; UNICEF - United Nations Children''s Fund Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR Ouagadougou ( Burkina Faso ) Provide technical and operational support to SBC strategies for nutrition. 12 days left More info Apply now After this post, you will find only expired jobs. We recommend you to subscribe to our alerts to be informed when new jobs are available. Expired jobs are kept online so applicant', 'https://untalent.org/jobs-at-unicef/in-anything/contract-all/burkina-faso', '2026-06-25T12:13:15.868Z', 0, 0, '2026-06-25T12:13:08.535Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7630d6d3b7c4e346c3ba4df59da307e4bb06eaf703df688722d29c399295c4c4', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR', 'UN Talent Burkina Faso', 'où les carrières se construisent', null, null, null, false, 'https://untalent.org/jobs/social-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar', 'A classer', 'needs_review', '--> UNICEF - Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR Provide technical and operational support to SBC strategies for nutrition. UNICEF - United Nations Children''s Fund Open positions at UNICEF Ouagadougou ( Burkina Faso ) Show advice for this position Application deadline in 11 days : Monday 6 Jul 2026 at 23:55 UTC Open application form Overview Provide technical and operational support to SBC strategies for nutrition. You have: A university degree (Bachelor''s or higher) in social sciences, including sociology, anthropology, communication for development, psychology or related field. At least one (1) year of professional experience in one or more of the following areas: planning and implem', 'https://untalent.org/jobs/social-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar', '2026-06-25T12:13:16.962Z', 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('858997c5bcd3c1e52191682450cfdfb66abcd1e466a516fc50704f51a603c854', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Every open position in the UN located in Ouagadougou', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-all/ouagadougou', 'A classer', 'needs_review', '--> Every open position in the UN located in Ouagadougou Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Every open position in the UN located in Ouagadougou Get the new vacancies Receive the new vacancies for this search right into your inbox, every week. Get weekly alerts Propel Your Potential with UN Talent Pro Stand out in the crowd and fast-track your dream role. Start Pro &rarr; UNICEF - United Nations Children''s Fund Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR Ouagadougou ( Burkina Faso ) Provide technical and operational support to SBC strategies for nutrition. 12 days left More info Apply now NRC - Norwegian Refugee Council Stagiaire ICT Burkina Faso Ouagadougou Ouagadougou ( Burkina Faso ) Assist with ICT support at NRC office in Ouagadougou. Logistics & Procurement 7 days left More info Apply now Partner --> Discov', 'https://untalent.org/jobs/in-anything/contract-all/ouagadougou', '2026-06-25T12:13:18.351Z', 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6f12a11648ae5a65bd7c540b84cf4307f6bbae39b35b4129c3190ff2129b95cb', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR', 'UN Talent Burkina Faso', 'où les carrières se construisent', null, null, null, false, 'https://untalent.org/jobs/social-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar', 'A classer', 'needs_review', '--> UNICEF - Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR Provide technical and operational support to SBC strategies for nutrition. UNICEF - United Nations Children''s Fund Open positions at UNICEF Ouagadougou ( Burkina Faso ) Show advice for this position Application deadline in 11 days : Monday 6 Jul 2026 at 23:55 UTC Open application form Overview Provide technical and operational support to SBC strategies for nutrition. You have: A university degree (Bachelor''s or higher) in social sciences, including sociology, anthropology, communication for development, psychology or related field. At least one (1) year of professional experience in one or more of the following areas: planning and implem', 'https://untalent.org/jobs/social-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar', '2026-06-25T12:13:19.434Z', 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2439cfb94d73ef5a3726adf40e662e7e1d0092912616730cb2633cc533868042', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Welcome', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/social-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar/apply', 'A classer', 'needs_review', '--> Connection to the UN Talent platform Welcome Your personal email address We''ll send a connexion link to this email. Sign in Sign in with Google Sign in with Linkedin Pro membership Post a new job Post-Adjusted Purchasing Power On social Network Agencies, Offices and Departments Locations, cities and countries Contracts in the United Nations Internship positions Entry positions Mid positions Senior positions Consultant positions Volunteering positions Not an official document of the United Nations You can provide feedback or partnership requests with the contact form . This is an open project . Privacy Policy - Terms and Conditions - Cancellation Copyright &copy; 2026', 'https://untalent.org/jobs/social-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar/apply', '2026-06-25T12:13:21.083Z', 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('aaae5d4e63369ae5ca9da4d01ec77a47c283f223723b65657684f5ece87de7a0', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Every open position at NRC located in Burkina Faso', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs-at-nrc/in-anything/contract-all/burkina-faso', 'A classer', 'needs_review', '--> Every open position at NRC located in Burkina Faso Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Every open position at NRC located in Burkina Faso NRC - Norwegian Refugee Council Get the new vacancies Receive the new vacancies for this search right into your inbox, every week. Get weekly alerts The Ultimate Edge in UN Job Discovery Gain unparalleled insights and tools with Pro advantages. Try Pro &rarr; NRC - Norwegian Refugee Council Stagiaire ICT Burkina Faso Ouagadougou Ouagadougou ( Burkina Faso ) Assist with ICT support at NRC office in Ouagadougou. Logistics & Procurement 7 days left More info Apply now After this post, you will find only expired jobs. We recommend you to subscribe to our alerts to be informed when new jobs are available. Expired jobs are kept online so applicants can still have access to the job description when preparing for an intervie', 'https://untalent.org/jobs-at-nrc/in-anything/contract-all/burkina-faso', '2026-06-25T12:13:22.930Z', 0, 0, '2026-06-25T12:13:08.535Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cad6aa2c9348f495d27b54304689f81ae311c7d569e878675722449a98757716', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Stagiaire ICT Burkina Faso Ouagadougou', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/stagiaire-ict-burkina-faso-ouagadougou', 'A classer', 'needs_review', '--> NRC - Stagiaire ICT Burkina Faso Ouagadougou Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Stagiaire ICT Burkina Faso Ouagadougou Assist with ICT support at NRC office in Ouagadougou. NRC - Norwegian Refugee Council Open positions at NRC Ouagadougou ( Burkina Faso ) Logistics & Procurement Show advice for this position Application deadline in 6 days : Thursday 2 Jul 2026 at 00:00 UTC Open application form Overview Assist with ICT support at NRC office in Ouagadougou. You have: Have at least a BAC + 2 level in computer science or other IT qualifications. Proficiency in computer skills and data entry on Excel. Knowledge in development: Node.js / Express, Python (Flask / FastAPI), React / Typescript (frontend). Knowledge of modern development tools: GitHub, Docker, etc. Good knowledge of Windows systems, Microsoft Office, Cisco equipment, computer maintenance, and ', 'https://untalent.org/jobs/stagiaire-ict-burkina-faso-ouagadougou', '2026-06-25T12:13:24.015Z', 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('480167fbed527ab0216f4da0a246aed4f7caf47ca22d5b6b2158f766ec8135e7', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Every open position in the UN in Logistics & Procurement located in Burkina Faso', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-logistics-procurement/contract-all/burkina-faso', 'A classer', 'needs_review', '--> Every open position in the UN in Logistics & Procurement located in Burkina Faso Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Every open position in the UN in Logistics & Procurement located in Burkina Faso Get the new vacancies Receive the new vacancies for this search right into your inbox, every week. Get weekly alerts The Ultimate Edge in UN Job Discovery Stand out in the crowd and fast-track your dream role. Elevate Search &rarr; NRC - Norwegian Refugee Council Stagiaire ICT Burkina Faso Ouagadougou Ouagadougou ( Burkina Faso ) Assist with ICT support at NRC office in Ouagadougou. Logistics & Procurement 7 days left More info Apply now CHAI - Clinton Health Access Initiative Associate, Malaria Case Management & Supply Chain Management Ouagadougou ( Burkina Faso ) Contribute to CHAI''s malaria program in Burkina Faso focusing on case management and supply ch', 'https://untalent.org/jobs/in-logistics-procurement/contract-all/burkina-faso', '2026-06-25T12:13:25.391Z', 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('83e4a34f0bbfec7ff7fdb9adaf025e4dab25560024975c2a394274e4e82db5c5', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Stagiaire ICT Burkina Faso Ouagadougou', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/stagiaire-ict-burkina-faso-ouagadougou', 'A classer', 'needs_review', '--> NRC - Stagiaire ICT Burkina Faso Ouagadougou Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Stagiaire ICT Burkina Faso Ouagadougou Assist with ICT support at NRC office in Ouagadougou. NRC - Norwegian Refugee Council Open positions at NRC Ouagadougou ( Burkina Faso ) Logistics & Procurement Show advice for this position Application deadline in 6 days : Thursday 2 Jul 2026 at 00:00 UTC Open application form Overview Assist with ICT support at NRC office in Ouagadougou. You have: Have at least a BAC + 2 level in computer science or other IT qualifications. Proficiency in computer skills and data entry on Excel. Knowledge in development: Node.js / Express, Python (Flask / FastAPI), React / Typescript (frontend). Knowledge of modern development tools: GitHub, Docker, etc. Good knowledge of Windows systems, Microsoft Office, Cisco equipment, computer maintenance, and ', 'https://untalent.org/jobs/stagiaire-ict-burkina-faso-ouagadougou', '2026-06-25T12:13:26.451Z', 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f42d7756db388240a6fa4f192cbb6db3f6541bfa1a7a23ab54da4415acdd8acc', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Welcome', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/stagiaire-ict-burkina-faso-ouagadougou/apply', 'A classer', 'needs_review', '--> Connection to the UN Talent platform Welcome Your personal email address We''ll send a connexion link to this email. Sign in Sign in with Google Sign in with Linkedin Pro membership Post a new job Post-Adjusted Purchasing Power On social Network Agencies, Offices and Departments Locations, cities and countries Contracts in the United Nations Internship positions Entry positions Mid positions Senior positions Consultant positions Volunteering positions Not an official document of the United Nations You can provide feedback or partnership requests with the contact form . This is an open project . Privacy Policy - Terms and Conditions - Cancellation Copyright &copy; 2026', 'https://untalent.org/jobs/stagiaire-ict-burkina-faso-ouagadougou/apply', '2026-06-25T12:13:27.427Z', 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5968b421c5fbbf056dcd7c5a2af77d828248b715b33950234193f11323093130', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Every open position at Médecins du Monde located in Burkina Faso', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs-at-medecins-du-monde/in-anything/contract-all/burkina-faso', 'A classer', 'needs_review', '--> Every open position at Médecins du Monde located in Burkina Faso Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Every open position at Médecins du Monde located in Burkina Faso Médecins du Monde Get the new vacancies Receive the new vacancies for this search right into your inbox, every week. Get weekly alerts Unlock the Next Level of Your Career Quest Discover the power of UN Talent Pro and unlock opportunities like never before! Activate Pro &rarr; Médecins du Monde Coordinateur administratif et logistique (F/H) Ouagadougou ( Burkina Faso ) Join a humanitarian organization to coordinate administrative and logistics efforts in Burkina Faso. More info Apply now After this post, you will find only expired jobs. We recommend you to subscribe to our alerts to be informed when new jobs are available. Expired jobs are kept online so applicants can still have access to', 'https://untalent.org/jobs-at-medecins-du-monde/in-anything/contract-all/burkina-faso', '2026-06-25T12:13:28.614Z', 0, 0, '2026-06-25T12:13:08.529Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('97a216007de1ce9926c2ac275ac3edfc241efcde3e5d5c7d6afa2b7fb7c05371', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Coordinateur administratif et logistique (F/H)', 'UN Talent Burkina Faso', 'dans le courant des mois de mai et juin', null, null, null, false, 'https://untalent.org/jobs/coordinateur-administratif-et-logistique-f-h-1', 'A classer', 'needs_review', '--> Coordinateur administratif et logistique (F/H) - Médecins du Monde Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Coordinateur administratif et logistique (F/H) Join a humanitarian organization to coordinate administrative and logistics efforts in Burkina Faso. Médecins du Monde Open positions at Médecins du Monde Ouagadougou ( Burkina Faso ) Show advice for this position Open application form Overview Join a humanitarian organization to coordinate administrative and logistics efforts in Burkina Faso. You have: Vous avez une formation minimum Bac+4 en gestion, Administratif ou RH Vous disposez d''une expérience solide en solidarité internationale (au moins 4 ans), d''abord comme Administrateur(trice) et Logisticien(ne) base, puis en coordination RH (privilégiée) et/ou Logistique (idéalement) Vous avez une expérience réussie en gestion des ressources, idéalement en ', 'https://untalent.org/jobs/coordinateur-administratif-et-logistique-f-h-1', '2026-06-25T12:13:29.792Z', 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('01522d48c1863c3a18ae05502e9b608adc5246cfd40facc40af9d42512765417', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Coordinateur administratif et logistique (F/H)', 'UN Talent Burkina Faso', 'dans le courant des mois de mai et juin', null, null, null, false, 'https://untalent.org/jobs/coordinateur-administratif-et-logistique-f-h-1', 'A classer', 'needs_review', '--> Coordinateur administratif et logistique (F/H) - Médecins du Monde Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Coordinateur administratif et logistique (F/H) Join a humanitarian organization to coordinate administrative and logistics efforts in Burkina Faso. Médecins du Monde Open positions at Médecins du Monde Ouagadougou ( Burkina Faso ) Show advice for this position Open application form Overview Join a humanitarian organization to coordinate administrative and logistics efforts in Burkina Faso. You have: Vous avez une formation minimum Bac+4 en gestion, Administratif ou RH Vous disposez d''une expérience solide en solidarité internationale (au moins 4 ans), d''abord comme Administrateur(trice) et Logisticien(ne) base, puis en coordination RH (privilégiée) et/ou Logistique (idéalement) Vous avez une expérience réussie en gestion des ressources, idéalement en ', 'https://untalent.org/jobs/coordinateur-administratif-et-logistique-f-h-1', '2026-06-25T12:13:30.890Z', 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('44f2062b582b28d33f33473d78f817dcdd45ab0386289dfc027cb0bec171c890', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Welcome', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/coordinateur-administratif-et-logistique-f-h-1/apply', 'A classer', 'needs_review', '--> Connection to the UN Talent platform Welcome Your personal email address We''ll send a connexion link to this email. Sign in Sign in with Google Sign in with Linkedin Pro membership Post a new job Post-Adjusted Purchasing Power On social Network Agencies, Offices and Departments Locations, cities and countries Contracts in the United Nations Internship positions Entry positions Mid positions Senior positions Consultant positions Volunteering positions Not an official document of the United Nations You can provide feedback or partnership requests with the contact form . This is an open project . Privacy Policy - Terms and Conditions - Cancellation Copyright &copy; 2026', 'https://untalent.org/jobs/coordinateur-administratif-et-logistique-f-h-1/apply', '2026-06-25T12:13:31.894Z', 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('453c94d7ea93475ea8bb46699388bbf41dbfba0d66b1dc165d60e33fcc9b8aa5', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'CHAI - Clinton Health Access Initiative', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs-at-chai/in-anything/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs-at-chai/in-anything/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:08.530Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3dbe4702e7e05646f145f9b8f53f815576c661f046a9d50157f3e865cd6a997e', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', '&Eacute;pidemiologiste, Analyste de Recherche, Malaria | Epidemiologist, Research Analyst, Paludisme', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/eacute-pid-eacute-miologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-paludisme', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/eacute-pid-eacute-miologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-paludisme', now(), 0, 0, '2026-06-25T12:13:09.863Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9dde0be5622e3d3e5f27d767601453e19f6706045e29d23c5c031d4640f6d592', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/eacute-pid-eacute-miologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-paludisme', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/eacute-pid-eacute-miologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-paludisme', now(), 0, 0, '2026-06-25T12:13:09.864Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3d01ade5ad088e1a082b7540a5fd7b6f571cee4f737b6cb7daa0f3df09bbe60e', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/eacute-pid-eacute-miologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-paludisme/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/eacute-pid-eacute-miologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-paludisme/apply', now(), 0, 0, '2026-06-25T12:13:09.864Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('071f2c9764d71da9f2e3641a0f63aa9cb09d9628a56d607b16b4dbc1b2346061', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Associate, Malaria Case Management & Supply Chain Management', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/associate-malaria-case-management-supply-chain-management', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/associate-malaria-case-management-supply-chain-management', now(), 0, 0, '2026-06-25T12:13:09.864Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f0c8931c47df580df04efe16f5a5825dbb1dbb919ea9adaddbb41917a74e55a0', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/associate-malaria-case-management-supply-chain-management', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/associate-malaria-case-management-supply-chain-management', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b8dafd78cf476f26461792ff21a5ea7fa811ce52085c22a960ebb0f924c1b0e6', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/associate-malaria-case-management-supply-chain-management/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/associate-malaria-case-management-supply-chain-management/apply', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fc7357dc472913b8bb8cc29d36b55d4b471abef8fe7659cc2bea74d843ab1d59', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Clinicien - Kaya Regional Office', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/clinicien-kaya-regional-office', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/clinicien-kaya-regional-office', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2c88951395eb5f7330323d3425766b594c37f799ef0d42b67b7fe38eb7659535', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/clinicien-kaya-regional-office', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/clinicien-kaya-regional-office', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('24c14eb24fd491620bbcf2cabf679a3d75dc252761106255ab4b9af33dd292e6', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/clinicien-kaya-regional-office/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/clinicien-kaya-regional-office/apply', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('84c589dbc6ef5065dd106f761d0ab0eb99bd4d2a6b727539aedc246b63c13c39', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Community Feedback Mechanism Technical Assistant Burkina Faso Ouagadougou', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/community-feedback-mechanism-technical-assistant-burkina-faso-ouagadougou', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/community-feedback-mechanism-technical-assistant-burkina-faso-ouagadougou', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('46e08ae500cda6659f4709c73637320ebbf1ecb81df79483808fd331f70af438', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/community-feedback-mechanism-technical-assistant-burkina-faso-ouagadougou', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/community-feedback-mechanism-technical-assistant-burkina-faso-ouagadougou', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('45a8fb6fa22446d88961832bb3f489e849f6008f8a10090c0d0128a97d92a8b6', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/community-feedback-mechanism-technical-assistant-burkina-faso-ouagadougou/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/community-feedback-mechanism-technical-assistant-burkina-faso-ouagadougou/apply', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('14304f877bce8797d5be632b8021779293e9fc3b21d1df906f2dcd0027c08cca', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Readvertisement: Health Specialist (maternal, newborn &child health/HIV Aids), NO-3, Ouagadougou, Burkina Faso', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-2', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-2', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1fb917e46ee9b1400274492621fa91e33f8d2e17f5ee91544d0caf90fbbbe353', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Medical & Health', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-medical-health/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-medical-health/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2e3acb0d8b1d5240c9a65f33c871591aea09a83364864ade5b25a30bf31224c1', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-2', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-2', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b225c2c037855cb36c8b700cfd417086d6118469f1f2987f0096c17dc91b09b4', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-2/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-2/apply', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1ffcefc743ba243bad7dc4fe07326eb37193fb6cb7343fc45a219bd0d1ff77d8', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Clinician - Koudougou Regional Office', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/clinician-koudougou-regional-office', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/clinician-koudougou-regional-office', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9508d8068aea588809e91418f0a202920390bf49aeea095a984a90795439b63a', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/clinician-koudougou-regional-office', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/clinician-koudougou-regional-office', now(), 0, 0, '2026-06-25T12:13:09.865Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e532c1e5c30d342b3f7b368606423136ef069bfcdef68466251f2249757c0234', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/clinician-koudougou-regional-office/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/clinician-koudougou-regional-office/apply', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7178136f6f8d85f38b1801064f14f12747c9f6c52c8c39330165d4bd8e538f4d', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Plan International', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs-at-plan-international/in-anything/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs-at-plan-international/in-anything/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:08.532Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f8e877d357df8318a6c487be80a38413627e0302ad71195e9c7e19edc03186e9', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Chargé des Ressources Humaines', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-des-ressources-humaines-1', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-des-ressources-humaines-1', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('17fff7a65a30fa61964239a68c2bded525b780e067885509d293fd8db0de97d2', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-des-ressources-humaines-1', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-des-ressources-humaines-1', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a03d17f2655c347de9887ad028fce580479dbc28567f00ba7400d02ab6b27bdd', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-des-ressources-humaines-1/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-des-ressources-humaines-1/apply', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3b4000219066d3e66288e14502cf3960fb5e48540ded5c9ff3bb19fe0b298f49', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'DRC - Danish Refugee Council', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs-at-drc/in-anything/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs-at-drc/in-anything/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:08.535Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d86aecace8e7523770c01088b53f7bc1e9a7413d8f8a85c2f74f0f67c1bfe89d', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Stagiaire en Informatique', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/stagiaire-en-informatique-2', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/stagiaire-en-informatique-2', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fe1f503eb8de6d3e68b4b795bc58e9bb823278b7df0d76538acdbc810cbda2f7', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'IT & Telecom', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-it-telecom/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-it-telecom/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('edc96605d0408b95907c6fd1af17f877bf442293634fc2ef2338cf5991118c44', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/stagiaire-en-informatique-2', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/stagiaire-en-informatique-2', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('30e5a861f00a9890e9b65ee029824d2dcf9eda16a9800b47be29df5526e113d9', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/stagiaire-en-informatique-2/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/stagiaire-en-informatique-2/apply', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('feb47682f244f824dd1f704d4f310bf82dc8ec596af59b0e2facdd43097172f1', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Spécialiste de la Chaine d’Approvisionnement (Supply Chain Specialist)', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/specialiste-de-la-chaine-dapprovisionnement-supply-chain-specialist', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/specialiste-de-la-chaine-dapprovisionnement-supply-chain-specialist', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('33b3fbf785d0162bcd534edb814a424388e5101e7e6cffaf997503a59af18e84', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/specialiste-de-la-chaine-dapprovisionnement-supply-chain-specialist', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/specialiste-de-la-chaine-dapprovisionnement-supply-chain-specialist', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('426ece8a07f06ee023fd5c2b2daea5b0a90c2d0fa1a0db52f000310f0c2402d3', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/specialiste-de-la-chaine-dapprovisionnement-supply-chain-specialist/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/specialiste-de-la-chaine-dapprovisionnement-supply-chain-specialist/apply', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9960c496cbc02d97192ed53d89b28f4853dfb90b9beb96e7e8d9ec99c25c0244', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Internship – HACT (Innovative Programming Strategies), Ouagadougou, Burkina Faso, 3 months', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/internship-hact-innovative-programming-strategies-ouagadougou-burkina-faso-3-months', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/internship-hact-innovative-programming-strategies-ouagadougou-burkina-faso-3-months', now(), 0, 0, '2026-06-25T12:13:09.866Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c0434aa92dfadea800551c5378cd153f71b5d7a235848f9b11183c0ca0e9bf8f', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Internship', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-internship/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-anything/contract-internship/burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4de89f586e680447eb5f1d758db9f413c421a2a3d88ff56c52d1821dd6060621', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Monitoring & Evaluation', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-monitoring-evaluation/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-monitoring-evaluation/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b5ba8a9d036a2521ff21fb42054c323b6401f55072294c9470f6fb613ed8a410', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/internship-hact-innovative-programming-strategies-ouagadougou-burkina-faso-3-months', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/internship-hact-innovative-programming-strategies-ouagadougou-burkina-faso-3-months', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e7c74e0fa930e978e10c0411e30778b051d239c3eb0db232af2e90baf78f647c', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/internship-hact-innovative-programming-strategies-ouagadougou-burkina-faso-3-months/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/internship-hact-innovative-programming-strategies-ouagadougou-burkina-faso-3-months/apply', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bea4e5ee0200877e041553453ee95fd31f1dc9d486217a79bdb4aeb8e48697b4', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Area Manager Burkina Faso, Dori', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/area-manager-burkina-faso-dori-1', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/area-manager-burkina-faso-dori-1', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6b8a51b4ddd7d1aff53802c7ef4f9bf63ae3f7a73397fa88662b767c6efc493f', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Leadership', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-leadership/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-leadership/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('68db18b92d9849082129eb87b5936ab84d5c02b3e7ce14c8005bb9c62d8996e3', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/area-manager-burkina-faso-dori-1', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/area-manager-burkina-faso-dori-1', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7a976b20f941286b42aa720ab21aa8ac7fef322402008c60bb4881918adbcfba', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/area-manager-burkina-faso-dori-1/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/area-manager-burkina-faso-dori-1/apply', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('808109faf0179cc74f4f936da55729ef9dc05693399a221d4e84dcf9da4f05f0', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Education Officer Burkina Faso Kaya', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/education-officer-burkina-faso-kaya', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/education-officer-burkina-faso-kaya', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f694ddfc69c52df805606be340efb0ab174d3f67103c99a4a9d14e8514f0f675', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Teaching & Training', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-training/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-training/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('8f13fd12df8d598b508a79758db2f05e0bd2f373b1c71beaca347fd3b12851d9', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/education-officer-burkina-faso-kaya', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/education-officer-burkina-faso-kaya', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6f709c2d11fa26859b3cc2a94e531e8a4a78352d1e21d271f1f7641fb7c57889', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/education-officer-burkina-faso-kaya/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/education-officer-burkina-faso-kaya/apply', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f979c244352468e8b9d473ce34b27ac2278c63e1c6585bdd7a3630b786a6bc2a', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'CHARGE(E) DES FINANCES', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-e-des-finances', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-e-des-finances', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d65f15d519f7dabdb73f2e5146c29b86f1d37a2a6967cdb291bbfcdd7e88d613', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Finance & Economy', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-finance/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-finance/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('09199ff306761ddac541406a0301434d96506087b479135d6650de83defbb07f', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-e-des-finances', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-e-des-finances', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('98dc64cd82715898fbefc4a80de92b63cf1c3f06e0f519fb803acf464ddee94a', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-e-des-finances/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-e-des-finances/apply', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1ecbc9e806cf4ccbbb0529bf29f4302539741c0af285a67e54c376d35b893993', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'CHARGÉ(E) PRINCIPAL(E) DES ACHATS', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-e-principal-e-des-achats', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-e-principal-e-des-achats', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b87ef49aa71c678bf9e4c1b72f686e40a8d5aa92c882ad6ff6781ee59919230b', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-e-principal-e-des-achats', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-e-principal-e-des-achats', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f38c1c272cff26065582d7aae03160ce0a189cdce7d09e48a4a74ccbcf29d0e5', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-e-principal-e-des-achats/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-e-principal-e-des-achats/apply', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('14d5554bb3a4d00e27bf57b1e2aa21eb0adb160eda120e06b478269364bfe77e', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'ASSISTANT(E) FINANCIER(E)', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/assistant-e-financier-e-5', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/assistant-e-financier-e-5', now(), 0, 0, '2026-06-25T12:13:09.867Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b70c2ca45362872c2f79a483d12a96037e4b829f81a661f2a05fe2d9546b75ed', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/assistant-e-financier-e-5', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/assistant-e-financier-e-5', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d24dbd85998e19b8500be669999946cd5545de15ad3b2abd08c23e97379ce434', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/assistant-e-financier-e-5/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/assistant-e-financier-e-5/apply', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c0c97660709dab7681ceb47c955ec405fd3f2d3adcb8ed712bcdc4a1e7988ab5', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'ASSISTANT(E) FINANCIER(E)', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/assistant-e-financier-e-4', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/assistant-e-financier-e-4', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('963a8abdf6f3a552b4e5404cc7244ec679417e46f676cf38b8c5c1ea9fef5a08', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/assistant-e-financier-e-4', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/assistant-e-financier-e-4', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('c0e20f56206057f093a3c334b1d810787f9ab490198838cbef9bec76c00878ae', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/assistant-e-financier-e-4/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/assistant-e-financier-e-4/apply', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e6001fc8b5f6b238a7aa3d9e3126ade7722ec94c8be5a27dea6835066bd66c58', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Charg(é)e de la Chaine d’Approvisionnement (Supply Chain Officer)', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charg-e-e-de-la-chaine-dapprovisionnement-supply-chain-officer', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charg-e-e-de-la-chaine-dapprovisionnement-supply-chain-officer', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b30145fe48ea2b1d03222737a3ca8e34a45db50895d74507bb54c5c7a171a8ce', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charg-e-e-de-la-chaine-dapprovisionnement-supply-chain-officer', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charg-e-e-de-la-chaine-dapprovisionnement-supply-chain-officer', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e7117becab50758ddcba4e29b17943d40942cbdeae32ef3d627c04190d5601af', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charg-e-e-de-la-chaine-dapprovisionnement-supply-chain-officer/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charg-e-e-de-la-chaine-dapprovisionnement-supply-chain-officer/apply', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5dd00f80079b388563878a85f4bcf46f145973a5606f6290c70744fb6999a2ff', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Spécialiste en Santé Maternelle et Infantile et en Vaccination (MCH & Immunization Specialist)', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-immunization-specialist', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-immunization-specialist', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('190114119ffdf71b38a9c7216f435e4a37800233d5754a0c3ddb611194ad6063', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-immunization-specialist', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-immunization-specialist', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('47f253f37eb5b8239fe773b33b4efac7ceaa7957d17a73b50e52b2d66e3e5a62', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-immunization-specialist/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-immunization-specialist/apply', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('32732e4484ece45b03f8e67c21bf90869d8fa54b009b24cf6e8ec90ef6943380', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Chargé(e) Informatique (IT Officer) - Burkina Faso', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-e-informatique-it-officer-burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-e-informatique-it-officer-burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.868Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a13870d7100883a0aab58ef67f2a30725d3a94f523e673d72d5da9a8d57bdaea', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-e-informatique-it-officer-burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-e-informatique-it-officer-burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.869Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('016b1aa729af609c54a82b613a091475ac5bd3c07d11dba016c87fc1cdc6b8f4', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/charge-e-informatique-it-officer-burkina-faso/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/charge-e-informatique-it-officer-burkina-faso/apply', now(), 0, 0, '2026-06-25T12:13:09.869Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7885887a74c9be409bb1940202df137cda7d8fa60ea4afd2a0a3280b9eb8fd3e', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Responsable de projet multisectoriel', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/responsable-de-projet-multisectoriel', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/responsable-de-projet-multisectoriel', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('aeaa5f0f305ca5bacc03d1a766fcf39095d2156ba8ca49ca73ae4b7afb3e2212', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Programme & Policy', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-programme/contract-all/burkina-faso', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-programme/contract-all/burkina-faso', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7dfcb9da3ee154f4a9087e97ab687ae86f8ab815480ef7d9e9f043468071ab0d', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/responsable-de-projet-multisectoriel', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/responsable-de-projet-multisectoriel', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a6efef1e07e2fdfb10c30fcc5db1ec94df08dd9c3e6153b67d9dcc52a30c4dfa', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/responsable-de-projet-multisectoriel/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/responsable-de-projet-multisectoriel/apply', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0d5c6c5bba66db5361d6b4554990b3b35ef6a7d2d5dd854fb3cb8e867d80bcbb', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Readvertisement: Health Specialist (maternal, newborn &child health/HIV Aids), NO-3, Ouagadougou, Burkina Faso', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-1', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-1', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('71a7c9396128ff8c811a94952c3b99dcfd6873dbcb8f82717923f45d75a289eb', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-1', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-1', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4dcc4ea3479fe19535003bb9f5fe401b1ad9c1c82bc27fdbf256f67cbea0faf8', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-1/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/readvertisement-health-specialist-maternal-newborn-child-health-hiv-aids-no-3-ouagadougou-burkina-faso-1/apply', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3bdaa0c50d4ea5debc5a0fd326ebf8caa75fc2fdae509574f633a65937c58ad3', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Chief WASH, P-4, Ouagadougou, Burkina Faso, FT (Not for Burkinabe Nationals)', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/chief-wash-p-4-ouagadougou-burkina-faso-ft-not-for-burkinabe-nationals-1', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/chief-wash-p-4-ouagadougou-burkina-faso-ft-not-for-burkinabe-nationals-1', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6143a2134eb653fd16f4ea99b441872e9a28160d4e534b26588965049d3af3b0', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/chief-wash-p-4-ouagadougou-burkina-faso-ft-not-for-burkinabe-nationals-1', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/chief-wash-p-4-ouagadougou-burkina-faso-ft-not-for-burkinabe-nationals-1', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cc0de46fd597da87562cff8f4a640e7b1e047f1763c94d118b27f02b3c536f45', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/chief-wash-p-4-ouagadougou-burkina-faso-ft-not-for-burkinabe-nationals-1/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/chief-wash-p-4-ouagadougou-burkina-faso-ft-not-for-burkinabe-nationals-1/apply', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2fd66a8bddf2548d988f5a99520c3b63f28e7bc310b47d306fc62e6675cbf15d', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Deputy Project Director', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/deputy-project-director-8', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/deputy-project-director-8', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('fafda8f389ce42c7efeb9e6316d3ccd47f1e6cc0974d8d72da77bdf46f47a01a', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/deputy-project-director-8', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/deputy-project-director-8', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a97fd02bcd74eb86f451f09c87fa989dded8ce50292b50f5eb2ddc4e52e5c77c', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/deputy-project-director-8/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/deputy-project-director-8/apply', now(), 0, 0, '2026-06-25T12:13:09.870Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('b0e1551d5d20512d3fbc75dbbf4ba0250a1deaa557fe9d915674de78d99a9553', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Finance Intern Burkina Faso Ouagadougou', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/finance-intern-burkina-faso-ouagadougou-2', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/finance-intern-burkina-faso-ouagadougou-2', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6af5f9bf2b1ed5d1c1cc71304ef6ed1b8783cd3e13cda5a5935b43aaf41ef790', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/finance-intern-burkina-faso-ouagadougou-2', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/finance-intern-burkina-faso-ouagadougou-2', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5cdab3e0234c1d0060225f2253f49948f5e8de3fc24f6a095c8817e77a221114', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/finance-intern-burkina-faso-ouagadougou-2/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/finance-intern-burkina-faso-ouagadougou-2/apply', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('212647411fa0bc3da3c72fafd53f61ad5ce0b028068b25183883ad9f2af305b6', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Stagiaire en Finances', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/stagiaire-en-finances', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/stagiaire-en-finances', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('25c5bdb341047f88185b30130b99abcb514f1e5772105ecdd7c968ed8b036b38', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/stagiaire-en-finances', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/stagiaire-en-finances', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('88bfe4af6ac73c5e9380a72dab29e7a6bbb3804cec4a84690cea15aea1b8a3a2', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/stagiaire-en-finances/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/stagiaire-en-finances/apply', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a8068506bb69ee7a9e3ca33ab928450dd035f770bb9a79b6c362d82e92016df1', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'EpiC Project Director', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/epic-project-director', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/epic-project-director', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ba7f9ab0afe3f5eb0f30e508f31e152620505ce2339eeae4938d45e6385b827d', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'More info', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/epic-project-director', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/epic-project-director', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('aecd47019d8d0dbf681e2e62f5d40e74400e64bf196fb65d7a6fd3e9992d6305', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Apply now', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/epic-project-director/apply', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/epic-project-director/apply', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4c952a3677503a60a7415b7a2d8f4f602c51b8cc117dd2af0776ddd66b457641', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Go to page 2', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso?page=2', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso?page=2', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('0138bdaa2e46989f2579ae37edcf19aa75e473dc5eb27a67dadbbc39e524f327', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Agencies, Offices and Departments', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs-at', 'A classer', 'needs_review', null, 'https://untalent.org/jobs-at', now(), 0, 0, '2026-06-25T12:13:08.536Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4bc2e76a7251468903f07e6a3eb66745d1110be4e9bed61336a32fe0bf3f8a3d', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Internship positions', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-internship/anywhere', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-anything/contract-internship/anywhere', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('18806cfd4a8d4927f7de3fd8e9878d5cec8148feb61ee0ea7497f4a5fb65a87d', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Entry positions', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-entry/anywhere', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-anything/contract-entry/anywhere', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('01906d87c6cbb44236b56e93e3c86865f65613cee0b6bdb9cd8439f7b33e6384', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Mid positions', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-mid/anywhere', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-anything/contract-mid/anywhere', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('622de6627779f3d5239c26e6ab304c70ac1028dd79577d615cac99a5421cbd0a', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Senior positions', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-senior/anywhere', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-anything/contract-senior/anywhere', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5cb09befc25d733cac8569fa2227f4e687e0ad97d4b393a0062390bf05bdcf22', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Consultant positions', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-consulting/anywhere', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-anything/contract-consulting/anywhere', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('55c4b4ca64395d0c3b511d7fea306e17cae77e9e85869dc29b1676457cd1d517', 'un-talent-burkina', 'UN Talent Burkina Faso', 'https://untalent.org/jobs/in-anything/contract-all/burkina-faso', 'Volunteering positions', 'UN Talent Burkina Faso', 'Burkina Faso', null, null, null, false, 'https://untalent.org/jobs/in-anything/contract-volunteer/anywhere', 'A classer', 'needs_review', null, 'https://untalent.org/jobs/in-anything/contract-volunteer/anywhere', now(), 0, 0, '2026-06-25T12:13:09.871Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7d56d3d10a1a34006f2537c384448cfa649fba37620a74bd4c32fad200816352', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Offres d''emploi', 'LeFaso.net Recrutement', 'DU POSTE', null, null, null, false, 'https://emploi.lefaso.net/?page=offres', 'A classer', 'needs_review', 'Offres d''emploi - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière - Site d''annonces d''emploi Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous 854 offres d’emploi 01 Agent(e) de Bureau PUBLI&Eacute;E Décembre 2025 | DATE LIMITE LE 31 décembre 2025 | emploi | Ouagadougou Secteur d’activité : Mutualité sociale Secteurs d’activités additionnels : Santé et prestations sociales Spécialité concernée : Agent de soutien. Niveau du poste : cadre moyen. Nombre de poste : 01. Recruteur : Mutuelle des (…) 05 postes à pourvoir au sein d’une mutuelle nationale PUBLI&Eacute;E Décembre 2025 | DATE LIMITE LE 12 décembre 2025 | emploi | Ouagadougou POSTE A POURVOIR Un(e) Chef de Département des Prestations sociales et Assurance MISSIONS ET ACTIVITÉS DU POSTE Sous la responsabilité hiérarchique du Directeur Exécutif, le Chef ', 'https://emploi.lefaso.net/?page=offres', '2026-06-25T12:14:06.179Z', 0, 0, '2026-06-25T12:14:04.681Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('a1a020964ac32078c695b4f00150d524d2e1d8e4fe96c573c6f285b4114fbaa2', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Conseil du recruteur', 'LeFaso.net Recrutement', 'Burkina Faso', null, '2021-08-30', null, false, 'https://emploi.lefaso.net/-Conseil-du-recruteur-.html', 'A classer', 'needs_review', 'Conseil du recruteur - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Accueil > Conseil du recruteur Conseil du recruteur Avis de recrutement d’un(e) Coordonnateur(trice) de Projet 30 août 2021, par Pascal Yé TERMES DE REFERENCE I. CONTEXTE ET JUSTIFICATION L’Association Sos Santé et Développement Paalga (ASD Paalga) est une organisation non gouvernementale (ONG) créée en 1991, qui travaille dans les domaines de : la formation, l’appui conseil, La sécurité alimentaire l’insertion socioprofessionnelle des couches vulnérables, la santé communautaire et l’adaptation aux changements climatiques, la Participation citoyenne et la gouvernance locale, l’Alphabétisation et l’éducation non formelle (…) 6 conseils pour réussir vos entretiens de recrutement 16 novembre', 'https://emploi.lefaso.net/-Conseil-du-recruteur-.html', '2026-06-25T12:14:06.674Z', 0, 0, '2026-06-25T12:14:05.670Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e6e8d93f4f41489002ed66ac6b9779272e812405417ab3882137c8205e4cd3e4', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Les entreprises qui recrutent en ce moment', 'LeFaso.net Recrutement', 'Burkina Faso', null, '2016-10-14', null, false, 'https://emploi.lefaso.net/Les-entreprises-qui-recrutent-en-ce-moment.html', 'A classer', 'needs_review', 'Les entreprises qui recrutent en ce moment - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Accueil > Générale > Les entreprises qui recrutent en ce moment Les entreprises qui recrutent en ce moment vendredi 14 octobre 2016 UNFPA http://www.unfpa.org/jobs AFDB http://www.afdb.org/fr/ US Embassy https://ouagadougou.usembassy.gov/ GIZ https://www.giz.de/ CEDEAO http://www.ecowas.int/vacances-actuelles/?lang=fr Conseil du recruteur Avis de recrutement d’un(e) Coordonnateur(trice) de Projet TERMES DE REFERENCE I. CONTEXTE ET JUSTIFICATION L’Association Sos Santé et Développement Paalga (ASD Paalga) est une organisation non gouvernementale (ONG) créée en 1991, qui travaille dans (…) LEFASO.NET ● 6 conseils pour réussir vos entretiens de recrutement ● La recherch', 'https://emploi.lefaso.net/Les-entreprises-qui-recrutent-en-ce-moment.html', '2026-06-25T12:14:07.165Z', 0, 0, '2026-06-25T12:14:05.670Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7fce63993977d72365f6127902f50f13e0ac306049d986be8cb5400bba8d1b1b', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Nos partenaires', 'LeFaso.net Recrutement', 'Burkina Faso', null, '2016-10-01', null, false, 'https://emploi.lefaso.net/Nos-partenaires.html', 'A classer', 'needs_review', 'Nos partenaires - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Accueil > Générale > Nos partenaires Nos partenaires samedi 1er octobre 2016 International Development Law Organisation (IDLO) Conseil du recruteur Avis de recrutement d’un(e) Coordonnateur(trice) de Projet TERMES DE REFERENCE I. CONTEXTE ET JUSTIFICATION L’Association Sos Santé et Développement Paalga (ASD Paalga) est une organisation non gouvernementale (ONG) créée en 1991, qui travaille dans (…) LEFASO.NET ● 6 conseils pour réussir vos entretiens de recrutement ● La recherche d’emploi ? ● Comment négocier une augmentation ? ● 5 règles pour bien gérer son temps Vidéo Conseil Comment réussir son entretien d’embauche ? Les entreprises qui recrutent http://www.ecowas.int/vacances-actuelles/?lan', 'https://emploi.lefaso.net/Nos-partenaires.html', '2026-06-25T12:14:08.103Z', 0, 0, '2026-06-25T12:14:04.681Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('cede9ed4839cea1607c1b238172cfcc17f97078fcdc8ef44ba4a4512cacfb191', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Agent(e) de Bureau', 'Mutualité sociale', 'Ouagadougou', '2025-12-31', '2025-12-16', '2025-12-31', false, 'https://emploi.lefaso.net/01-Agent-e-de-Bureau.html', 'A classer', 'needs_review', '01 Agent(e) de Bureau - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Agent(e) de Bureau 01 Agent(e) de Bureau offre deposee 24 juin 2026 par Mutualité sociale Date de clôture de l’offre : 31 décembre 2025 Secteur d’activité : Mutualité sociale Secteurs d’activités additionnels : Santé et prestations sociales Spécialité concernée : Agent de soutien. Niveau du poste : cadre moyen. Nombre de poste : 01. Recruteur : Mutuelle des Agents des Finances (MUAFI). Structure bénéficiaire : Mutuelle des Agents des Finances (MUAFI). Type de contrat : Contrat à durée déterminée (CDD). Lieu d’affectation : Ouagadougou. Dans le cadre du renforcement de ses capacités administrativ', 'https://emploi.lefaso.net/01-Agent-e-de-Bureau.html', '2026-06-25T12:14:08.609Z', 0, 0, '2026-06-25T12:14:05.178Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4e5f2183c8b69fcd72ffea16d6a5350dbf85cedf814e0b8347c95fe54aaab6e8', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chef de mission', 'GREY', 'DU POSTE', '2025-11-03', '2025-11-03', '2025-11-03', false, 'https://emploi.lefaso.net/01-Chef-de-mission-et-controleurs-de-chantiers.html', 'A classer', 'needs_review', '01 Chef de mission - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chef de mission 01 Chef de mission offre deposee 24 juin 2026 par GREY Date de clôture de l’offre : 3 novembre 2025 Avis de recrutement pour les postes de chef de mission 1- INTITULE DU POSTE Chef de mission : un (01) 3- LIEU DU POSTE : Ouagadougou 4- MISSIONS PRINCIPALES : Chef de mission • Coordonner et superviser l’ensemble des activités de contrôle technique sur les chantiers. • Assurer la planification, la répartition et le suivi des missions des contrôleurs de travaux. • Garantir la conformité des travaux réalisés avec les normes, plans et cahiers de charges. • Élaborer les plans et devis est', 'https://emploi.lefaso.net/01-Chef-de-mission-et-controleurs-de-chantiers.html', '2026-06-25T12:14:09.100Z', 0, 0, '2026-06-25T12:14:05.178Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('488d0b7d2efa5785b742c5437207b83f05fda5a7f96e02066eea1332d7d74df6', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Dermatologue', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-24', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Dermatologue.html', 'A classer', 'needs_review', '01 Médecin Dermatologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Dermatologue 01 Médecin Dermatologue offre deposee 24 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Dermatologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat de', 'https://emploi.lefaso.net/01-Medecin-Dermatologue.html', '2026-06-25T12:14:09.584Z', 0, 0, '2026-06-25T12:14:05.178Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('2abcc1f5b90604f10fecf7d7eb481a07bea79fd482e7729452d36a948e094ade', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Chirurgien maxillo-facial', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-25', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Chirurgien-maxillo-facial.html', 'A classer', 'needs_review', '01 Médecin Chirurgien maxillo-facial - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Chirurgien maxillo-facial 01 Médecin Chirurgien maxillo-facial offre deposee 25 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Chirurgien maxillo-facial : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/', 'https://emploi.lefaso.net/01-Medecin-Chirurgien-maxillo-facial.html', '2026-06-25T12:14:10.083Z', 0, 0, '2026-06-25T12:14:05.178Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d81c08f166e46e37b7c060f846c8fb81d1c8bb67c76b06fb370f50b6fe31d0b6', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Pneumologue', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-25', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Pneumologue.html', 'A classer', 'needs_review', '01 Médecin Pneumologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Pneumologue 01 Médecin Pneumologue offre deposee 25 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Pneumologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat de la ', 'https://emploi.lefaso.net/01-Medecin-Pneumologue.html', '2026-06-25T12:14:10.585Z', 0, 0, '2026-06-25T12:14:05.179Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('d5e3434f0fea9c7d4e3fb0924bcaf7bc12508e707279355ef837a4d04f5deaa7', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Hématologue', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-25', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Hematologue.html', 'A classer', 'needs_review', '01 Médecin Hématologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Hématologue 01 Médecin Hématologue offre deposee 25 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Hématologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat de la ', 'https://emploi.lefaso.net/01-Medecin-Hematologue.html', '2026-06-25T12:14:11.082Z', 0, 0, '2026-06-25T12:14:05.179Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('4033dcedd93b49709cf8acafd716ae1942c4113a45fc7958af9dd5e22eeaf05b', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin ORL', 'Hôpital Saint Camille de Ouagadougou (HOSCO)', 'Burkina Faso', '2025-10-27', '2026-06-25', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-ORL.html', 'A classer', 'needs_review', '01 Médecin ORL - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin ORL 01 Médecin ORL offre deposee 25 juin 2026 par Hôpital Saint Camille de Ouagadougou (HOSCO) Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin ORL : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers sont recevables au secrétariat', 'https://emploi.lefaso.net/01-Medecin-ORL.html', '2026-06-25T12:14:11.580Z', 0, 0, '2026-06-25T12:14:05.179Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('85fd9c6a77e7aad5ae92d8d90d8b8206767a11f24b50a956a5630c209bd560e9', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Médecin Neurologue', 'Hôpital Saint Camille de Ouagadougou (HOSCO)', 'Burkina Faso', '2025-10-27', '2026-06-25', '2025-10-27', false, 'https://emploi.lefaso.net/01-Medecin-Neurologue.html', 'A classer', 'needs_review', '01 Médecin Neurologue - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Médecin Neurologue 01 Médecin Neurologue offre deposee 25 juin 2026 par Hôpital Saint Camille de Ouagadougou (HOSCO) Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Neurologue : 01 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être âgé de 50 ans au plus au 31/12/2025. Les dossiers so', 'https://emploi.lefaso.net/01-Medecin-Neurologue.html', '2026-06-25T12:14:12.068Z', 0, 0, '2026-06-25T12:14:05.179Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f9a3962e1ac5da02ed8d71c8340e6bc1eb834e88eb9e9427c92491a06e01c272', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chef du service communication', 'HAGE Matériaux', 'Burkina Faso', '2017-09-15', '2026-06-25', '2017-09-15', false, 'https://emploi.lefaso.net/01-Chef-du-service-communication.html', 'A classer', 'needs_review', '01 Chef du service communication - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chef du service communication 01 Chef du service communication offre deposee 25 juin 2026 par HAGE Matériaux Date de clôture de l’offre : 15 septembre 2017 Capacités liées à l’emploi avoir une maîtrise parfaite de l’expression écrite et orale/être immédiatement disponible/être doté d’un bon esprit d’analyse et de synthèse et d’une bonne capacité de gestion du stress/être créatif,curieux et avoir une ouverture d’esprit et le sens de l’écoute/être réactif et doté d’une bonne capacité d’organisation du travail/avoir un très bon niveau de culture générale et une excellente aptitude à la c', 'https://emploi.lefaso.net/01-Chef-du-service-communication.html', '2026-06-25T12:14:12.566Z', 0, 0, '2026-06-25T12:14:04.682Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f17ab841951b63ea811f939c079fd8cce5430cad6359e52685743d474e9eaa40', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chef de publicité', 'Une importante agence de Communication', 'Burkina Faso', '2017-09-14', '2026-06-24', '2017-09-14', false, 'https://emploi.lefaso.net/01-Chef-de-publicite.html', 'A classer', 'needs_review', '01 Chef de publicité - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chef de publicité 01 Chef de publicité offre deposee 24 juin 2026 par Une importante agence de Communication Date de clôture de l’offre : 14 septembre 2017 Capacités liées à l’emploi travail sous pression/très bonne capacité à organiser et gérer les priorités/et avoir un fort esprit d’initiative/être immédiatement disponible/autres Connaissance en informatique NP Condition d’âge NP Composition du dossier un CV détaillé/une lettre de motivation/une copie de la pièce d’identité/une copie des diplômes et des attestations diverses Procedure de recrutement Présélection sur dossier/entretien oral avec ', 'https://emploi.lefaso.net/01-Chef-de-publicite.html', '2026-06-25T12:14:13.065Z', 0, 0, '2026-06-25T12:14:04.682Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('593ef96a6c8dba4633b399c130a2c9ec02e0231ecdefe3abdf0dad9e51a573f1', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Pharmacien', 'Une Entreprise de distribution de matériel et équipements', 'Burkina Faso', '2017-08-29', '2026-06-24', '2017-08-29', false, 'https://emploi.lefaso.net/01-Pharmacien.html', 'A classer', 'needs_review', '01 Pharmacien - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Pharmacien 01 Pharmacien offre deposee 24 juin 2026 par Une Entreprise de distribution de matériel et équipements Date de clôture de l’offre : 29 août 2017 Capacités liées à l’emploi être inscrit sur le Tableau de l’Ordre des Pharmaciens du Burkina et en règle vis-à-vis de l’Ordre/aptitude à travailler sous pression/autres Connaissance en informatique NP Condition d’âge NP Diplôme ou niveau Doctorat Composition du dossier CV sincère et acutalisé daté et signé/lettre de motivation/photocopie légalisée du diplôme et des attestations de travail/Merci d’envoyer votre candidature à : dos_consultants@yahoo.fr', 'https://emploi.lefaso.net/01-Pharmacien.html', '2026-06-25T12:14:13.549Z', 0, 0, '2026-06-25T12:14:04.682Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ab48e2c72919fe404f373472504b422ed4f614ab042cd2b77cd353efd969377c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '01 Chargé de recouvrement', 'Une institution de la place', 'Burkina Faso', '2017-08-26', '2026-06-24', '2017-08-26', false, 'https://emploi.lefaso.net/01-Charge-de-recouvrement.html', 'A classer', 'needs_review', '01 Chargé de recouvrement - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 01 Chargé de recouvrement 01 Chargé de recouvrement offre deposee 24 juin 2026 par Une institution de la place Date de clôture de l’offre : 26 août 2017 Capacités liées à l’emploi diplôme reconnu par l’Etat Burkinabè ou un diplôme équivalent/avoir une capacité d’organisation,de rigueur,de flexibilité,d’anticipation de réactivité et une forte autonomie/avoir une capacité de communication aisée,de travail en équipe,d’analyse et de synthèse/être disponible et dynamique/être de bonne moralité/être de nationalité burkinabè/autres Connaissance en informatique Maîtriser le logiciel spécifique de recou', 'https://emploi.lefaso.net/01-Charge-de-recouvrement.html', '2026-06-25T12:14:14.049Z', 0, 0, '2026-06-25T12:14:04.682Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('1eccd425b51fa7a9a8080f5b6034b7f8aa956935cee07811964c8e9d05cbe805', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '02 Médecin Oncologues médical et chirurgical', 'HOSCO', 'Burkina Faso', '2025-10-27', '2026-06-24', '2025-10-27', false, 'https://emploi.lefaso.net/02-Medecin-Oncologues-medical-et-chirurgical.html', 'A classer', 'needs_review', '02 Médecin Oncologues médical et chirurgical - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 02 Médecin Oncologues médical et chirurgical 02 Médecin Oncologues médical et chirurgical offre deposee 24 juin 2026 par HOSCO Date de clôture de l’offre : 27 octobre 2025 L’Hôpital Saint Camille de Ouagadougou (HOSCO) recrute les profils ci-après : – Médecin Oncologues médical et chirurgical : 02 Date limite de dépôt des dossiers : 27 octobre 2025 Composition du dossier : – Une Demande manuscrite non timbrée adressée au Directeur Général de l’HOSCO ; – Une copie légalisée du diplôme ; – Un CV détaillé ; – Une copie de la CNIB ; – Être inscrit à l’Ordre professionnel ; – Être', 'https://emploi.lefaso.net/02-Medecin-Oncologues-medical-et-chirurgical.html', '2026-06-25T12:14:14.552Z', 0, 0, '2026-06-25T12:14:05.179Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('938d2113df7330a264c07438281f1fc339061e96c2c2c98171fa631bb14fe90c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '02 Chefs de mission ou chefs de projet', 'Cabinet YONS Associates', 'de dépôt', '2018-04-30', '2018-04-30', '2018-04-30', false, 'https://emploi.lefaso.net/02-Chefs-de-mission-ou-chefs-de-projet.html', 'A classer', 'needs_review', '02 Chefs de mission ou chefs de projet - Offres d''emploi, de stage et de formation - Emploi, Travail, Job, Carrière Toggle navigation Accueil Offres d''emploi Formations Conseils Entreprises Nos partenaires Contactez-nous Actualité LeFaso.net Conseil du recruteur Générale Vidéos Accueil > Actualité LeFaso.net > 02 Chefs de mission ou chefs de projet 02 Chefs de mission ou chefs de projet offre deposee 24 juin 2026 par Cabinet YONS Associates Date de clôture de l’offre : 30 avril 2018 Le cabinet Yons Associates recrute pour le compte d’une importante société basée à Kossodo les profils suivants : 02 Chefs de mission ou chefs de projet Qualifications, compétences et aptitudes – Etre titulaire d’un diplôme d’Ingénieur Génie Hydraulique, Génie Civil ou Génie Rural, – Justifier d’une expérience professionnelle de cinq (05) ans dans le domaine du BTP, Mission : assurer le pilotage, organisation', 'https://emploi.lefaso.net/02-Chefs-de-mission-ou-chefs-de-projet.html', '2026-06-25T12:14:15.051Z', 0, 0, '2026-06-25T12:14:04.682Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9074a05022ddb182e61ec7ca93e0d49afc4c1b572313181f86b435407a28cb12', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '02 Ingénieurs chargés d&#8217;affaires/Mines', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/02-Ingenieurs-charges-d-affaires-Mines.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/02-Ingenieurs-charges-d-affaires-Mines.html', now(), 0, 0, '2026-06-25T12:14:04.682Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('f69dcfb6d18b779ffe1212c219f723a12067babeecf3d16cddb05e8ba3d64f3a', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', now(), 0, 0, '2026-06-25T12:14:05.670Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('262cf87917b5317227eec7102f0130576671c8e696a6de23335848434a668b6a', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '6 conseils pour réussir vos entretiens de recrutement', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/6-conseils-pour-reussir-vos-entretiens-de-recrutement.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/6-conseils-pour-reussir-vos-entretiens-de-recrutement.html', now(), 0, 0, '2026-06-25T12:14:05.670Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('56c0c9800a8b0224254c6b1170a8a5a43cd3df682affe3837a0bd065373a967c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'La recherche d’emploi ?', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Comment-rechercher-efficacement-un-stage-ou-un-emploi.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Comment-rechercher-efficacement-un-stage-ou-un-emploi.html', now(), 0, 0, '2026-06-25T12:14:05.670Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('bac8b8a935d09327783b4e086125d12822c194e312ba0f2570baa623b514f998', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Comment négocier une augmentation ?', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Comment-negocier-une-augmentation.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Comment-negocier-une-augmentation.html', now(), 0, 0, '2026-06-25T12:14:05.670Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('53bcf2a79795e6ff7fd9e9257327f8647632cfb65aaf71e14d360ab80487b913', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '5 règles pour bien gérer son temps', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/5-regles-pour-bien-gerer-son-temps.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/5-regles-pour-bien-gerer-son-temps.html', now(), 0, 0, '2026-06-25T12:14:05.670Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6b6e08e25e0295e52becdec508a65984c12fa2c18dc4535d3d20ade0a81a010f', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Comment réussir son entretien d&#8217;embauche ?', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Comment-reussir-son-entretien-d-embauche.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Comment-reussir-son-entretien-d-embauche.html', now(), 0, 0, '2026-06-25T12:14:05.670Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('e92391135ffbce35be89f266e790a3a4be005ac9dd5678b7836f55c349c06fb2', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '05 postes à pourvoir au sein d’une mutuelle nationale', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/05-postes-a-pourvoir-au-sein-d-une-mutuelle-nationale.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/05-postes-a-pourvoir-au-sein-d-une-mutuelle-nationale.html', now(), 0, 0, '2026-06-25T12:14:05.178Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('ecdc4f021bb0a890c6f19ee3248d83786add5806abdb8b1ee5b98708253c9566', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', '04 contrôleurs de travaux', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/04-controleurs-de-travaux.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/04-controleurs-de-travaux.html', now(), 0, 0, '2026-06-25T12:14:05.178Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('3d61cd451760e983b559c9279427d3e8db2592d20b172c279a63994e1ac38304', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Médecins Oncologues médical et chirurgical', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/02-Medecins-Oncologues-medical-et-chirurgical.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/02-Medecins-Oncologues-medical-et-chirurgical.html', now(), 0, 0, '2026-06-25T12:14:05.178Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('9ae198949f892a0efc4a63ef655e6fe8f1c6e09f429efcc8d559caf1ca0f504c', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Trois (03) Stagiaires', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Trois-03-Stagiaires.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Trois-03-Stagiaires.html', now(), 0, 0, '2026-06-25T12:14:05.179Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('7af17c0f3b533d9f8d8f06a8b35c29ae4852b119d9c0b3eb9cfb6f14bce21708', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Un Economiste planificateur', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Un-Economiste-planificateur.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Un-Economiste-planificateur.html', now(), 0, 0, '2026-06-25T12:14:05.179Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('5c8a7a8d7c063d9ee921b0975e94ba00b4a2d05527bae62f25388ca70c84bd28', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Un ingénieur développeur', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/Un-ingenieur-developpeur.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/Un-ingenieur-developpeur.html', now(), 0, 0, '2026-06-25T12:14:05.179Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
  url = excluded.url,
  category = excluded.category,
  status = excluded.status,
  excerpt = excluded.excerpt,
  canonical_url = excluded.canonical_url,
  detail_extracted_at = excluded.detail_extracted_at,
  risk_score = excluded.risk_score,
  confidence_score = excluded.confidence_score,
  collected_at = excluded.collected_at;
insert into raw_items (id, source_id, source_name, source_url, title, company, city, deadline, opening_date, closing_date, inconsistent_dates, url, category, status, excerpt, canonical_url, detail_extracted_at, risk_score, confidence_score, collected_at)
values ('6bea351c96ff8158e441fbda40662fc5d29743d7a83e8eda5240db256c7c18bd', 'lefaso-recrutement', 'LeFaso.net Recrutement', 'https://emploi.lefaso.net/', 'Générale', 'LeFaso.net Recrutement', 'Burkina Faso', null, null, null, false, 'https://emploi.lefaso.net/-Generale-.html', 'A classer', 'needs_review', null, 'https://emploi.lefaso.net/-Generale-.html', now(), 0, 0, '2026-06-25T12:14:05.670Z')
on conflict (id) do update set
  title = excluded.title,
  company = excluded.company,
  city = excluded.city,
  deadline = excluded.deadline,
  opening_date = excluded.opening_date,
  closing_date = excluded.closing_date,
  inconsistent_dates = excluded.inconsistent_dates,
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
values ('37433124-28b1-4de8-8c44-ffb2cfbbbb92'::uuid, 'd323737c722c32b9a688f2fc7a0a3999ff23372513efe9e45fcb4339abdb4463', 'Volunteer Specialist', 'BFemploi', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', '2026-06-23', '2026-08-31', '31 août 2026', 'https://www.bfemploi.com/annonce-details-3882.html', 'https://www.bfemploi.com/annonce-details-3882.html', 'Volunteer Specialist - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concou', array['Bureau', 'Burkina Faso', 'BFemploi', 'concours']::text[], 92, 0, 'review', '2026-06-25T12:11:39.269Z', now())
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
values ('91aefe66-1c79-4f15-80e4-8721364b84b4'::uuid, '4a1ec186344a99a0fe4622a72b0da387d2849a7d6663710e71ce89b523e804c2', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'BTP et chantier', 'Mission', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commercial-climatisation-haut-gamme-ouagadougou-82601', null, array['BTP et chantier', 'Ouagadougou', 'Emploiburkina', 'climatisation', 'commercial']::text[], 44, 0, 'review', '2026-06-25T12:12:05.140Z', now())
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
values ('ce983000-743d-4121-8c01-481cdcb6c0cd'::uuid, '7b6784290245066f17848100104721ffd4b1fb615adf87c98bf9a4f2a53eaa90', 'Responsable MEAL – RCCE, Responsabilisation et Protection', 'HumanitaireHub', 'RDC', 'ONG', 'CDD', 'Non communique', null, '2026-07-12', '12 juillet 2026', 'https://humanitairehub.com/emploi/responsable-meal-rcce-responsabilisation-et-protection/', 'https://humanitairehub.com/emploi/responsable-meal-rcce-responsabilisation-et-protection/', 'Responsable MEAL – RCCE, Responsabilisation et Protection - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable MEAL – RCCE, Responsabilisation et Protection ← Retour aux offres International Rescue Committee (IRC) Responsable MEAL – RCCE, Responsabilisation et Protection 📍 RD Congo · 📄 CDD ⏰ Deadline 12 Juil 2026 J-17 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale MEAL (Suivi, Évaluation, Apprentissage) Protection, Genre & Inclusion Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Bunia, RDC Pays RDC Date de clôture Non précisée Organisation IRC Le Comité international de secours (IRC) intervient lors des crises human', array['ONG', 'RDC', 'HumanitaireHub', 'apprenti', 'ong', 'humanitaire', 'International']::text[], 92, 0, 'review', '2026-06-25T12:12:41.078Z', now())
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
values ('8bcc3b88-b82e-4794-8c6a-9dd3705e2109'::uuid, 'f69dcfb6d18b779ffe1212c219f723a12067babeecf3d16cddb05e8ba3d64f3a', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet', 'LeFaso.net Recrutement', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', null, null, 'A verifier', 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', 'https://emploi.lefaso.net/Avis-de-recrutement-d-un-e-Coordonnateur-trice-de-Projet.html', null, array['ONG', 'Burkina Faso', 'LeFaso.net Recrutement', 'projet']::text[], 44, 0, 'review', '2026-06-25T12:14:05.670Z', now())
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
values ('82157c0b-314e-429b-808a-be1cfb6e7f2b'::uuid, 'e53429d16fc49baee18bfc2a62437cd0ffa82e910f2ae7eb415e1fcbff2ac91e', 'MCH & Nutrition Officer - Kaya', 'UN Talent Burkina Faso', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/mch-nutrition-officer-kaya', 'https://untalent.org/jobs/mch-nutrition-officer-kaya', '--> MCH & Nutrition Officer - Kaya - FHI 360 Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro MCH & Nutrition Officer - Kaya Support the implementation of maternal, neonatal, child health and nutrition activities. FHI 360 Open positions at FHI 360 Kaya ( Burkina Faso ) Show advice for this position Open application form Overview Support the implementation of maternal, neonatal, child health and nutrition activities. You have: Diplôme de Sage-femme/Maïeuticien d''État ou d''ingénieur en soins infirmiers et obstétricaux. Minimum 5 années d''expérience dans la mise en œuvre d''activités de santé maternelle, néonatale, infantile et/ou nutritionnelle. Expérience en supervision formative/mentorat et renforcement des capacités des prestataires de santé. Capacité à analyser et à interpréter des données, à identifier des erreurs et à préparer des rapports. Excellentes compétences e', array['ONG', 'Burkina Faso', 'UN Talent Burkina Faso', 'officer', 'infirmier', 'sage-femme', 'sante', 'International']::text[], 74, 0, 'review', '2026-06-25T12:13:09.862Z', now())
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
values ('5fbf8cdc-efc7-4f8b-86ba-406a605e4734'::uuid, 'ec15565942550a8cdaf9758b1576318732f8fae26495d661067005463059ef65', 'VacancyTitle: Finance Assistant, Location: Ouagadougou', 'UNjobs Burkina Faso', 'Ouagadougou', 'Finance et administration', 'CDD', 'Non communique', null, null, 'A verifier', 'https://unjobs.org/vacancies/1780962167818', 'https://unjobs.org/vacancies/1780962167818', null, array['Finance et administration', 'Ouagadougou', 'UNjobs Burkina Faso', 'finance', 'assistant', 'International']::text[], 56, 0, 'review', '2026-06-16T09:30:22.979Z', now())
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
values ('593ea82e-2292-4568-8c01-ee8b6492db6d'::uuid, 'a8c215957c183ce487b40f2097393bea1adc9878e69ca349579b0b1235bd2dcb', 'Coordinateur Administratif et Logistique', 'BFemploi', 'dans le courant des mois de mai et juin', 'ONG', 'Mission', 'Non communique', '2026-05-18', '2026-08-17', '17 août 2026', 'https://www.bfemploi.com/annonce-details-3866.html', 'https://www.bfemploi.com/annonce-details-3866.html', 'Coordinateur Administratif et Logistique - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - G', array['ONG', 'dans le courant des mois de mai et juin', 'BFemploi', 'coordinateur', 'logistique', 'administratif', 'concours']::text[], 92, 0, 'review', '2026-06-25T12:11:39.270Z', now())
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
values ('6b06210f-2bd2-4b73-8f8a-fdd7322033c0'::uuid, 'dd07b60720e6a48b03e5f25fb941efa31fdc58338bc343c11ad3633f55d780af', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi', 'Emploiburkina', 'Bagassi', 'Transport et logistique', 'CDD', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/magazine-keeper-junior-magasinier-hf-bagassi-303948', null, array['Transport et logistique', 'Bagassi', 'Emploiburkina', 'magasinier']::text[], 44, 0, 'review', '2026-06-25T12:12:05.140Z', now())
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
values ('5839dfb8-8222-438e-84a1-60df33715444'::uuid, 'c6c0378023c4123bbb6314b475db049dbb64403a58f6975baf1283e15ac4a52c', 'Responsable MEAL – IPC/WASH', 'HumanitaireHub', 'RDC', 'Bureau', 'CDD', 'Non communique', null, '2026-07-12', '12 juillet 2026', 'https://humanitairehub.com/emploi/responsable-meal-ipc-wash/', 'https://humanitairehub.com/emploi/responsable-meal-ipc-wash/', 'Responsable MEAL – IPC/WASH - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable MEAL – IPC/WASH ← Retour aux offres International Rescue Committee (IRC) Responsable MEAL – IPC/WASH 📍 RDC · 📄 CDD ⏰ Deadline 12 Juil 2026 J-17 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale MEAL (Suivi, Évaluation, Apprentissage) Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Bunia, RDC Pays RDC Date de clôture Non précisée Organisation IRC Le Comité international de secours (IRC) intervient lors des crises humanitaires les plus graves au monde, contribuant à rétablir la santé, la sécurité, l’éducation, le bien-être économique et l’aut', array['Bureau', 'RDC', 'HumanitaireHub', 'apprenti', 'humanitaire', 'sante', 'International']::text[], 92, 0, 'review', '2026-06-25T12:12:41.078Z', now())
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
values ('c21bd8ea-6fdf-4b4c-8225-c3cf40a893f4'::uuid, 'e92391135ffbce35be89f266e790a3a4be005ac9dd5678b7836f55c349c06fb2', '05 postes à pourvoir au sein d’une mutuelle nationale', 'LeFaso.net Recrutement', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://emploi.lefaso.net/05-postes-a-pourvoir-au-sein-d-une-mutuelle-nationale.html', 'https://emploi.lefaso.net/05-postes-a-pourvoir-au-sein-d-une-mutuelle-nationale.html', null, array['Bureau', 'Burkina Faso', 'LeFaso.net Recrutement']::text[], 44, 0, 'review', '2026-06-25T12:14:05.178Z', now())
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
values ('e33a8bfc-1871-47fa-8ec7-180985cdef91'::uuid, '7630d6d3b7c4e346c3ba4df59da307e4bb06eaf703df688722d29c399295c4c4', 'Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR', 'UN Talent Burkina Faso', 'Ouagadougou', 'ONG', 'Mission', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/social-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar', 'https://untalent.org/jobs/social-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar', '--> UNICEF - Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Social & Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR Provide technical and operational support to SBC strategies for nutrition. UNICEF - United Nations Children''s Fund Open positions at UNICEF Ouagadougou ( Burkina Faso ) Show advice for this position Application deadline in 11 days : Monday 6 Jul 2026 at 23:55 UTC Open application form Overview Provide technical and operational support to SBC strategies for nutrition. You have: A university degree (Bachelor''s or higher) in social sciences, including sociology, anthropology, communication for development, psychology or related field. At least one (1) year of professional experience in one or more of the following areas: planning and implem', array['ONG', 'Ouagadougou', 'UN Talent Burkina Faso', 'officer', 'unicef', 'International']::text[], 74, 0, 'review', '2026-06-25T12:13:09.863Z', now())
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
values ('18ed0d21-7cf8-49e0-8441-e3a879f5cff2'::uuid, 'f09ac0407c51d7e1f2d9020aa46835004dfbc5936ad841a7ab88d0d958b3168e', 'VacancyTitle: Finance Assistant SMC, Location: Ouagadougou', 'UNjobs Burkina Faso', 'Ouagadougou', 'Finance et administration', 'CDD', 'Non communique', null, null, 'A verifier', 'https://unjobs.org/vacancies/1780962160024', 'https://unjobs.org/vacancies/1780962160024', null, array['Finance et administration', 'Ouagadougou', 'UNjobs Burkina Faso', 'finance', 'assistant', 'International']::text[], 56, 0, 'review', '2026-06-16T09:30:22.979Z', now())
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
values ('803b6637-9c48-44fc-86f6-99535a27d475'::uuid, '651e1ed0b1a3928a77801966d8defa7290a6859620f2ce23526f142a8f0162c7', 'Delegado/a de Salud, Agua y Saneamiento', 'BFemploi', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', '2026-06-24', '2026-07-12', '12 juillet 2026', 'https://www.bfemploi.com/annonce-details-3883.html', 'https://www.bfemploi.com/annonce-details-3883.html', 'Delegado/a de Salud, Agua y Saneamiento - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Gu', array['Bureau', 'Burkina Faso', 'BFemploi', 'concours']::text[], 92, 0, 'review', '2026-06-25T12:11:39.269Z', now())
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
values ('dcc41813-707b-4fe7-8d50-e2ac4989e7ce'::uuid, 'ff4e325a277b0f77d6d9cfbc043698d39d66756419c6c6bc518d379ecc85994f', 'Chargé(e) d’Opérations et Développement- Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-operations-developpement-ouagadougou-304191', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-operations-developpement-ouagadougou-304191', null, array['Bureau', 'Ouagadougou', 'Emploiburkina']::text[], 44, 0, 'review', '2026-06-25T12:12:05.141Z', now())
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
values ('e60f619f-f01c-4677-801b-8c16bd5e56a1'::uuid, 'c06905e9d23b70c5ce1d0040dae9167aa4841a38f8a53c0d56fd3f075178e419', 'Assistant aux achats', 'HumanitaireHub', 'RDC', 'Finance et administration', 'CDD', 'Non communique', null, '2026-07-08', '08 juillet 2026', 'https://humanitairehub.com/emploi/assistant-aux-achats/', 'https://humanitairehub.com/emploi/assistant-aux-achats/', 'Assistant aux achats - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant aux achats ← Retour aux offres PNUD / UNDP Assistant aux achats 📍 RDC · 📄 CDD ⏰ Deadline 08 Juil 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Logistique Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu RDC Pays RDC Date de clôture 08 juillet 2026 Organisation PNUD Mission et objectifs Le Programme des Nations unies pour le développement (PNUD) fait partie des programmes et fonds de l’ONU. Son rôle est d’aider les pays en développement en leur fournissant des conseils mais également en plaidant leurs causes pour l’octroi de dons. POSTE : A', array['Finance et administration', 'RDC', 'HumanitaireHub', 'humanitaire', 'programme', 'pnud', 'logistique', 'assistant']::text[], 92, 0, 'review', '2026-06-25T12:12:41.078Z', now())
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
values ('2dad774d-d2cf-4707-8e21-a459c18b5ec9'::uuid, '3d61cd451760e983b559c9279427d3e8db2592d20b172c279a63994e1ac38304', 'Médecins Oncologues médical et chirurgical', 'LeFaso.net Recrutement', 'Burkina Faso', 'Sante', 'CDD', 'Non communique', null, null, 'A verifier', 'https://emploi.lefaso.net/02-Medecins-Oncologues-medical-et-chirurgical.html', 'https://emploi.lefaso.net/02-Medecins-Oncologues-medical-et-chirurgical.html', null, array['Sante', 'Burkina Faso', 'LeFaso.net Recrutement', 'medecin', 'medical']::text[], 44, 0, 'review', '2026-06-25T12:14:05.178Z', now())
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
values ('a31e03b6-3e7a-4406-8416-779c8ed5a08f'::uuid, '97a216007de1ce9926c2ac275ac3edfc241efcde3e5d5c7d6afa2b7fb7c05371', 'Coordinateur administratif et logistique (F/H)', 'UN Talent Burkina Faso', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/coordinateur-administratif-et-logistique-f-h-1', 'https://untalent.org/jobs/coordinateur-administratif-et-logistique-f-h-1', '--> Coordinateur administratif et logistique (F/H) - Médecins du Monde Openings Mentoring Search Account Post a job Buy & Sell --> Get Pro Coordinateur administratif et logistique (F/H) Join a humanitarian organization to coordinate administrative and logistics efforts in Burkina Faso. Médecins du Monde Open positions at Médecins du Monde Ouagadougou ( Burkina Faso ) Show advice for this position Open application form Overview Join a humanitarian organization to coordinate administrative and logistics efforts in Burkina Faso. You have: Vous avez une formation minimum Bac+4 en gestion, Administratif ou RH Vous disposez d''une expérience solide en solidarité internationale (au moins 4 ans), d''abord comme Administrateur(trice) et Logisticien(ne) base, puis en coordination RH (privilégiée) et/ou Logistique (idéalement) Vous avez une expérience réussie en gestion des ressources, idéalement en', array['ONG', 'Burkina Faso', 'UN Talent Burkina Faso', 'coordinateur', 'logistique', 'administratif', 'medecin', 'International']::text[], 74, 0, 'review', '2026-06-25T12:13:09.863Z', now())
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
values ('6dd49ca0-b7bb-4788-8cb5-281604876f3d'::uuid, '1d3824726dc2ca9a0ad0e95f875e9423cc5ca206b06e712f3e52776fafeb4fb8', 'Communications and Marketing Specialist, Pathfinder Portuguese & English Countries', 'UNjobs Burkina Faso', 'Burkina Faso', 'Commerce et vente', 'CDD', 'Non communique', null, null, 'A verifier', 'https://unjobs.org/vacancies/1779895707052', 'https://unjobs.org/vacancies/1779895707052', null, array['Commerce et vente', 'Burkina Faso', 'UNjobs Burkina Faso', 'marketing', 'International']::text[], 56, 0, 'review', '2026-06-16T09:30:22.979Z', now())
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
values ('4b4b7a0d-feaf-4c43-88fc-307cc1c4ed0a'::uuid, 'ca4c8f74e88c3a2995a82a12d84afb847523ceffb8f9a8e2fc061b28680bf36a', 'Coordinateur·trice Financier·e', 'BFemploi', 'DU POSTE', 'ONG', 'CDD', 'Non communique', '2026-06-22', '2026-06-30', '30 juin 2026', 'https://www.bfemploi.com/annonce-details-3881.html', 'https://www.bfemploi.com/annonce-details-3881.html', 'Coordinateur·trice Financier·e - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Exam', array['ONG', 'DU POSTE', 'BFemploi', 'coordinateur', 'concours']::text[], 92, 0, 'review', '2026-06-25T12:11:39.269Z', now())
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
values ('f7afd8d9-3544-4eaf-8525-be4b9ad9b1c2'::uuid, '875ee4aaf7d176be6a3ed24b47d0020f8dc7e9c1480ae7f7df7065f2dd7723e4', 'Directeur Général / Enseignement Supérieur / Telecom- Ouaga', 'Emploiburkina', 'Ouagadougou', 'Informatique, data et systemes', 'CDD', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/directeur-general-enseignement-superieur-telecom-ouaga-304284', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/directeur-general-enseignement-superieur-telecom-ouaga-304284', null, array['Informatique, data et systemes', 'Ouagadougou', 'Emploiburkina', 'telecom']::text[], 44, 0, 'review', '2026-06-25T12:12:05.141Z', now())
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
values ('a21f84ba-49d1-4dc5-822b-031d27e5a439'::uuid, 'b492e3fd6873206fa3c7545c5c8b98b4a56752c3a759e30367959094350f3a81', 'Assistant principal RH', 'HumanitaireHub', 'Senegal', 'Finance et administration', 'CDD', 'Non communique', null, '2026-07-08', '08 juillet 2026', 'https://humanitairehub.com/emploi/assistant-principal-rh/', 'https://humanitairehub.com/emploi/assistant-principal-rh/', 'Assistant principal RH - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant principal RH ← Retour aux offres UNOPS Assistant principal RH 📍 Sénégal · 📄 CDD ⏰ Deadline 08 Juil 2026 J-13 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Agence des Nations Unies Ressources Humaines Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Dakar, Sénégal Pays Sénégal Date de clôture 08 juillet 2026 Organisation UNOPS Intitulé du poste : Assistant principal RH Catégorie d’emploi : Ressources humaines Lieu(x) d’affectation : Dakar Niveau d’ancienneté : Niveau d’entrée Niveau ICS : ICS 05 Type de contrat : ICA – LICA – Support – Régulier Niveau du contrat : LICA 5 M', array['Finance et administration', 'Senegal', 'HumanitaireHub', 'humanitaire', 'assistant', 'International']::text[], 92, 0, 'review', '2026-06-25T12:12:41.078Z', now())
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
values ('d623b9e8-4678-44e0-8c52-3240e3657558'::uuid, '453c94d7ea93475ea8bb46699388bbf41dbfba0d66b1dc165d60e33fcc9b8aa5', 'CHAI - Clinton Health Access Initiative', 'UN Talent Burkina Faso', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs-at-chai/in-anything/contract-all/burkina-faso', 'https://untalent.org/jobs-at-chai/in-anything/contract-all/burkina-faso', null, array['Bureau', 'Burkina Faso', 'UN Talent Burkina Faso', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:08.530Z', now())
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
values ('6b07b09a-8f62-43cb-8004-79fb421cb50b'::uuid, '5114bd3206f770cea9589ae9281ad2010314447a0fd584998f1f9d722af673b0', 'Responsable de Recherche', 'BFemploi', 'Ouagadougou', 'Bureau', 'A verifier', 'Non communique', '2026-06-04', '2026-06-30', '30 juin 2026', 'https://www.bfemploi.com/annonce-details-3871.html', 'https://www.bfemploi.com/annonce-details-3871.html', 'Responsable de Recherche - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Co', array['Bureau', 'Ouagadougou', 'BFemploi', 'concours']::text[], 92, 0, 'review', '2026-06-25T12:11:39.270Z', now())
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
values ('3760e2e8-5344-453a-8ccd-e78411701bcb'::uuid, '7b76d30016d0594cb40b39357c63b62a6aa46b71faebd85614bb044851ac1a77', 'Blastman H/F - Mogtedo et Boungou', 'Emploiburkina', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/blastman-hf-mogtedo-boungou-303949', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/blastman-hf-mogtedo-boungou-303949', null, array['Bureau', 'Burkina Faso', 'Emploiburkina']::text[], 44, 0, 'review', '2026-06-25T12:12:12.503Z', now())
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
values ('e15385ef-536e-4bcb-8bf5-66b5cab39585'::uuid, '525798f44295a124039ebabda9eaaecd19fa445f1410aa16f36ad67c810963b8', 'Assistant Administratif', 'HumanitaireHub', 'RDC', 'Finance et administration', 'CDD', 'Non communique', null, '2026-07-08', '08 juillet 2026', 'https://humanitairehub.com/emploi/assistant-administratif/', 'https://humanitairehub.com/emploi/assistant-administratif/', 'Assistant Administratif - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Assistant Administratif ← Retour aux offres PNUD / UNDP Assistant Administratif 📍 RDC · 📄 CDD ⏰ Deadline 08 Juil 2026 J-13 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Agence des Nations Unies Management & Coordination Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu RDC Pays RDC Date de clôture 08 juillet 2026 Organisation PNUD Le Programme des Nations unies pour le développement fait partie des programmes et fonds de l’ONU. Son rôle est d’aider les pays en développement en leur fournissant des conseils mais également en plaidant leurs causes pour l’octroi de dons. Descript', array['Finance et administration', 'RDC', 'HumanitaireHub', 'humanitaire', 'programme', 'pnud', 'administratif', 'assistant']::text[], 92, 0, 'review', '2026-06-25T12:12:41.078Z', now())
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
values ('5c8c4859-2341-4ae7-81bd-dd113d508dd3'::uuid, '3dbe4702e7e05646f145f9b8f53f815576c661f046a9d50157f3e865cd6a997e', '&Eacute;pidemiologiste, Analyste de Recherche, Malaria | Epidemiologist, Research Analyst, Paludisme', 'UN Talent Burkina Faso', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/eacute-pid-eacute-miologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-paludisme', 'https://untalent.org/jobs/eacute-pid-eacute-miologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-paludisme', null, array['Bureau', 'Burkina Faso', 'UN Talent Burkina Faso', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.863Z', now())
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
values ('8b269a20-a282-4152-8f4a-fc8f8cd09864'::uuid, 'ac8e8a256b510daa371cf72207a33bceea3a9c2e12142b2e5a3035a07c01d797', 'Enquêteurs / Chercheurs de terrain', 'BFemploi', 'Burkina Faso', 'Metiers terrain et informels', 'Mission', 'Non communique', '2026-06-03', '2026-06-26', '26 juin 2026', 'https://www.bfemploi.com/annonce-details-3870.html', 'https://www.bfemploi.com/annonce-details-3870.html', 'Enquêteurs / Chercheurs de terrain - BFemploi.com Connexion Login Candidat: Login Employeur/Recruteur: Inscription Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides Examens-Concours Newsletter Repertoires Ecoles de formation Entreprises Appels d''offre Contact Nous contacter Nous recommander Aide - FAQ Newsletter ☰ Les annonces Espace Candidats Espace Employeurs Publier une annonce Recherche Newsletter Les demandes Ressources Nous contacter Espace Candidats Les annonces Connexion Inscription Demande d''emploi Recherche Examens et concours Espace Employeurs Connexion Inscription Publier une annonce Recherche CV Mot de passe Les demandes Ressources Telechargements Liens utiles Infos - Guides', array['Metiers terrain et informels', 'Burkina Faso', 'BFemploi', 'terrain', 'concours']::text[], 92, 0, 'review', '2026-06-25T12:11:39.270Z', now())
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
values ('fabb3285-9cab-45a0-8e3b-5eaaab00cc5d'::uuid, '0095372865e4a46485e131dd3a8075d8433d53f3d30679f6b81a951bf23a262f', 'Stagiaire Secretaire Comptable (Stage de pré-emploi) - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Stage', 'Stage', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-secretaire-comptable-stage-pre-emploi-ouagadougou-304468', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-secretaire-comptable-stage-pre-emploi-ouagadougou-304468', null, array['Stage', 'Ouagadougou', 'Emploiburkina', 'stage', 'stagiaire', 'comptable', 'secretaire']::text[], 44, 0, 'review', '2026-06-25T12:12:13.518Z', now())
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
values ('b16c3442-8be8-4e55-8940-3eda994d8eb9'::uuid, '434580f6bec3a80a23e845a694d3bef7e21ca2b9dd5188d01f96603560462654', 'Danish Refugee Council (DRC) J-13 02 Chefs d&rsquo;équipe de protection 📍 Éthiopie 📋 CDD Protection, Genre & Inclusion', 'HumanitaireHub', 'Ethiopie', 'ONG', 'CDD', 'Non communique', null, '2026-07-08', '08 juillet 2026', 'https://humanitairehub.com/emploi/02-chefs-dequipe-de-protection/', 'https://humanitairehub.com/emploi/02-chefs-dequipe-de-protection/', null, array['ONG', 'Ethiopie', 'HumanitaireHub', 'drc', 'International']::text[], 74, 0, 'review', '2026-06-25T12:12:41.080Z', now())
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
values ('6be28f95-ccf4-4162-81fe-ac455a52d73a'::uuid, '071f2c9764d71da9f2e3641a0f63aa9cb09d9628a56d607b16b4dbc1b2346061', 'Associate, Malaria Case Management & Supply Chain Management', 'UN Talent Burkina Faso', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/associate-malaria-case-management-supply-chain-management', 'https://untalent.org/jobs/associate-malaria-case-management-supply-chain-management', null, array['Bureau', 'Burkina Faso', 'UN Talent Burkina Faso', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.864Z', now())
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
values ('331ae0f0-16f2-4d82-84e5-d3a24865b3a4'::uuid, '660226243552f26326b606e4c41469d56c75a7f124413bfb5992417a46d88905', 'Stagiaire Communication Marketing - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Stage', 'Stage', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-communication-marketing-ouagadougou-304706', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-communication-marketing-ouagadougou-304706', null, array['Stage', 'Ouagadougou', 'Emploiburkina', 'stagiaire', 'marketing']::text[], 44, 0, 'review', '2026-06-25T12:12:10.497Z', now())
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
values ('9a18230d-7e86-437b-8c1b-840093601199'::uuid, '2e3bd7caf24996622c09beea467fb86685ac07c6d3f101ee16dea41befbfc9a4', 'Responsable du suivi et de l&rsquo;évaluation', 'HumanitaireHub', 'Senegal', 'Bureau', 'CDD', 'Non communique', null, '2026-07-06', '06 juillet 2026', 'https://humanitairehub.com/emploi/responsable-du-suivi-et-de-levaluation/', 'https://humanitairehub.com/emploi/responsable-du-suivi-et-de-levaluation/', 'Responsable du suivi et de l''évaluation - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Responsable du suivi et de l&rsquo;évaluation ← Retour aux offres Family Health International (FHI360) Responsable du suivi et de l&rsquo;évaluation 📍 Sénégal · 📄 CDD ⏰ Deadline 06 Juil 2026 J-11 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale MEAL (Suivi, Évaluation, Apprentissage) Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Responsable du suivi et de l&rsquo;évaluation lieux : Sénégal (n&rsquo;importe lequel) type de temps : À temps plein publié le : Offre publiée il y a 2 jours temps restant pour postuler : Date de fin : 6 juillet 2026 numéro de demand', array['Bureau', 'Senegal', 'HumanitaireHub', 'apprenti', 'humanitaire', 'International']::text[], 92, 0, 'review', '2026-06-25T12:12:41.079Z', now())
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
values ('13d428ce-a288-4080-828c-ae19529de9ce'::uuid, 'fc7357dc472913b8bb8cc29d36b55d4b471abef8fe7659cc2bea74d843ab1d59', 'Clinicien - Kaya Regional Office', 'UN Talent Burkina Faso', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/clinicien-kaya-regional-office', 'https://untalent.org/jobs/clinicien-kaya-regional-office', null, array['Bureau', 'Burkina Faso', 'UN Talent Burkina Faso', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.865Z', now())
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
values ('9a3020c8-d408-4480-8eda-2df1ed1723fa'::uuid, 'b0427968629cb5e4ad2367eefcc65ffc88601faf590f64b7342965656114367d', 'Stagiaire en Infographie et Montage Vidéo - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Stage', 'Stage', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-infographie-montage-video-ouagadougou-304711', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-infographie-montage-video-ouagadougou-304711', null, array['Stage', 'Ouagadougou', 'Emploiburkina', 'stagiaire']::text[], 44, 0, 'review', '2026-06-25T12:12:10.497Z', now())
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
values ('e2e04c20-1e69-4100-82ab-d0cf5e79eb2f'::uuid, 'b6253de6a6c35c56bdf00ae864ea883ff155a42593d584585481350519983a35', 'FHI 360 recrute 04 postes', 'HumanitaireHub', 'Burkina Faso', 'Bureau', 'CDD', 'Non communique', '2026-07-02', '2026-07-02', '02 juillet 2026', 'https://humanitairehub.com/emploi/fhi-360-recrute-04-postes/', 'https://humanitairehub.com/emploi/fhi-360-recrute-04-postes/', 'FHI 360 recrute 04 postes - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion FHI 360 recrute 04 postes ← Retour aux offres Family Health International (FHI360) FHI 360 recrute 04 postes 📍 Burkina Faso · 📄 CDD ⏰ Deadline 02 Juil 2026 J-7 📨 Postuler maintenant → 📊 Expérience Intermédiaire (2-5 ans) 🏢 Type d''org Organisation Internationale Santé Santé Mentale & Soutien Psychosocial Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste Informations sur l’emploi Titre du Poste : 04 Lieu du Travail : Burkina Faso Date de Soumission : 02/07/2026 Description de l’emploi Poste 1 : Agent de santé maternelle et infantile et de nutrition _ Tenkodogo lieux : Tenkodogo, Burkina Faso type de temps : À temps plein temps re', array['Bureau', 'Burkina Faso', 'HumanitaireHub', 'humanitaire', 'sante', 'International']::text[], 100, 0, 'review', '2026-06-25T12:12:41.079Z', now())
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
values ('5d5136dc-f0ef-45be-8c32-5363fcd866ce'::uuid, '1ffcefc743ba243bad7dc4fe07326eb37193fb6cb7343fc45a219bd0d1ff77d8', 'Clinician - Koudougou Regional Office', 'UN Talent Burkina Faso', 'Koudougou', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/clinician-koudougou-regional-office', 'https://untalent.org/jobs/clinician-koudougou-regional-office', null, array['Bureau', 'Koudougou', 'UN Talent Burkina Faso', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.865Z', now())
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
values ('e63b8818-7b4d-4e16-8416-ecca7482d7dd'::uuid, '7530670d00298dadd8939b8c1b4c8913147344b176db853b60c782da5479e569', 'Stagiaire Ingénieur Technico-Commercial Électricité - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Stage', 'Stage', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-ingenieur-technico-commercial-electricite-ouagadougou-304722', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/stagiaire-ingenieur-technico-commercial-electricite-ouagadougou-304722', null, array['Stage', 'Ouagadougou', 'Emploiburkina', 'stagiaire', 'electricite', 'commercial']::text[], 44, 0, 'review', '2026-06-25T12:12:10.497Z', now())
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
values ('db107f89-ef5f-4c8d-88e6-839bc1d117dc'::uuid, 'c0378ef37d2668a1837eb7de363937918e59949de3671b80588a6a3a9dfa0bfa', 'Chargé(e) de projet principal(e) – Nutrition', 'HumanitaireHub', 'Niger', 'ONG', 'CDD', 'Non communique', '2026-06-24', '2026-07-01', '01 juillet 2026', 'https://humanitairehub.com/emploi/chargee-de-projet-principale-nutrition/', 'https://humanitairehub.com/emploi/chargee-de-projet-principale-nutrition/', 'Chargé(e) de projet principal(e) - Nutrition - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion Chargé(e) de projet principal(e) – Nutrition ← Retour aux offres Catholic Relief Services (CRS) Chargé(e) de projet principal(e) – Nutrition 📍 Nigeria · 📄 CDD ⏰ Deadline 01 Juil 2026 J-6 📨 Postuler maintenant → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Nutrition Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Nigeria Pays Nigeria Date de clôture 01 juillet 2026 Organisation CRS Catholic Relief Services est l’agence humanitaire internationale officielle de la communauté catholique aux États-Unis. Elle œuvre pour sauver, protéger et transformer des vies', array['ONG', 'Niger', 'HumanitaireHub', 'humanitaire', 'projet', 'International']::text[], 100, 0, 'review', '2026-06-25T12:12:41.078Z', now())
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
values ('b7f283bd-586f-4e71-8b18-00e230ec5a25'::uuid, 'f8e877d357df8318a6c487be80a38413627e0302ad71195e9c7e19edc03186e9', 'Chargé des Ressources Humaines', 'UN Talent Burkina Faso', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/charge-des-ressources-humaines-1', 'https://untalent.org/jobs/charge-des-ressources-humaines-1', null, array['Bureau', 'Burkina Faso', 'UN Talent Burkina Faso', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.866Z', now())
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
values ('0f8b7708-bc4e-4c5f-868b-2f3fce810111'::uuid, 'd6caa8f6cbeafd8cb358b544f1a6eab69dddf43db48b0d81e826615634af923f', 'Chauffeur Particulier - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Metiers terrain et informels', 'Mission', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chauffeur-particulier-ouagadougou-305080', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chauffeur-particulier-ouagadougou-305080', null, array['Metiers terrain et informels', 'Ouagadougou', 'Emploiburkina', 'chauffeur']::text[], 44, 0, 'review', '2026-06-25T12:12:11.476Z', now())
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
values ('c3e32117-f795-4585-8bb6-aebd76c05f62'::uuid, '0d0fccf51f00436830fcd616766e1e6193922e9212ebc9d572af4440cbad3fa8', 'MAG recrute 02 postes', 'HumanitaireHub', 'Senegal', 'Bureau', 'CDD', 'Non communique', null, '2026-06-30', '30 juin 2026', 'https://humanitairehub.com/emploi/mag-recrute-02-postes/', 'https://humanitairehub.com/emploi/mag-recrute-02-postes/', 'MAG recrute 02 postes - Humanitaire Hub Emplois Humanitaires Ressources Mon compte Aller au contenu Emplois Humanitaires Ressources Mon compte Ouvrir/fermer le menu Emplois Humanitaires Connexion MAG recrute 02 postes ← Retour aux offres MAG (Mines Advisory Group) MAG recrute 02 postes 📍 Sénégal · 📄 CDD ⏰ Deadline 12 Juil 2026 J-17 📧 Postuler par email → 📊 Expérience Confirmé (5-8 ans) 🏢 Type d''org Organisation Internationale Plusieurs Secteurs Partager : 💼 LinkedIn 𝕏 Twitter 📘 Facebook 💬 WhatsApp ✈️ Telegram 📧 Email 🔗 Copier Description du poste 📋 Informations clés Lieu Sénégal Pays Sénégal Date de clôture Non précisée Organisation MAG MAG (Mines Advisory Group) est une organisation humanitaire internationale basée à Manchester, au Royaume-Uni, et opérant dans 32 pays. Nous enlevons les mines terrestres et les munitions non explosées pour libérer des terres et les rendre sûr', array['Bureau', 'Senegal', 'HumanitaireHub', 'humanitaire', 'International']::text[], 92, 0, 'review', '2026-06-25T12:12:41.078Z', now())
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
values ('189bddd5-cf68-4c7a-88ef-c5515324aa8f'::uuid, '3b4000219066d3e66288e14502cf3960fb5e48540ded5c9ff3bb19fe0b298f49', 'DRC - Danish Refugee Council', 'UN Talent Burkina Faso', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs-at-drc/in-anything/contract-all/burkina-faso', 'https://untalent.org/jobs-at-drc/in-anything/contract-all/burkina-faso', null, array['ONG', 'Burkina Faso', 'UN Talent Burkina Faso', 'drc', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:08.535Z', now())
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
values ('2cada880-fb25-46d7-84b9-6b5183f98a6a'::uuid, 'b1a9e70ed82014896d075518a7bd8c38a62407edb6674e694fe835cd52f5d664', 'Responsable QHSE H/F - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/responsable-qhse-hf-ouagadougou-305571', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/responsable-qhse-hf-ouagadougou-305571', null, array['Bureau', 'Ouagadougou', 'Emploiburkina']::text[], 44, 0, 'review', '2026-06-25T12:12:12.503Z', now())
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
values ('7a17c0c6-d9b4-42cd-841f-312c7fd05649'::uuid, 'feb47682f244f824dd1f704d4f310bf82dc8ec596af59b0e2facdd43097172f1', 'Spécialiste de la Chaine d’Approvisionnement (Supply Chain Specialist)', 'UN Talent Burkina Faso', 'Burkina Faso', 'Transport et logistique', 'CDD', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/specialiste-de-la-chaine-dapprovisionnement-supply-chain-specialist', 'https://untalent.org/jobs/specialiste-de-la-chaine-dapprovisionnement-supply-chain-specialist', null, array['Transport et logistique', 'Burkina Faso', 'UN Talent Burkina Faso', 'approvisionnement', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.866Z', now())
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
values ('9fd69416-7081-4ef8-8650-ca9bebb55abc'::uuid, '77022179c4cf846259c5f093253ccbf3a62f5249f1095b81b4836709ac97d81c', 'Professeur Particulier - Toutes Les Villes', 'Emploiburkina', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/professeur-particulier-toutes-villes-306891', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/professeur-particulier-toutes-villes-306891', null, array['Bureau', 'Burkina Faso', 'Emploiburkina']::text[], 44, 0, 'review', '2026-06-25T12:12:08.013Z', now())
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
values ('3c9008ab-5cc4-4032-804f-0e0d96820ba9'::uuid, '1ecbc9e806cf4ccbbb0529bf29f4302539741c0af285a67e54c376d35b893993', 'CHARGÉ(E) PRINCIPAL(E) DES ACHATS', 'UN Talent Burkina Faso', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/charge-e-principal-e-des-achats', 'https://untalent.org/jobs/charge-e-principal-e-des-achats', null, array['Bureau', 'Burkina Faso', 'UN Talent Burkina Faso', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.867Z', now())
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
values ('a6525357-9876-4d23-85a9-0267db1a329a'::uuid, '62999b0348132965dfa05c204b814af1908ae920c6585609374f55bccfd9a39f', 'Commercial Terrain - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Metiers terrain et informels', 'Mission', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/commercial-terrain-ouagadougou-307250', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/commercial-terrain-ouagadougou-307250', null, array['Metiers terrain et informels', 'Ouagadougou', 'Emploiburkina', 'terrain', 'commercial']::text[], 44, 0, 'review', '2026-06-25T12:12:09.335Z', now())
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
values ('77a37ce4-0468-4eac-801c-422c8edbe4a7'::uuid, 'e6001fc8b5f6b238a7aa3d9e3126ade7722ec94c8be5a27dea6835066bd66c58', 'Charg(é)e de la Chaine d’Approvisionnement (Supply Chain Officer)', 'UN Talent Burkina Faso', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/charg-e-e-de-la-chaine-dapprovisionnement-supply-chain-officer', 'https://untalent.org/jobs/charg-e-e-de-la-chaine-dapprovisionnement-supply-chain-officer', null, array['ONG', 'Burkina Faso', 'UN Talent Burkina Faso', 'officer', 'approvisionnement', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.868Z', now())
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
values ('718e0318-556a-4da3-8673-cbf54e3fc467'::uuid, '6209f3fb54aebcd21d8182811c5999c100e299ddbd722a9cfac3bb0ac4ce7d18', 'Coursier Conducteur de Véhicules Automobiles Poids Léger - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Transport et logistique', 'CDD', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/coursier-conducteur-vehicules-automobiles-poids-leger-ouagadougou-307275', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/coursier-conducteur-vehicules-automobiles-poids-leger-ouagadougou-307275', null, array['Transport et logistique', 'Ouagadougou', 'Emploiburkina', 'conducteur']::text[], 44, 0, 'review', '2026-06-25T12:12:12.503Z', now())
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
values ('afdab9c2-eb14-49fb-816c-799be43ed4c1'::uuid, '5dd00f80079b388563878a85f4bcf46f145973a5606f6290c70744fb6999a2ff', 'Spécialiste en Santé Maternelle et Infantile et en Vaccination (MCH & Immunization Specialist)', 'UN Talent Burkina Faso', 'Burkina Faso', 'Sante', 'CDD', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-immunization-specialist', 'https://untalent.org/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-immunization-specialist', null, array['Sante', 'Burkina Faso', 'UN Talent Burkina Faso', 'sante', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.868Z', now())
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
values ('9287f4ff-697f-4806-893d-a61f094c137a'::uuid, 'af5f530c82dee78c17a0d2bbfb3255faa37bf7dbf09e2080262ff78d4f73f9a3', 'Développeur (euse) Backend - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Informatique, data et systemes', 'CDD', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/developpeur-euse-backend-ouagadougou-308426', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/developpeur-euse-backend-ouagadougou-308426', null, array['Informatique, data et systemes', 'Ouagadougou', 'Emploiburkina', 'developpeur']::text[], 44, 0, 'review', '2026-06-25T12:12:08.013Z', now())
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
values ('6be508ba-9fb6-4155-8feb-abe2945c105c'::uuid, '7885887a74c9be409bb1940202df137cda7d8fa60ea4afd2a0a3280b9eb8fd3e', 'Responsable de projet multisectoriel', 'UN Talent Burkina Faso', 'Burkina Faso', 'ONG', 'Mission', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs/responsable-de-projet-multisectoriel', 'https://untalent.org/jobs/responsable-de-projet-multisectoriel', null, array['ONG', 'Burkina Faso', 'UN Talent Burkina Faso', 'projet', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:09.870Z', now())
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
values ('8dae0dc2-d4fc-4dab-807d-fa61cef97ad5'::uuid, 'f1ac7d905a4b6533c0e35c8b1ebaad2402d221a340a6b3017bea9042471f761f', 'Technico-Commercial(e) - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Commerce et vente', 'CDD', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commerciale-ouagadougou-309753', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/technico-commerciale-ouagadougou-309753', null, array['Commerce et vente', 'Ouagadougou', 'Emploiburkina', 'commercial']::text[], 44, 0, 'review', '2026-06-25T12:12:10.498Z', now())
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
values ('7683a0c8-43fe-4fa0-840b-9dc2dedbd93e'::uuid, '0138bdaa2e46989f2579ae37edcf19aa75e473dc5eb27a67dadbbc39e524f327', 'Agencies, Offices and Departments', 'UN Talent Burkina Faso', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://untalent.org/jobs-at', 'https://untalent.org/jobs-at', null, array['Bureau', 'Burkina Faso', 'UN Talent Burkina Faso', 'International']::text[], 56, 0, 'review', '2026-06-25T12:13:08.536Z', now())
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
values ('a029e41d-b59e-4799-81af-8562656d239a'::uuid, '862715d3ded07cd38f311627e51867a24e7c501f8c462fee9a6e20befc874511', 'Expert(e) en Développement et Maintenance de Systèmes Applicatifs - International', 'Emploiburkina', 'Burkina Faso', 'Informatique, data et systemes', 'CDD', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/experte-developpement-maintenance-systemes-applicatifs-international', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/experte-developpement-maintenance-systemes-applicatifs-international', null, array['Informatique, data et systemes', 'Burkina Faso', 'Emploiburkina', 'systeme', 'systemes', 'maintenance']::text[], 44, 0, 'review', '2026-06-25T12:12:08.013Z', now())
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
values ('8b556235-56c3-4fe3-8836-cfc2b582c147'::uuid, '0776b5b3f62c486b0537ea1dbfc7055e04d3c459980a0c26dce2e5399ac4530b', 'Expert(e) en Développement d’Applications Mobiles et Solutions Digital - International', 'Emploiburkina', 'Burkina Faso', 'Informatique, data et systemes', 'CDD', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/experte-developpement-applications-mobiles-solutions-digital-international', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/experte-developpement-applications-mobiles-solutions-digital-international', null, array['Informatique, data et systemes', 'Burkina Faso', 'Emploiburkina', 'digital']::text[], 44, 0, 'review', '2026-06-25T12:12:08.013Z', now())
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
values ('137d041c-b259-438f-8b18-495a3f80f414'::uuid, '63bddfbc048200bbe4ad5f1e859270af5957c6869806fd997d8fc622a0042176', 'Test and Validation Engineer (M/F)', 'Emploiburkina', 'Burkina Faso', 'Bureau', 'A verifier', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/test-validation-engineer-mf-210730', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/test-validation-engineer-mf-210730', null, array['Bureau', 'Burkina Faso', 'Emploiburkina']::text[], 44, 0, 'review', '2026-06-25T12:12:08.015Z', now())
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
values ('7f1f32ea-67e6-4361-824b-0aa5519084ad'::uuid, 'a4dc16f4ae2989d24c217a4244ce0994cf90aa19c16fdede0604cc1041dbf715', 'Chargé(e) d’Affaires - Sécurité Privée et Gardiennage - Ouagadougou', 'Emploiburkina', 'Ouagadougou', 'Metiers terrain et informels', 'Mission', 'Non communique', null, null, 'A verifier', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-affaires-securite-privee-gardiennage-ouagadougou-307844', 'https://www.emploiburkina.com/offre-emploi-burkina-faso/chargee-affaires-securite-privee-gardiennage-ouagadougou-307844', null, array['Metiers terrain et informels', 'Ouagadougou', 'Emploiburkina', 'gardien']::text[], 44, 0, 'review', '2026-06-25T12:12:09.336Z', now())
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
values ('index.html', 'Emplois Burkina - Emploi, recrutement, concours et stages au Burkina Faso', 'Emplois Burkina centralise les offres d', 'home', 'https://emplois-burkina.com/index.html', '2026-06-25', 'weekly', 1, true, now())
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
values ('jobs.html', 'Offres d''emploi au Burkina Faso - Emplois Burkina', 'Toutes les offres d', 'jobs', 'https://emplois-burkina.com/jobs.html', '2026-06-25', 'weekly', 0.9, true, now())
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
values ('conseils.html', 'Conseils emploi Burkina Faso - CV, entretien, concours | Emplois Burkina', 'Guides pratiques pour CV, lettres, entretiens, concours, ONG et candidatures professionnelles au Burkina Faso.', 'page', 'https://emplois-burkina.com/conseils.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('grille-tarifaire.html', 'Tarifs recruteurs et publicite emploi - Emplois Burkina', 'Packs annonces, offres sponsorisees, diffusion WhatsApp, publicite native et solutions recruteurs sur Emplois Burkina.', 'page', 'https://emplois-burkina.com/grille-tarifaire.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('annonceurs.html', 'Publier une offre d''emploi au Burkina Faso - Emplois Burkina', 'Publiez une annonce, sponsorisez une offre, recevez des leads candidats et touchez une audience emploi au Burkina Faso.', 'page', 'https://emplois-burkina.com/annonceurs.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('contacts.html', 'Contact Emplois Burkina - Publier, signaler ou proposer une source', 'Contactez Emplois Burkina pour publier une offre, signaler une annonce, proposer une source emploi ou devenir partenaire.', 'page', 'https://emplois-burkina.com/contacts.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('contact.html', 'Contact Emplois Burkina - Recruteurs, candidats et partenaires', 'Formulaire de contact Emplois Burkina pour candidats, recruteurs, sources emploi et partenaires au Burkina Faso.', 'page', 'https://emplois-burkina.com/contact.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('privacy.html', 'Confidentialite - Emplois Burkina', 'Politique de confidentialite Emplois Burkina pour candidats, recruteurs et visiteurs.', 'page', 'https://emplois-burkina.com/privacy.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('terms.html', 'Mentions legales et conditions - Emplois Burkina', 'Conditions d', 'page', 'https://emplois-burkina.com/terms.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/jobs/volunteer-specialist-d323737c.html', 'Volunteer Specialist - Burkina Faso | Emplois Burkina', 'Volunteer Specialist chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/volunteer-specialist-d323737c.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/technico-commercial-en-climatisation-haut-de-gamme-ouagadougou-4a1ec186.html', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou - Ouagadougou | Emplois Burkina', 'Technico Commercial en Climatisation Haut de Gamme- Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/technico-commercial-en-climatisation-haut-de-gamme-ouagadougou-4a1ec186.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/responsable-meal-rcce-responsabilisation-et-protection-7b678429.html', 'Responsable MEAL – RCCE, Responsabilisation et Protection - RDC | Emplois Burkina', 'Responsable MEAL – RCCE, Responsabilisation et Protection chez HumanitaireHub au RDC. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/responsable-meal-rcce-responsabilisation-et-protection-7b678429.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/avis-de-recrutement-d-un-e-coordonnateur-trice-de-projet-f69dcfb6.html', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet - Burkina Faso | Emplois Burkina', 'Avis de recrutement d’un(e) Coordonnateur(trice) de Projet chez LeFaso.net Recrutement au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/avis-de-recrutement-d-un-e-coordonnateur-trice-de-projet-f69dcfb6.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/mch-et-nutrition-officer-kaya-e53429d1.html', 'MCH &amp; Nutrition Officer - Kaya - Burkina Faso | Emplois Burkina', 'MCH &amp; Nutrition Officer - Kaya chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/mch-et-nutrition-officer-kaya-e53429d1.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/vacancytitle-finance-assistant-location-ouagadougou-ec155659.html', 'VacancyTitle: Finance Assistant, Location: Ouagadougou - Ouagadougou | Emplois Burkina', 'VacancyTitle: Finance Assistant, Location: Ouagadougou chez UNjobs Burkina Faso au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/vacancytitle-finance-assistant-location-ouagadougou-ec155659.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/coordinateur-administratif-et-logistique-a8c21595.html', 'Coordinateur Administratif et Logistique - dans le courant des mois de mai et juin | Emplois Burkina', 'Coordinateur Administratif et Logistique chez BFemploi au dans le courant des mois de mai et juin. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/coordinateur-administratif-et-logistique-a8c21595.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/magazine-keeper-junior-magasinier-h-f-bagassi-dd07b607.html', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi - Bagassi | Emplois Burkina', 'Magazine Keeper Junior (Magasinier) H/F- Bagassi chez Emploiburkina au Bagassi. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/magazine-keeper-junior-magasinier-h-f-bagassi-dd07b607.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/responsable-meal-ipc-wash-c6c03780.html', 'Responsable MEAL – IPC/WASH - RDC | Emplois Burkina', 'Responsable MEAL – IPC/WASH chez HumanitaireHub au RDC. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/responsable-meal-ipc-wash-c6c03780.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/05-postes-a-pourvoir-au-sein-d-une-mutuelle-nationale-e9239113.html', '05 postes à pourvoir au sein d’une mutuelle nationale - Burkina Faso | Emplois Burkina', '05 postes à pourvoir au sein d’une mutuelle nationale chez LeFaso.net Recrutement au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/05-postes-a-pourvoir-au-sein-d-une-mutuelle-nationale-e9239113.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/social-et-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar-7630d6d3.html', 'Social &amp; Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR - Ouagadougou | Emplois Burkina', 'Social &amp; Behavior Change Officer, NO-1, TA, 364 days, Ouagadougou, Burkina-Faso - WCAR chez UN Talent Burkina Faso au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/social-et-behavior-change-officer-no-1-ta-364-days-ouagadougou-burkina-faso-wcar-7630d6d3.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/vacancytitle-finance-assistant-smc-location-ouagadougou-f09ac040.html', 'VacancyTitle: Finance Assistant SMC, Location: Ouagadougou - Ouagadougou | Emplois Burkina', 'VacancyTitle: Finance Assistant SMC, Location: Ouagadougou chez UNjobs Burkina Faso au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/vacancytitle-finance-assistant-smc-location-ouagadougou-f09ac040.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/delegado-a-de-salud-agua-y-saneamiento-651e1ed0.html', 'Delegado/a de Salud, Agua y Saneamiento - Burkina Faso | Emplois Burkina', 'Delegado/a de Salud, Agua y Saneamiento chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/delegado-a-de-salud-agua-y-saneamiento-651e1ed0.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/charge-e-d-operations-et-developpement-ouagadougou-ff4e325a.html', 'Chargé(e) d’Opérations et Développement- Ouagadougou - Ouagadougou | Emplois Burkina', 'Chargé(e) d’Opérations et Développement- Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/charge-e-d-operations-et-developpement-ouagadougou-ff4e325a.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/assistant-aux-achats-c06905e9.html', 'Assistant aux achats - RDC | Emplois Burkina', 'Assistant aux achats chez HumanitaireHub au RDC. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/assistant-aux-achats-c06905e9.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/medecins-oncologues-medical-et-chirurgical-3d61cd45.html', 'Médecins Oncologues médical et chirurgical - Burkina Faso | Emplois Burkina', 'Médecins Oncologues médical et chirurgical chez LeFaso.net Recrutement au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/medecins-oncologues-medical-et-chirurgical-3d61cd45.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/coordinateur-administratif-et-logistique-f-h-97a21600.html', 'Coordinateur administratif et logistique (F/H) - Burkina Faso | Emplois Burkina', 'Coordinateur administratif et logistique (F/H) chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/coordinateur-administratif-et-logistique-f-h-97a21600.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/communications-and-marketing-specialist-pathfinder-portuguese-et-english-countries-1d382472.html', 'Communications and Marketing Specialist, Pathfinder Portuguese &amp; English Countries - Burkina Faso | Emplois Burkina', 'Communications and Marketing Specialist, Pathfinder Portuguese &amp; English Countries chez UNjobs Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/communications-and-marketing-specialist-pathfinder-portuguese-et-english-countries-1d382472.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/coordinateur-trice-financier-e-ca4c8f74.html', 'Coordinateur·trice Financier·e - DU POSTE | Emplois Burkina', 'Coordinateur·trice Financier·e chez BFemploi au DU POSTE. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/coordinateur-trice-financier-e-ca4c8f74.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/directeur-general-enseignement-superieur-telecom-ouaga-875ee4aa.html', 'Directeur Général / Enseignement Supérieur / Telecom- Ouaga - Ouagadougou | Emplois Burkina', 'Directeur Général / Enseignement Supérieur / Telecom- Ouaga chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/directeur-general-enseignement-superieur-telecom-ouaga-875ee4aa.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/assistant-principal-rh-b492e3fd.html', 'Assistant principal RH - Senegal | Emplois Burkina', 'Assistant principal RH chez HumanitaireHub au Senegal. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/assistant-principal-rh-b492e3fd.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/chai-clinton-health-access-initiative-453c94d7.html', 'CHAI - Clinton Health Access Initiative - Burkina Faso | Emplois Burkina', 'CHAI - Clinton Health Access Initiative chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/chai-clinton-health-access-initiative-453c94d7.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/responsable-de-recherche-5114bd32.html', 'Responsable de Recherche - Ouagadougou | Emplois Burkina', 'Responsable de Recherche chez BFemploi au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/responsable-de-recherche-5114bd32.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/blastman-h-f-mogtedo-et-boungou-7b76d300.html', 'Blastman H/F - Mogtedo et Boungou - Burkina Faso | Emplois Burkina', 'Blastman H/F - Mogtedo et Boungou chez Emploiburkina au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/blastman-h-f-mogtedo-et-boungou-7b76d300.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/assistant-administratif-525798f4.html', 'Assistant Administratif - RDC | Emplois Burkina', 'Assistant Administratif chez HumanitaireHub au RDC. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/assistant-administratif-525798f4.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/et-eacute-pidemiologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-pal-3dbe4702.html', '&amp;Eacute;pidemiologiste, Analyste de Recherche, Malaria | Epidemiologist, Research Analyst, Paludisme - Burkina Faso | Emplois Burkina', '&amp;Eacute;pidemiologiste, Analyste de Recherche, Malaria | Epidemiologist, Research Analyst, Paludisme chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/et-eacute-pidemiologiste-analyste-de-recherche-malaria-epidemiologist-research-analyst-pal-3dbe4702.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/enqueteurs-chercheurs-de-terrain-ac8e8a25.html', 'Enquêteurs / Chercheurs de terrain - Burkina Faso | Emplois Burkina', 'Enquêteurs / Chercheurs de terrain chez BFemploi au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/enqueteurs-chercheurs-de-terrain-ac8e8a25.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/stagiaire-secretaire-comptable-stage-de-pre-emploi-ouagadougou-00953728.html', 'Stagiaire Secretaire Comptable (Stage de pré-emploi) - Ouagadougou - Ouagadougou | Emplois Burkina', 'Stagiaire Secretaire Comptable (Stage de pré-emploi) - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/stagiaire-secretaire-comptable-stage-de-pre-emploi-ouagadougou-00953728.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/danish-refugee-council-drc-j-13-02-chefs-d-et-rsquo-equipe-de-protection-ethiopie-cdd-prot-434580f6.html', 'Danish Refugee Council (DRC) J-13 02 Chefs d&amp;rsquo;équipe de protection 📍 Éthiopie 📋 CDD Protection, Genre &amp; Inclusion - Ethiopie | Emplois Burkina', 'Danish Refugee Council (DRC) J-13 02 Chefs d&amp;rsquo;équipe de protection 📍 Éthiopie 📋 CDD Protection, Genre &amp; Inclusion chez HumanitaireHub au Ethiopie. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/danish-refugee-council-drc-j-13-02-chefs-d-et-rsquo-equipe-de-protection-ethiopie-cdd-prot-434580f6.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/associate-malaria-case-management-et-supply-chain-management-071f2c97.html', 'Associate, Malaria Case Management &amp; Supply Chain Management - Burkina Faso | Emplois Burkina', 'Associate, Malaria Case Management &amp; Supply Chain Management chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/associate-malaria-case-management-et-supply-chain-management-071f2c97.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/stagiaire-communication-marketing-ouagadougou-66022624.html', 'Stagiaire Communication Marketing - Ouagadougou - Ouagadougou | Emplois Burkina', 'Stagiaire Communication Marketing - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/stagiaire-communication-marketing-ouagadougou-66022624.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/responsable-du-suivi-et-de-l-et-rsquo-evaluation-2e3bd7ca.html', 'Responsable du suivi et de l&amp;rsquo;évaluation - Senegal | Emplois Burkina', 'Responsable du suivi et de l&amp;rsquo;évaluation chez HumanitaireHub au Senegal. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/responsable-du-suivi-et-de-l-et-rsquo-evaluation-2e3bd7ca.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/clinicien-kaya-regional-office-fc7357dc.html', 'Clinicien - Kaya Regional Office - Burkina Faso | Emplois Burkina', 'Clinicien - Kaya Regional Office chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/clinicien-kaya-regional-office-fc7357dc.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/stagiaire-en-infographie-et-montage-video-ouagadougou-b0427968.html', 'Stagiaire en Infographie et Montage Vidéo - Ouagadougou - Ouagadougou | Emplois Burkina', 'Stagiaire en Infographie et Montage Vidéo - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/stagiaire-en-infographie-et-montage-video-ouagadougou-b0427968.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/fhi-360-recrute-04-postes-b6253de6.html', 'FHI 360 recrute 04 postes - Burkina Faso | Emplois Burkina', 'FHI 360 recrute 04 postes chez HumanitaireHub au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/fhi-360-recrute-04-postes-b6253de6.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/clinician-koudougou-regional-office-1ffcefc7.html', 'Clinician - Koudougou Regional Office - Koudougou | Emplois Burkina', 'Clinician - Koudougou Regional Office chez UN Talent Burkina Faso au Koudougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/clinician-koudougou-regional-office-1ffcefc7.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/stagiaire-ingenieur-technico-commercial-electricite-ouagadougou-7530670d.html', 'Stagiaire Ingénieur Technico-Commercial Électricité - Ouagadougou - Ouagadougou | Emplois Burkina', 'Stagiaire Ingénieur Technico-Commercial Électricité - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/stagiaire-ingenieur-technico-commercial-electricite-ouagadougou-7530670d.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/charge-e-de-projet-principal-e-nutrition-c0378ef3.html', 'Chargé(e) de projet principal(e) – Nutrition - Niger | Emplois Burkina', 'Chargé(e) de projet principal(e) – Nutrition chez HumanitaireHub au Niger. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/charge-e-de-projet-principal-e-nutrition-c0378ef3.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/charge-des-ressources-humaines-f8e877d3.html', 'Chargé des Ressources Humaines - Burkina Faso | Emplois Burkina', 'Chargé des Ressources Humaines chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/charge-des-ressources-humaines-f8e877d3.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/chauffeur-particulier-ouagadougou-d6caa8f6.html', 'Chauffeur Particulier - Ouagadougou - Ouagadougou | Emplois Burkina', 'Chauffeur Particulier - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/chauffeur-particulier-ouagadougou-d6caa8f6.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/mag-recrute-02-postes-0d0fccf5.html', 'MAG recrute 02 postes - Senegal | Emplois Burkina', 'MAG recrute 02 postes chez HumanitaireHub au Senegal. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/mag-recrute-02-postes-0d0fccf5.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/drc-danish-refugee-council-3b400021.html', 'DRC - Danish Refugee Council - Burkina Faso | Emplois Burkina', 'DRC - Danish Refugee Council chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/drc-danish-refugee-council-3b400021.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/responsable-qhse-h-f-ouagadougou-b1a9e70e.html', 'Responsable QHSE H/F - Ouagadougou - Ouagadougou | Emplois Burkina', 'Responsable QHSE H/F - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/responsable-qhse-h-f-ouagadougou-b1a9e70e.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/specialiste-de-la-chaine-d-approvisionnement-supply-chain-specialist-feb47682.html', 'Spécialiste de la Chaine d’Approvisionnement (Supply Chain Specialist) - Burkina Faso | Emplois Burkina', 'Spécialiste de la Chaine d’Approvisionnement (Supply Chain Specialist) chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/specialiste-de-la-chaine-d-approvisionnement-supply-chain-specialist-feb47682.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/professeur-particulier-toutes-les-villes-77022179.html', 'Professeur Particulier - Toutes Les Villes - Burkina Faso | Emplois Burkina', 'Professeur Particulier - Toutes Les Villes chez Emploiburkina au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/professeur-particulier-toutes-les-villes-77022179.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/charge-e-principal-e-des-achats-1ecbc9e8.html', 'CHARGÉ(E) PRINCIPAL(E) DES ACHATS - Burkina Faso | Emplois Burkina', 'CHARGÉ(E) PRINCIPAL(E) DES ACHATS chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/charge-e-principal-e-des-achats-1ecbc9e8.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/commercial-terrain-ouagadougou-62999b03.html', 'Commercial Terrain - Ouagadougou - Ouagadougou | Emplois Burkina', 'Commercial Terrain - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/commercial-terrain-ouagadougou-62999b03.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/charg-e-e-de-la-chaine-d-approvisionnement-supply-chain-officer-e6001fc8.html', 'Charg(é)e de la Chaine d’Approvisionnement (Supply Chain Officer) - Burkina Faso | Emplois Burkina', 'Charg(é)e de la Chaine d’Approvisionnement (Supply Chain Officer) chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/charg-e-e-de-la-chaine-d-approvisionnement-supply-chain-officer-e6001fc8.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/coursier-conducteur-de-vehicules-automobiles-poids-leger-ouagadougou-6209f3fb.html', 'Coursier Conducteur de Véhicules Automobiles Poids Léger - Ouagadougou - Ouagadougou | Emplois Burkina', 'Coursier Conducteur de Véhicules Automobiles Poids Léger - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/coursier-conducteur-de-vehicules-automobiles-poids-leger-ouagadougou-6209f3fb.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-et-immunization-special-5dd00f80.html', 'Spécialiste en Santé Maternelle et Infantile et en Vaccination (MCH &amp; Immunization Specialist) - Burkina Faso | Emplois Burkina', 'Spécialiste en Santé Maternelle et Infantile et en Vaccination (MCH &amp; Immunization Specialist) chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/specialiste-en-sante-maternelle-et-infantile-et-en-vaccination-mch-et-immunization-special-5dd00f80.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/developpeur-euse-backend-ouagadougou-af5f530c.html', 'Développeur (euse) Backend - Ouagadougou - Ouagadougou | Emplois Burkina', 'Développeur (euse) Backend - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/developpeur-euse-backend-ouagadougou-af5f530c.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/responsable-de-projet-multisectoriel-7885887a.html', 'Responsable de projet multisectoriel - Burkina Faso | Emplois Burkina', 'Responsable de projet multisectoriel chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/responsable-de-projet-multisectoriel-7885887a.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/technico-commercial-e-ouagadougou-f1ac7d90.html', 'Technico-Commercial(e) - Ouagadougou - Ouagadougou | Emplois Burkina', 'Technico-Commercial(e) - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/technico-commercial-e-ouagadougou-f1ac7d90.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/agencies-offices-and-departments-0138bdaa.html', 'Agencies, Offices and Departments - Burkina Faso | Emplois Burkina', 'Agencies, Offices and Departments chez UN Talent Burkina Faso au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/agencies-offices-and-departments-0138bdaa.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/expert-e-en-developpement-et-maintenance-de-systemes-applicatifs-international-862715d3.html', 'Expert(e) en Développement et Maintenance de Systèmes Applicatifs - International - Burkina Faso | Emplois Burkina', 'Expert(e) en Développement et Maintenance de Systèmes Applicatifs - International chez Emploiburkina au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/expert-e-en-developpement-et-maintenance-de-systemes-applicatifs-international-862715d3.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/expert-e-en-developpement-d-applications-mobiles-et-solutions-digital-international-0776b5b3.html', 'Expert(e) en Développement d’Applications Mobiles et Solutions Digital - International - Burkina Faso | Emplois Burkina', 'Expert(e) en Développement d’Applications Mobiles et Solutions Digital - International chez Emploiburkina au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/expert-e-en-developpement-d-applications-mobiles-et-solutions-digital-international-0776b5b3.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/test-and-validation-engineer-m-f-63bddfbc.html', 'Test and Validation Engineer (M/F) - Burkina Faso | Emplois Burkina', 'Test and Validation Engineer (M/F) chez Emploiburkina au Burkina Faso. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/test-and-validation-engineer-m-f-63bddfbc.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/jobs/charge-e-d-affaires-securite-privee-et-gardiennage-ouagadougou-a4dc16f4.html', 'Chargé(e) d’Affaires - Sécurité Privée et Gardiennage - Ouagadougou - Ouagadougou | Emplois Burkina', 'Chargé(e) d’Affaires - Sécurité Privée et Gardiennage - Ouagadougou chez Emploiburkina au Ouagadougou. Consultez la source officielle et recevez les alertes Emplois Burkina.', 'job', 'https://emplois-burkina.com/pages/jobs/charge-e-d-affaires-securite-privee-et-gardiennage-ouagadougou-a4dc16f4.html', '2026-06-25', 'daily', 0.8, true, now())
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
values ('pages/categories/btp-et-chantier.html', 'Emplois BTP et chantier au Burkina Faso | Emplois Burkina', 'Suivez les opportunites chantier, construction, genie civil, climatisation, topographie et travaux terrain. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/btp-et-chantier.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/categories/bureau.html', 'Emplois bureau au Burkina Faso | Emplois Burkina', 'Retrouvez les opportunites de bureau, administration, commerce, finance, IT et gestion au Burkina Faso. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/bureau.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/categories/commerce-et-vente.html', 'Emplois commerce et vente au Burkina Faso | Emplois Burkina', 'Postes commerciaux, caissiers, vendeurs, recouvrement, relation client et marketing terrain. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/commerce-et-vente.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/categories/finance-et-administration.html', 'Emplois finance et administration au Burkina Faso | Emplois Burkina', 'Comptabilite, secretariat, finance, juridique, gestion, administration et support bureau. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/finance-et-administration.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/categories/informatique-data-et-systemes.html', 'Offres Informatique, data et systemes au Burkina Faso | Emplois Burkina', 'Retrouvez les opportunites Informatique, data et systemes suivies par Emplois Burkina. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/informatique-data-et-systemes.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/categories/metiers-terrain-et-informels.html', 'Metiers terrain et emplois informels au Burkina Faso | Emplois Burkina', 'Missions et profils terrain : plombiers, soudeurs, macons, chauffeurs, artisans, ouvriers et services locaux. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/metiers-terrain-et-informels.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/categories/ong.html', 'Emplois ONG et humanitaire au Burkina Faso | Emplois Burkina', 'Suivez les postes ONG, ONU, projets de developpement et organisations internationales lies au Burkina Faso. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/ong.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/categories/sante.html', 'Emplois sante au Burkina Faso | Emplois Burkina', 'Offres medicales, paramedicales, pharmacie, clinique, projets sante et missions de terrain. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/sante.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/categories/stage.html', 'Stages au Burkina Faso | Emplois Burkina', 'Decouvrez les stages pour jeunes diplomes, etudiants et profils en debut de carriere. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/stage.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/categories/transport-et-logistique.html', 'Emplois transport et logistique au Burkina Faso | Emplois Burkina', 'Chauffeurs, conducteurs, magasiniers, fleet, stock, approvisionnement et logistique projet. Alertes WhatsApp, sources verifiees et opportunites recentes.', 'category', 'https://emplois-burkina.com/pages/categories/transport-et-logistique.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/bagassi.html', 'Emploi Bagassi | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a Bagassi. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/bagassi.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/burkina-faso.html', 'Emploi Burkina Faso | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a Burkina Faso. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/burkina-faso.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/du-poste.html', 'Emploi DU POSTE | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a DU POSTE. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/du-poste.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/ethiopie.html', 'Emploi Ethiopie | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a Ethiopie. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/ethiopie.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/koudougou.html', 'Emploi Koudougou | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a Koudougou. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/koudougou.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/niger.html', 'Emploi Niger | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a Niger. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/niger.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/ouagadougou.html', 'Emploi Ouagadougou | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a Ouagadougou. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/ouagadougou.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/rdc.html', 'Emploi RDC | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a RDC. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/rdc.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/senegal.html', 'Emploi Senegal | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a Senegal. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/senegal.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/villes/dans-le-courant-des-mois-de-mai-et-juin.html', 'Emploi dans le courant des mois de mai et juin | Emplois Burkina', 'Offres d&#039;emploi, concours, stages et missions a dans le courant des mois de mai et juin. Recevez les alertes Emplois Burkina sur WhatsApp.', 'city', 'https://emplois-burkina.com/pages/villes/dans-le-courant-des-mois-de-mai-et-juin.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/recherche/assistant.html', 'Emploi assistant au Burkina Faso | Emplois Burkina', 'Offres assistant, recherches proches et opportunites verifiees au Burkina Faso. Mots lies : assistante, administration, bureau.', 'page', 'https://emplois-burkina.com/pages/recherche/assistant.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/recherche/chauffeur.html', 'Emploi chauffeur au Burkina Faso | Emplois Burkina', 'Offres chauffeur, recherches proches et opportunites verifiees au Burkina Faso. Mots lies : conducteur, transport, livraison.', 'page', 'https://emplois-burkina.com/pages/recherche/chauffeur.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/recherche/comptable.html', 'Emploi comptable au Burkina Faso | Emplois Burkina', 'Offres comptable, recherches proches et opportunites verifiees au Burkina Faso. Mots lies : comptabilite, finance, gestion.', 'page', 'https://emplois-burkina.com/pages/recherche/comptable.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/recherche/concours.html', 'Emploi concours au Burkina Faso | Emplois Burkina', 'Offres concours, recherches proches et opportunites verifiees au Burkina Faso. Mots lies : recrutement public, fonction publique.', 'page', 'https://emplois-burkina.com/pages/recherche/concours.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/recherche/logistique.html', 'Emploi logistique au Burkina Faso | Emplois Burkina', 'Offres logistique, recherches proches et opportunites verifiees au Burkina Faso. Mots lies : stock, fleet, approvisionnement.', 'page', 'https://emplois-burkina.com/pages/recherche/logistique.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/recherche/sante.html', 'Emploi sante au Burkina Faso | Emplois Burkina', 'Offres sante, recherches proches et opportunites verifiees au Burkina Faso. Mots lies : medical, clinique, paramedical.', 'page', 'https://emplois-burkina.com/pages/recherche/sante.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/recherche/secretaire.html', 'Emploi secretaire au Burkina Faso | Emplois Burkina', 'Offres secretaire, recherches proches et opportunites verifiees au Burkina Faso. Mots lies : secretariat, assistant, administration.', 'page', 'https://emplois-burkina.com/pages/recherche/secretaire.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/recherche/stage.html', 'Emploi stage au Burkina Faso | Emplois Burkina', 'Offres stage, recherches proches et opportunites verifiees au Burkina Faso. Mots lies : stagiaire, internship, debutant.', 'page', 'https://emplois-burkina.com/pages/recherche/stage.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/recherche/vente.html', 'Emploi vente au Burkina Faso | Emplois Burkina', 'Offres vente, recherches proches et opportunites verifiees au Burkina Faso. Mots lies : commercial, vendeur, commerce.', 'page', 'https://emplois-burkina.com/pages/recherche/vente.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/guides/faire-un-cv-au-burkina-faso.html', 'Comment faire un bon CV au Burkina Faso | Emplois Burkina', 'Structure simple pour creer un CV clair, lisible et adapte aux recruteurs au Burkina Faso.', 'guide', 'https://emplois-burkina.com/pages/guides/faire-un-cv-au-burkina-faso.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/guides/eviter-fausses-offres-emploi.html', 'Comment eviter les fausses offres d&#039;emploi | Emplois Burkina', 'Signaux d&#039;alerte, verification des sources et bons reflexes avant de candidater.', 'guide', 'https://emplois-burkina.com/pages/guides/eviter-fausses-offres-emploi.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/guides/postuler-ong-burkina.html', 'Comment postuler a une ONG au Burkina Faso | Emplois Burkina', 'Conseils pour candidater aux ONG, projets internationaux et organisations humanitaires.', 'guide', 'https://emplois-burkina.com/pages/guides/postuler-ong-burkina.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/guides/preparer-un-concours.html', 'Comment preparer un concours au Burkina Faso | Emplois Burkina', 'Organisation, documents, revision et suivi des communiques officiels.', 'guide', 'https://emplois-burkina.com/pages/guides/preparer-un-concours.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/guides/rediger-une-lettre-de-motivation.html', 'Rediger une lettre de motivation efficace | Emplois Burkina', 'Methode simple pour ecrire une lettre claire, courte et adaptee a l&#039;offre visee.', 'guide', 'https://emplois-burkina.com/pages/guides/rediger-une-lettre-de-motivation.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/guides/preparer-un-entretien-emploi.html', 'Preparer un entretien d&#039;embauche | Emplois Burkina', 'Questions frequentes, attitude professionnelle et documents a preparer avant un entretien.', 'guide', 'https://emplois-burkina.com/pages/guides/preparer-un-entretien-emploi.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/guides/documents-pour-postuler.html', 'Documents a preparer pour postuler | Emplois Burkina', 'Liste pratique des documents souvent demandes pour emplois, stages, ONG et concours.', 'guide', 'https://emplois-burkina.com/pages/guides/documents-pour-postuler.html', '2026-06-25', 'weekly', 0.7, true, now())
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
values ('pages/guides/secteurs-qui-recrutent-burkina-faso.html', 'Secteurs qui recrutent au Burkina Faso | Emplois Burkina', 'Pistes pour suivre les secteurs actifs : ONG, administration, finance, IT, commerce, BTP et logistique.', 'guide', 'https://emplois-burkina.com/pages/guides/secteurs-qui-recrutent-burkina-faso.html', '2026-06-25', 'weekly', 0.7, true, now())
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
