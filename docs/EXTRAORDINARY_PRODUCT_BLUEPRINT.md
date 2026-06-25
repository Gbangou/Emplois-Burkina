# Emplois Burkina - Blueprint produit extraordinaire

Derniere mise a jour : 25 juin 2026.

## Ambition

Emplois Burkina ne doit pas devenir seulement un site d'offres. La vision forte
est de construire l'infrastructure emploi du Burkina Faso : un systeme qui
collecte proprement les opportunites, protege les candidats, aide les recruteurs
a publier vite, diffuse sur WhatsApp, mesure la performance et transforme les
donnees du marche en decisions utiles.

Le produit doit etre mobile-first, rapide, fiable, monetisable et utile meme
avec une connexion moyenne. WhatsApp reste le canal de distribution principal,
le web app reste le coeur indexable, et le mobile natif vient apres validation
du revenu.

## Proposition de plateforme cible

1. Experience candidat
   - Recherche ultra simple par metier, ville, secteur et niveau.
   - Score de pertinence explique pour chaque offre.
   - Favoris, recherches recentes, alertes WhatsApp et historique candidature.
   - Assistant candidature : CV, lettre, checklist documents, questions
     d'entretien et traduction FR/EN quand l'offre est internationale.
   - Mode faible connexion : PWA installable, cache des fiches vues, formulaires
     tolerants aux coupures.

2. Experience recruteur
   - Publication d'annonce en moins de 3 minutes.
   - Verification entreprise/source avant diffusion.
   - Suggestions de categorie, titre, mots-cles et prix sponsorise.
   - Paiement Mobile Money et facture.
   - Dashboard vues, clics source, leads, conversion WhatsApp et cout par lead.

3. Intelligence marche
   - Radar metiers qui recrutent par ville et secteur.
   - Tendances concours, ONG, stages, tech, terrain et informel.
   - Sources actives, fiables, bloquees ou a negocier en partenariat.
   - Rapport mensuel sponsorisable pour ecoles, recruteurs et institutions.

4. Trust and safety
   - Score de confiance visible.
   - Preuve de source et lien officiel obligatoire.
   - Detection offres douteuses : salaire trop beau, contact non professionnel,
     lien raccourci, absence d'organisation, urgence abusive.
   - Signalement public et file admin anti-arnaque.
   - Moderation humaine pour tout contenu a risque.

5. Distribution et croissance
   - SEO programmatique : villes, categories, guides, fiches offres.
   - WhatsApp Business pour alertes segmentees.
   - Telegram/Facebook/LinkedIn via API ou workflows autorises.
   - Newsletter hebdomadaire et flux RSS/API pour partenaires.
   - Programme ambassadeurs ecoles, universites, cybercafes et centres de
     formation.

## Stack moderne recommandee

Frontend :
- Next.js App Router, React, TypeScript.
- Tailwind CSS et design system interne.
- PWA avec service worker, offline cache et installation mobile.
- Plus tard : Expo/React Native en reutilisant `packages/domain`.

Backend :
- NestJS modulaire.
- Prisma pour acces donnees.
- PostgreSQL/Supabase ou Neon pour production.
- Redis/Upstash pour cache, rate limit, files d'attente et idempotence.
- BullMQ ou jobs planifies pour scraping, alertes, publication sociale.

Recherche et IA :
- Recherche textuelle PostgreSQL au debut.
- Meilisearch, Typesense ou OpenSearch quand le catalogue grossit.
- Embeddings/vector search pour matching candidat-offre et dedoublonnage avance.
- LLM avec garde-fous pour CV, lettres, resume d'offres et classification.
- RAG limite aux donnees sourcees ; aucune invention d'experience candidat.

Data et analytics :
- PostHog ou analytics self-hosted pour evenements produit.
- OpenTelemetry pour traces backend.
- Sentry pour erreurs web/API.
- Metabase/Superset pour reporting marche et revenu.
- dbt plus tard si les donnees deviennent un vrai actif commercial.

Paiements et revenus :
- Mobile Money via aggregateur local/regional.
- Packs annonces, sponsorisation, campagnes recruteurs, CV/coaching,
  rapports marche et API partenaires.
- Facturation simple, statut paiement, preuve et relance automatique.

Infrastructure :
- Vercel/Cloudflare Pages pour frontend si adapte.
- Render/Fly.io/Railway/Supabase/Neon pour API et PostgreSQL.
- Cloudflare pour DNS, cache, WAF, bot rules et images.
- GitHub Actions pour CI/CD : lint, typecheck, build, tests, deploy.
- Backups automatiques PostgreSQL et export quotidien des donnees critiques.

## Roadmap d'execution

Phase 1 - Produit fiable
- Finaliser Next/Nest comme surface principale.
- Connecter Next a Nest via `NEXT_PUBLIC_API_URL`.
- Migrer lectures/ecritures critiques vers Prisma.
- Ajouter auth admin/recruteur.
- Ajouter signalement public d'offre douteuse.

Phase 2 - Matching et alertes
- Ajouter profil candidat minimal.
- Ajouter favoris persistants.
- Ajouter recherche hybride avec synonymes locaux.
- Ajouter alertes WhatsApp segmentees avec opt-in et desinscription.
- Ajouter scoring candidature/offre explique.

Phase 3 - Revenu recruteur
- Workflow publier annonce.
- Verification admin.
- Packs sponsorises.
- Mobile Money.
- Dashboard recruteur.

Phase 4 - Intelligence marche
- Dashboard tendances par ville/secteur/source.
- Rapport mensuel PDF/HTML sponsorisable.
- API partenaires.
- Benchmark salaires quand la donnee est disponible.

Phase 5 - Mobile et ecosysteme
- PWA avancee.
- App Expo si l'usage mobile justifie le cout.
- Programme ambassadeurs.
- Integrations partenaires : ecoles, ONG, cabinets RH, institutions.

## Differenciation extraordinaire

La difference ne vient pas d'une interface plus jolie. Elle vient de cinq
avantages composes :

- couverture locale et informelle que les grands job boards ignorent ;
- confiance visible contre les fausses offres ;
- distribution WhatsApp adaptee aux usages reels ;
- donnees marche monetisables ;
- assistant candidat/recruteur qui reduit le temps et augmente la qualite.

## Suite immediate

1. Ajouter un module `Opportunity OS` visible dans l'app moderne.
2. Ajouter les types domaine pour matching et signaux marche.
3. Ajouter endpoint Nest `/platform/intelligence`.
4. Afficher les signaux dans `/operations`.
5. Ajouter auth admin/recruteur et persistance Prisma.
6. Brancher alertes WhatsApp avec journal d'envoi.
7. Preparer workflow paiement sponsorisation.
