export type Guide = {
  slug: string;
  title: string;
  description: string;
  audience: string;
  searchIntent: string;
  revenuePath: string;
  serviceHref: string;
  sections: {
    title: string;
    body: string;
  }[];
  keywords: string[];
};

export const GUIDES: Guide[] = [
  {
    slug: "cv-ats-burkina",
    title: "CV ATS pour postuler au Burkina Faso",
    description: "Les regles simples pour creer un CV lisible, propre et compatible avec les logiciels de tri.",
    audience: "Candidats debutants, cadres, ONG et profils tech",
    searchIntent: "cv ats burkina, modele cv burkina, cv pour emploi ong",
    revenuePath: "Service CV ATS Express + outils CV recommandes",
    serviceHref: "/services?service=cv-ats#demande",
    keywords: ["CV ATS", "modele CV", "emploi Burkina", "ONG", "recrutement"],
    sections: [
      {
        title: "Rester simple et lisible",
        body: "Un CV performant doit etre facile a lire par un recruteur et par un logiciel. Utilise des titres standards, une chronologie claire, des competences verifiables et des resultats concrets."
      },
      {
        title: "Adapter le CV a chaque offre",
        body: "Les mots importants de l'annonce doivent apparaitre naturellement dans le CV quand ils correspondent vraiment au parcours du candidat. Il faut eviter les mots-cles inventes."
      },
      {
        title: "Preparer une version rapide a envoyer",
        body: "Le candidat doit garder un CV principal, puis produire une version ciblee pour chaque secteur: ONG, finance, BTP, sante, education, tech ou administration."
      }
    ]
  },
  {
    slug: "lettre-motivation-ong",
    title: "Lettre de motivation pour ONG et projets internationaux",
    description: "Comment rediger une lettre courte, specifique et credible pour une offre ONG, ONU ou projet finance.",
    audience: "Candidats ONG, humanitaire, developpement et consulting",
    searchIntent: "lettre motivation ong, candidature onu burkina, emploi humanitaire",
    revenuePath: "Lettre ciblee + pack ONG / International",
    serviceHref: "/services?service=ong-international#demande",
    keywords: ["lettre ONG", "ONU", "humanitaire", "developpement", "international"],
    sections: [
      {
        title: "Montrer la comprehension du poste",
        body: "Une bonne lettre ne repete pas le CV. Elle explique pourquoi l'experience du candidat correspond au mandat, au terrain, aux beneficiaires et aux exigences de l'organisation."
      },
      {
        title: "Rester precis",
        body: "Les organisations internationales apprecient les exemples concrets: projet suivi, budget gere, equipe coordonnee, rapport produit, outils utilises ou zone d'intervention."
      },
      {
        title: "Eviter les promesses vagues",
        body: "Il faut remplacer les phrases generales par des preuves. Une lettre efficace est courte, structuree et reliee directement aux criteres de l'offre."
      }
    ]
  },
  {
    slug: "emplois-remote-afrique",
    title: "Trouver un emploi remote depuis le Burkina Faso",
    description: "Methodes serieuses pour chercher des missions remote, preparer son profil et eviter les offres douteuses.",
    audience: "Profils tech, support client, marketing, assistants virtuels, freelances",
    searchIntent: "emploi remote afrique, travail en ligne burkina, job remote francophone",
    revenuePath: "Affiliation formation + traduction FR/EN + pack international",
    serviceHref: "/services?service=ong-international#demande",
    keywords: ["remote", "freelance", "anglais", "Afrique", "travail en ligne"],
    sections: [
      {
        title: "Construire un profil international",
        body: "Un profil remote doit montrer le niveau d'anglais, les outils maitrises, les disponibilites, les preuves de travail et la capacite a collaborer a distance."
      },
      {
        title: "Verifier les plateformes et les offres",
        body: "Il faut eviter les demandes de frais, les promesses de gains irreels et les recruteurs sans trace verifiable. Les offres serieuses decrivent le role, le paiement, le contrat et le processus."
      },
      {
        title: "Creer une routine de candidature",
        body: "La recherche remote fonctionne mieux avec une routine: veille quotidienne, CV en anglais, portfolio simple, messages courts et suivi des candidatures envoyees."
      }
    ]
  },
  {
    slug: "concours-recrutements-burkina",
    title: "Suivre les concours et recrutements publics au Burkina Faso",
    description: "Un guide pratique pour organiser sa veille, ses dossiers et ses alertes sur les concours et recrutements publics.",
    audience: "Etudiants, jeunes diplomes, agents contractuels et familles",
    searchIntent: "concours burkina, recrutement public burkina, fonction publique burkina",
    revenuePath: "AdSense contenu + alertes + preparation dossier",
    serviceHref: "/jobs?category=Concours",
    keywords: ["concours", "fonction publique", "recrutement public", "dossier", "Burkina"],
    sections: [
      {
        title: "Centraliser les sources",
        body: "Les candidats doivent suivre les sources officielles, les ministeres, les institutions, les universites et les plateformes emploi fiables pour ne pas rater les dates limites."
      },
      {
        title: "Preparer les documents avant l'urgence",
        body: "Les copies legalisees, diplomes, CNIB, certificats et photos doivent etre prets avant la publication d'un concours. Cela reduit le stress au moment de postuler."
      },
      {
        title: "Activer des alertes utiles",
        body: "Les alertes par secteur, ville et niveau permettent de recevoir les nouvelles opportunites sans verifier manuellement plusieurs sites chaque jour."
      }
    ]
  }
];

export function getGuide(slug: string) {
  return GUIDES.find((guide) => guide.slug === slug);
}
