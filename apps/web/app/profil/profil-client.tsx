"use client";

import { Bell, Bookmark, BookmarkX, Briefcase, ExternalLink, MapPin, Search, Trash2, UserCircle } from "lucide-react";
import { useEffect, useState } from "react";
import { AlertModal } from "@/components/alert-modal";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";

type SavedJob = { id: string; title?: string; company?: string; city?: string };
type AlertEntry = string;

export function ProfilClient() {
  const [favIds, setFavIds] = useState<string[]>([]);
  const [alerts, setAlerts] = useState<AlertEntry[]>([]);
  const [alertOpen, setAlertOpen] = useState(false);

  useEffect(() => {
    setFavIds(JSON.parse(localStorage.getItem("jf_favorites") || "[]"));
    setAlerts(JSON.parse(localStorage.getItem("emplois-burkina.savedJobAlerts") || "[]"));
  }, []);

  function removeFav(id: string) {
    const next = favIds.filter((f) => f !== id);
    setFavIds(next);
    localStorage.setItem("jf_favorites", JSON.stringify(next));
  }

  function removeAlert(a: AlertEntry) {
    const next = alerts.filter((x) => x !== a);
    setAlerts(next);
    localStorage.setItem("emplois-burkina.savedJobAlerts", JSON.stringify(next));
  }

  const isEmpty = favIds.length === 0 && alerts.length === 0;

  return (
    <div className="container py-8 pb-24 lg:pb-8">
      {/* Header */}
      <div className="flex items-center gap-4 mb-8">
        <div className="w-14 h-14 rounded-2xl flex items-center justify-center"
          style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}>
          <UserCircle size={28} className="text-white" />
        </div>
        <div>
          <h1 className="font-black text-foreground text-xl">Mon espace candidat</h1>
          <p className="text-muted-foreground font-semibold text-sm mt-0.5">
            Favoris, alertes et recherches sauvegardées
          </p>
        </div>
      </div>

      {isEmpty ? (
        <div className="flex flex-col items-center justify-center py-24 gap-5 text-center">
          <div className="w-20 h-20 rounded-2xl bg-muted flex items-center justify-center">
            <UserCircle size={32} className="text-muted-foreground" />
          </div>
          <div>
            <h2 className="font-black text-foreground text-lg">Espace vide pour l'instant</h2>
            <p className="text-muted-foreground font-semibold text-sm mt-1 max-w-sm mx-auto">
              Sauvegardez des offres en cliquant sur le signet, ou créez une alerte WhatsApp pour recevoir les prochaines offres.
            </p>
          </div>
          <div className="flex gap-3 flex-wrap justify-center">
            <a href="/jobs"
              className="inline-flex items-center gap-2 h-10 px-4 rounded-xl border border-border font-black text-sm text-foreground hover:bg-accent transition-colors">
              <Search size={14} /> Explorer les offres
            </a>
            <button
              onClick={() => setAlertOpen(true)}
              className="inline-flex items-center gap-2 h-10 px-4 rounded-xl font-black text-sm text-white"
              style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
            >
              <Bell size={14} /> Créer une alerte
            </button>
          </div>
        </div>
      ) : (
        <div className="grid gap-8 lg:grid-cols-[minmax(0,1fr)_320px]">

          {/* Favorites */}
          <div>
            <div className="flex items-center justify-between mb-4">
              <h2 className="font-black text-foreground flex items-center gap-2">
                <Bookmark size={16} className="text-primary" />
                Offres sauvegardées
                <Badge variant="secondary">{favIds.length}</Badge>
              </h2>
              {favIds.length > 0 && (
                <a href="/jobs" className="text-xs font-black text-primary hover:underline flex items-center gap-1">
                  Voir tout <ExternalLink size={11} />
                </a>
              )}
            </div>

            {favIds.length === 0 ? (
              <Card>
                <CardContent className="p-8 text-center">
                  <Bookmark size={24} className="text-muted-foreground mx-auto mb-3" />
                  <p className="text-sm font-semibold text-muted-foreground">Aucun favori sauvegardé</p>
                  <a href="/jobs" className="inline-flex items-center gap-1.5 mt-3 text-sm font-black text-primary hover:underline">
                    <Search size={12} /> Parcourir les offres
                  </a>
                </CardContent>
              </Card>
            ) : (
              <div className="grid gap-3">
                {favIds.map((id) => (
                  <Card key={id} className="group hover:shadow-sm transition-shadow">
                    <CardContent className="p-4 flex items-center gap-3">
                      <div className="w-10 h-10 rounded-xl bg-muted flex items-center justify-center shrink-0">
                        <Briefcase size={15} className="text-primary" />
                      </div>
                      <a href={`/jobs/${id}`} className="flex-1 min-w-0 group/link">
                        <p className="font-black text-sm text-foreground truncate group-hover/link:text-primary transition-colors">
                          Voir l'offre
                        </p>
                        <p className="text-xs text-muted-foreground font-semibold mt-0.5 truncate font-mono">
                          {id.slice(0, 16)}…
                        </p>
                      </a>
                      <div className="flex gap-2 shrink-0">
                        <a href={`/jobs/${id}`}
                          className="w-8 h-8 rounded-lg flex items-center justify-center border border-border text-muted-foreground hover:bg-accent transition-colors">
                          <ExternalLink size={13} />
                        </a>
                        <button
                          onClick={() => removeFav(id)}
                          className="w-8 h-8 rounded-lg flex items-center justify-center border border-border text-muted-foreground hover:text-red-600 hover:border-red-200 hover:bg-red-50 transition-colors"
                          aria-label="Supprimer"
                        >
                          <BookmarkX size={13} />
                        </button>
                      </div>
                    </CardContent>
                  </Card>
                ))}
              </div>
            )}
          </div>

          {/* Alerts sidebar */}
          <div>
            <div className="flex items-center justify-between mb-4">
              <h2 className="font-black text-foreground flex items-center gap-2">
                <Bell size={16} className="text-primary" />
                Mes alertes
                <Badge variant="secondary">{alerts.length}</Badge>
              </h2>
            </div>

            <div className="grid gap-3">
              {alerts.length === 0 ? (
                <Card>
                  <CardContent className="p-6 text-center">
                    <Bell size={22} className="text-muted-foreground mx-auto mb-2" />
                    <p className="text-sm font-semibold text-muted-foreground mb-3">
                      Aucune alerte active
                    </p>
                    <button
                      onClick={() => setAlertOpen(true)}
                      className="inline-flex items-center gap-2 h-9 px-4 rounded-xl font-black text-sm text-white"
                      style={{ background: "linear-gradient(135deg, #128449, #006fa3)" }}
                    >
                      <Bell size={13} /> Créer une alerte
                    </button>
                  </CardContent>
                </Card>
              ) : (
                <>
                  {alerts.map((alert) => (
                    <Card key={alert}>
                      <CardContent className="p-4 flex items-start gap-3">
                        <div className="w-8 h-8 rounded-lg bg-emerald-50 border border-emerald-200 flex items-center justify-center shrink-0 mt-0.5">
                          <Bell size={13} className="text-emerald-700" />
                        </div>
                        <div className="flex-1 min-w-0">
                          <p className="text-sm font-bold text-foreground leading-snug">{alert}</p>
                          <p className="text-xs text-muted-foreground font-semibold mt-0.5">WhatsApp · Active</p>
                        </div>
                        <button
                          onClick={() => removeAlert(alert)}
                          className="w-7 h-7 rounded-lg flex items-center justify-center text-muted-foreground hover:text-red-600 hover:bg-red-50 transition-colors shrink-0"
                          aria-label="Supprimer"
                        >
                          <Trash2 size={12} />
                        </button>
                      </CardContent>
                    </Card>
                  ))}
                  <button
                    onClick={() => setAlertOpen(true)}
                    className="flex items-center justify-center gap-2 h-10 rounded-xl border border-dashed border-border text-muted-foreground font-black text-sm hover:bg-muted transition-colors"
                  >
                    <Bell size={13} /> Ajouter une alerte
                  </button>
                </>
              )}
            </div>

            {/* Quick search */}
            <div className="mt-5 p-4 rounded-xl border border-border bg-muted/30">
              <p className="text-xs font-black text-muted-foreground uppercase tracking-wide mb-3 flex items-center gap-1.5">
                <MapPin size={11} /> Recherche rapide
              </p>
              <div className="grid gap-2">
                {[
                  ["ONG / Humanitaire", "/jobs?category=ONG"],
                  ["Informatique", "/jobs?category=Informatique"],
                  ["Ouagadougou", "/jobs?city=Ouagadougou"],
                  ["Offres urgentes", "/jobs?sort=deadline"]
                ].map(([label, href]) => (
                  <a key={href} href={href}
                    className="flex items-center gap-2 text-xs font-black text-muted-foreground hover:text-foreground transition-colors">
                    <Search size={10} /> {label}
                  </a>
                ))}
              </div>
            </div>
          </div>
        </div>
      )}

      <AlertModal open={alertOpen} onClose={() => setAlertOpen(false)} />
    </div>
  );
}
