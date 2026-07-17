create table if not exists sources (
  id text primary key,
  name text not null,
  url text not null,
  type text not null,
  priority integer not null default 3,
  collection text not null default 'review_required',
  include_url text[] not null default '{}',
  exclude_url text[] not null default '{}',
  robots_status text not null default 'unknown',
  terms_status text not null default 'unknown',
  partnership_status text not null default 'none',
  owner_contact text,
  is_active boolean not null default true,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists raw_items (
  id text primary key,
  source_id text references sources(id),
  source_name text not null,
  source_url text not null,
  title text not null,
  company text,
  city text,
  deadline text,
  opening_date date,
  closing_date date,
  inconsistent_dates boolean not null default false,
  url text not null,
  category text not null default 'A classer',
  status text not null default 'needs_review',
  excerpt text,
  canonical_url text,
  detail_extracted_at timestamptz,
  risk_score integer not null default 0,
  confidence_score integer not null default 0,
  collected_at timestamptz not null default now()
);

create table if not exists jobs (
  id uuid primary key default gen_random_uuid(),
  raw_item_id text unique references raw_items(id),
  title text not null,
  company text,
  city text,
  category text not null,
  job_type text,
  salary text,
  opening_date date,
  closing_date date,
  deadline_label text,
  source_url text not null,
  canonical_url text,
  summary text,
  tags text[] not null default '{}',
  confidence_score integer not null default 0,
  risk_score integer not null default 0,
  status text not null default 'draft',
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists moderation_events (
  id uuid primary key default gen_random_uuid(),
  raw_item_id text references raw_items(id),
  job_id uuid references jobs(id),
  action text not null,
  reason text,
  actor_name text,
  created_at timestamptz not null default now()
);

create table if not exists source_runs (
  id uuid primary key default gen_random_uuid(),
  source_id text references sources(id),
  status text not null default 'started',
  items_found integer not null default 0,
  error_message text,
  started_at timestamptz not null default now(),
  finished_at timestamptz
);

create table if not exists seo_pages (
  path text primary key,
  title text not null,
  description text,
  page_type text not null,
  canonical_url text not null,
  lastmod date not null default current_date,
  changefreq text not null default 'weekly',
  priority numeric(2,1) not null default 0.7,
  is_indexable boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists indexing_submissions (
  id uuid primary key default gen_random_uuid(),
  engine text not null,
  url text not null,
  status text not null default 'queued',
  response_code integer,
  response_body text,
  submitted_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists subscribers (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  phone text not null unique,
  city text,
  interests text[] not null default '{}',
  subscription_status text not null default 'free',
  premium_until timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists employers (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  contact_name text,
  phone text,
  email text,
  status text not null default 'lead',
  created_at timestamptz not null default now()
);

create table if not exists employer_orders (
  id uuid primary key default gen_random_uuid(),
  employer_id uuid references employers(id),
  product text not null,
  title text,
  budget_fcfa integer not null default 0,
  status text not null default 'lead',
  contact text,
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists sponsors (
  id uuid primary key default gen_random_uuid(),
  organization_name text not null,
  contact text not null,
  category text,
  status text not null default 'lead',
  created_at timestamptz not null default now()
);

create table if not exists campaigns (
  id uuid primary key default gen_random_uuid(),
  sponsor_id uuid references sponsors(id),
  name text not null,
  placement text not null,
  starts_at date,
  ends_at date,
  price_fcfa integer not null default 0,
  status text not null default 'draft',
  created_at timestamptz not null default now()
);

create table if not exists ad_slots (
  id text primary key,
  name text not null,
  placement text not null,
  monthly_price_fcfa integer not null default 0,
  is_active boolean not null default true
);

create table if not exists trade_profiles (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  phone text not null,
  trade text not null,
  city text not null,
  is_verified boolean not null default false,
  subscription_status text not null default 'free',
  created_at timestamptz not null default now()
);

create table if not exists cv_orders (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  contact text not null,
  target_job_id uuid references jobs(id),
  product text not null default 'cv_pack_ai',
  amount_fcfa integer not null default 3000,
  status text not null default 'pending',
  notes text,
  created_at timestamptz not null default now()
);

create table if not exists payments (
  id uuid primary key default gen_random_uuid(),
  payer_phone text not null,
  amount_fcfa integer not null,
  product text not null,
  provider text,
  status text not null default 'pending',
  external_reference text,
  created_at timestamptz not null default now()
);

create table if not exists service_orders (
  id text primary key,
  service_id text not null,
  service_name text not null,
  amount_fcfa integer not null default 0,
  status text not null,
  payment_method text not null default 'mobile_money',
  customer_name text,
  customer_phone text,
  customer_email text,
  payload jsonb not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists invoices (
  id uuid primary key default gen_random_uuid(),
  customer_name text not null,
  customer_contact text,
  product text not null,
  amount_fcfa integer not null,
  status text not null default 'draft',
  issued_at timestamptz not null default now(),
  paid_at timestamptz
);

create table if not exists lead_events (
  id uuid primary key default gen_random_uuid(),
  lead_type text not null,
  contact text,
  payload jsonb not null default '{}',
  estimated_value_fcfa integer not null default 0,
  status text not null default 'new',
  created_at timestamptz not null default now()
);

create table if not exists page_events (
  id uuid primary key default gen_random_uuid(),
  event_type text not null,
  page_path text,
  job_id uuid references jobs(id),
  source_id text references sources(id),
  payload jsonb not null default '{}',
  created_at timestamptz not null default now()
);

create table if not exists whatsapp_broadcasts (
  id uuid primary key default gen_random_uuid(),
  segment text not null,
  message text not null,
  sponsor_id uuid references sponsors(id),
  status text not null default 'draft',
  scheduled_at timestamptz,
  sent_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists alerts (
  id uuid primary key default gen_random_uuid(),
  subscriber_id uuid references subscribers(id),
  job_id uuid references jobs(id),
  channel text not null default 'whatsapp',
  status text not null default 'queued',
  sent_at timestamptz,
  created_at timestamptz not null default now()
);

create index if not exists jobs_status_category_idx on jobs(status, category);
create index if not exists jobs_city_idx on jobs(city);
create index if not exists jobs_closing_date_idx on jobs(closing_date);
create index if not exists raw_items_status_idx on raw_items(status);
create index if not exists raw_items_source_idx on raw_items(source_id);
create index if not exists subscribers_phone_idx on subscribers(phone);
create index if not exists employer_orders_status_idx on employer_orders(status);
create index if not exists campaigns_status_idx on campaigns(status);
create index if not exists lead_events_status_idx on lead_events(status);
create index if not exists service_orders_status_idx on service_orders(status, created_at desc);
create index if not exists source_runs_source_idx on source_runs(source_id, started_at desc);
create index if not exists seo_pages_indexable_idx on seo_pages(is_indexable, page_type);
create index if not exists indexing_submissions_status_idx on indexing_submissions(status, engine);
create index if not exists page_events_type_idx on page_events(event_type, created_at desc);
