"use client";

import { useMemo, useState } from "react";
import { ArrowRight, BadgeCheck, FileSearch, LockKeyhole, ShieldCheck, Sparkles } from "lucide-react";

const CHECKS = [
  {
    id: "contact",
    label: "Contacts lisibles",
    weight: 18,
    test: (text: string) => /(\+?\d[\d\s().-]{7,}|@)/.test(text),
    advice: "Ajoutez telephone, WhatsApp ou email en haut du CV."
  },
  {
    id: "experience",
    label: "Experiences detaillees",
    weight: 20,
    test: (text: string) => /(experience|emploi|stage|mission|projet|consultant|assistant|responsable|charge)/i.test(text),
    advice: "Ajoutez 2 a 4 experiences avec role, structure, dates et resultats."
  },
  {
    id: "skills",
    label: "Competences visibles",
    weight: 18,
    test: (text: string) => /(competence|excel|word|powerpoint|anglais|francais|gestion|analyse|vente|communication|logistique|comptabilite|digital)/i.test(text),
    advice: "Ajoutez une section competences avec outils, langues et savoir-faire."
  },
  {
    id: "education",
    label: "Formation claire",
    weight: 14,
    test: (text: string) => /(formation|diplome|licence|master|bts|bac|certificat|universite|ecole)/i.test(text),
    advice: "Indiquez diplomes, ecoles, annees et certifications pertinentes."
  },
  {
    id: "action",
    label: "Verbes d'action",
    weight: 14,
    test: (text: string) => /(coordonne|gere|analyse|developpe|prepare|organise|supervise|optimise|forme|redige|pilote|suivi)/i.test(text),
    advice: "Utilisez des verbes d'action et des resultats mesurables."
  },
  {
    id: "length",
    label: "Longueur exploitable",
    weight: 16,
    test: (text: string) => text.trim().split(/\s+/).filter(Boolean).length >= 90,
    advice: "Ajoutez assez de details utiles, sans transformer le CV en long roman."
  }
];

function getScore(text: string) {
  const normalized = text.trim();
  const passed = CHECKS.filter((check) => check.test(normalized));
  const score = passed.reduce((sum, check) => sum + check.weight, 0);
  const missing = CHECKS.filter((check) => !check.test(normalized));

  return {
    score: normalized ? Math.min(100, score) : 0,
    passed,
    missing
  };
}

function scoreLabel(score: number) {
  if (score >= 78) return "Bon potentiel ATS";
  if (score >= 50) return "A renforcer";
  if (score > 0) return "Risque eleve";
  return "Collez votre CV";
}

export function CvAtsChecker() {
  const [text, setText] = useState("");
  const result = useMemo(() => getScore(text), [text]);

  return (
    <div className="grid gap-5 lg:grid-cols-[1.05fr_0.95fr]">
      <div className="rounded-xl border border-border bg-white p-5 shadow-sm">
        <div className="flex items-start justify-between gap-3">
          <div>
            <p className="text-xs font-black uppercase tracking-widest text-primary">Diagnostic gratuit</p>
            <h2 className="mt-2 text-2xl font-black text-foreground">Test CV ATS rapide</h2>
          </div>
          <FileSearch size={22} className="text-primary" />
        </div>
        <p className="mt-3 text-sm font-semibold leading-relaxed text-muted-foreground">
          Collez le contenu de votre CV. L'analyse reste dans votre navigateur et donne une lecture rapide des elements
          que les recruteurs et logiciels de tri doivent trouver facilement.
        </p>
        <label className="mt-5 grid gap-2">
          <span className="text-xs font-black uppercase tracking-wide text-muted-foreground">Contenu du CV</span>
          <textarea
            value={text}
            onChange={(event) => setText(event.target.value)}
            rows={13}
            placeholder="Collez ici le texte de votre CV..."
            className="min-h-[260px] rounded-xl border border-border bg-muted/20 px-4 py-3 text-sm font-semibold leading-relaxed outline-none transition-colors focus:border-primary"
          />
        </label>
        <div className="mt-4 flex flex-wrap gap-2">
          <span className="inline-flex items-center gap-1 rounded-full border border-border bg-muted/40 px-3 py-1 text-[11px] font-black text-muted-foreground">
            <LockKeyhole size={12} /> Analyse locale
          </span>
          <span className="inline-flex items-center gap-1 rounded-full border border-border bg-muted/40 px-3 py-1 text-[11px] font-black text-muted-foreground">
            <ShieldCheck size={12} /> Aucun upload
          </span>
        </div>
      </div>

      <aside className="rounded-xl border border-border bg-white p-5 shadow-sm">
        <div className="flex items-center justify-between gap-4">
          <div>
            <p className="text-xs font-black uppercase tracking-widest text-primary">Score</p>
            <p className="mt-2 text-4xl font-black text-foreground">{result.score}/100</p>
            <p className="mt-1 text-sm font-black text-muted-foreground">{scoreLabel(result.score)}</p>
          </div>
          <div className="flex h-20 w-20 items-center justify-center rounded-full border-8 border-primary/15 bg-primary/10 text-xl font-black text-primary">
            {result.score}
          </div>
        </div>

        <div className="mt-5 grid gap-2">
          {CHECKS.map((check) => {
            const ok = result.passed.some((item) => item.id === check.id);
            return (
              <div key={check.id} className="flex items-center justify-between gap-3 rounded-lg border border-border bg-muted/20 px-3 py-2">
                <span className="text-xs font-black text-foreground">{check.label}</span>
                <span className={`rounded-full px-2 py-0.5 text-[10px] font-black uppercase tracking-wide ${ok ? "bg-emerald-50 text-emerald-800" : "bg-amber-50 text-amber-800"}`}>
                  {ok ? "OK" : "A faire"}
                </span>
              </div>
            );
          })}
        </div>

        <div className="mt-5 rounded-xl border border-border bg-muted/30 p-4">
          <div className="flex items-center gap-2">
            <Sparkles size={16} className="text-primary" />
            <h3 className="text-sm font-black text-foreground">Priorite</h3>
          </div>
          <div className="mt-3 grid gap-2">
            {(result.missing.length ? result.missing.slice(0, 3) : CHECKS.slice(0, 2)).map((item) => (
              <p key={item.id} className="flex gap-2 text-xs font-bold leading-relaxed text-muted-foreground">
                <BadgeCheck size={13} className="mt-0.5 shrink-0 text-primary" />
                {result.missing.length ? item.advice : `${item.label} est deja bien couvert.`}
              </p>
            ))}
          </div>
        </div>

        <a
          href="/services?service=cv-ats#paiement"
          data-analytics-source="tool_cta"
          data-analytics-label="cv_ats_checker"
          className="mt-5 inline-flex h-11 w-full items-center justify-center gap-2 rounded-xl bg-primary px-4 text-sm font-black text-primary-foreground transition-transform hover:-translate-y-0.5"
        >
          Commander une optimisation CV
          <ArrowRight size={16} />
        </a>
        <p className="mt-3 text-xs font-semibold leading-relaxed text-muted-foreground">
          Le diagnostic gratuit aide a comprendre. Le service optionnel sert aux candidats qui veulent gagner du temps.
        </p>
      </aside>
    </div>
  );
}
