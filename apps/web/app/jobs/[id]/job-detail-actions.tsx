"use client";

import { Bell, BookmarkCheck, BookmarkPlus, Share2 } from "lucide-react";
import { useState } from "react";
import { AlertModal } from "@/components/alert-modal";
import { useToast } from "@/components/toaster";

type Props = {
  jobId: string;
  jobTitle: string;
  jobCity?: string;
  jobCategory?: string;
  showAlertOnly?: boolean;
  showShareOnly?: boolean;
};

const FAV_KEY = "eb_favorites";

function readFavorites() {
  try {
    return JSON.parse(localStorage.getItem(FAV_KEY) || "[]") as string[];
  } catch {
    return [];
  }
}

export function JobDetailActions({ jobId, jobTitle, jobCity, jobCategory, showAlertOnly, showShareOnly }: Props) {
  const [saved, setSaved] = useState(() => {
    if (typeof window === "undefined") return false;
    return readFavorites().includes(jobId);
  });
  const [alertOpen, setAlertOpen] = useState(false);
  const { toast } = useToast();

  function toggleSave() {
    const favs = readFavorites();
    const next = saved ? favs.filter((id) => id !== jobId) : [...favs, jobId];
    localStorage.setItem(FAV_KEY, JSON.stringify(next));
    setSaved(!saved);
    toast(saved ? "Retiré des favoris" : "Sauvegardé dans vos favoris !", saved ? "info" : "success");
  }

  function handleShare() {
    const url = window.location.href;
    if (navigator.share) {
      navigator.share({ title: jobTitle, url }).catch(() => {});
    } else {
      navigator.clipboard.writeText(url).then(() => toast("Lien copié !", "success"));
    }
  }

  if (showAlertOnly) return (
    <>
      <button
        onClick={() => setAlertOpen(true)}
        className="flex items-center justify-center gap-2 w-full h-10 rounded-xl font-black text-sm text-white transition-all hover:-translate-y-0.5"
        style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
      >
        <Bell size={14} /> Activer l'alerte
      </button>
      <AlertModal open={alertOpen} onClose={() => setAlertOpen(false)} defaultQuery={jobCategory || ""} defaultCity={jobCity || ""} />
    </>
  );

  if (showShareOnly) return (
    <button
      onClick={handleShare}
      className="flex items-center justify-center gap-2 w-full h-10 rounded-xl font-black text-sm border border-border text-muted-foreground hover:bg-muted transition-colors"
    >
      <Share2 size={14} /> Partager cette offre
    </button>
  );

  return (
    <>
      <div className="flex gap-2">
        <button
          onClick={toggleSave}
          className="flex-1 flex items-center justify-center gap-2 h-10 rounded-xl font-black text-sm border transition-colors"
          style={{
            background: saved ? "#e6f7ef" : "transparent",
            borderColor: saved ? "#d5ecdf" : "hsl(var(--border))",
            color: saved ? "#0a5636" : "hsl(var(--muted-foreground))"
          }}
        >
          {saved ? <BookmarkCheck size={14} /> : <BookmarkPlus size={14} />}
          {saved ? "Sauvegardé" : "Sauvegarder"}
        </button>
        <button
          onClick={() => setAlertOpen(true)}
          className="flex items-center justify-center w-10 h-10 rounded-xl border border-border text-muted-foreground hover:bg-muted transition-colors"
          aria-label="Créer une alerte"
        >
          <Bell size={14} />
        </button>
        <button
          onClick={handleShare}
          className="flex items-center justify-center w-10 h-10 rounded-xl border border-border text-muted-foreground hover:bg-muted transition-colors"
          aria-label="Partager"
        >
          <Share2 size={14} />
        </button>
      </div>
      <AlertModal open={alertOpen} onClose={() => setAlertOpen(false)} defaultQuery={jobCategory || ""} defaultCity={jobCity || ""} />
    </>
  );
}
