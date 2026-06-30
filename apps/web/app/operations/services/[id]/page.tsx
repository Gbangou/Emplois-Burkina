import Link from "next/link";
import type { Metadata } from "next";
import { notFound } from "next/navigation";
import { ArrowLeft, ClipboardList, Mail, MessageCircle, ShieldCheck } from "lucide-react";
import { CopyTextButton } from "@/components/copy-text-button";
import { MarkDeliveredButton } from "@/components/mark-delivered-button";
import { buildServiceDeliveryBrief, buildServiceDeliveryMessage } from "@/lib/service-delivery";
import { getServiceOrderById } from "@/lib/service-orders";

export const metadata: Metadata = {
  title: "Livraison service | Operations",
  robots: {
    index: false,
    follow: false
  }
};

type ServiceDeliveryPageProps = {
  params: Promise<{
    id: string;
  }>;
};

function formatFcfa(value: number) {
  return new Intl.NumberFormat("fr-FR").format(value);
}

function formatDate(value?: string) {
  if (!value) return "Non renseigne";
  return new Intl.DateTimeFormat("fr-FR", {
    dateStyle: "medium",
    timeStyle: "short"
  }).format(new Date(value));
}

function whatsappHref(phone: string | undefined, message: string) {
  if (!phone) return undefined;
  const digits = phone.replace(/[^\d]/g, "");
  return digits ? `https://wa.me/${digits}?text=${encodeURIComponent(message)}` : undefined;
}

function emailHref(email: string | undefined, subject: string, message: string) {
  if (!email) return undefined;
  return `mailto:${email}?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(message)}`;
}

export default async function ServiceDeliveryPage({ params }: ServiceDeliveryPageProps) {
  const { id } = await params;
  const order = await getServiceOrderById(id);
  if (!order) notFound();

  const message = buildServiceDeliveryMessage(order);
  const brief = buildServiceDeliveryBrief(order);
  const whatsapp = whatsappHref(order.phone, message);
  const email = emailHref(order.email, brief.title, message);

  return (
    <main>
      <header className="topbar">
        <Link className="brand" href="/operations">
          <span>EB</span>
          <strong>Livraison service</strong>
        </Link>
        <nav>
          <Link href="/operations">
            <ArrowLeft size={15} />
            Operations
          </Link>
          <Link href="/services">Services</Link>
        </nav>
      </header>

      <section className="section">
        <div className="rounded-xl border border-border bg-white p-5 shadow-sm lg:p-8">
          <div className="flex flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
            <div>
              <p className="eyebrow">Commande privee</p>
              <h1 className="mt-2 text-3xl font-black tracking-tight text-foreground">{order.serviceName}</h1>
              <p className="mt-2 text-sm font-semibold leading-relaxed text-muted-foreground">
                Reference {order.id.slice(0, 18).toUpperCase()} - {formatFcfa(order.amountFcfa)} FCFA - statut {order.status}.
              </p>
            </div>
            <MarkDeliveredButton orderId={order.id} />
          </div>

          <div className="mt-6 grid gap-4 lg:grid-cols-[0.9fr_1.1fr]">
            <section className="rounded-xl border border-border bg-muted/30 p-4">
              <h2 className="text-sm font-black text-foreground">Contact et paiement</h2>
              <dl className="mt-3 grid gap-3 text-sm">
                <div>
                  <dt className="text-xs font-black uppercase tracking-wide text-muted-foreground">Nom</dt>
                  <dd className="mt-1 font-bold text-foreground">{order.name || "Non renseigne"}</dd>
                </div>
                <div>
                  <dt className="text-xs font-black uppercase tracking-wide text-muted-foreground">WhatsApp</dt>
                  <dd className="mt-1 font-bold text-foreground">{order.phone || "Non renseigne"}</dd>
                </div>
                <div>
                  <dt className="text-xs font-black uppercase tracking-wide text-muted-foreground">Email</dt>
                  <dd className="mt-1 font-bold text-foreground">{order.email || "Non renseigne"}</dd>
                </div>
                <div>
                  <dt className="text-xs font-black uppercase tracking-wide text-muted-foreground">Paiement</dt>
                  <dd className="mt-1 font-bold text-foreground">
                    {order.externalPayment?.status || order.paymentProof?.transactionId || "En attente de verification"}
                  </dd>
                </div>
                <div>
                  <dt className="text-xs font-black uppercase tracking-wide text-muted-foreground">Date commande</dt>
                  <dd className="mt-1 font-bold text-foreground">{formatDate(order.createdAt)}</dd>
                </div>
              </dl>
              <div className="mt-4 grid gap-2 sm:grid-cols-2">
                {whatsapp && (
                  <a className="inline-flex h-10 items-center justify-center gap-2 rounded-lg bg-emerald-700 px-3 text-xs font-black text-white" href={whatsapp} target="_blank" rel="noreferrer">
                    <MessageCircle size={15} />
                    WhatsApp
                  </a>
                )}
                {email && (
                  <a className="inline-flex h-10 items-center justify-center gap-2 rounded-lg border border-border bg-white px-3 text-xs font-black text-foreground" href={email}>
                    <Mail size={15} />
                    Email
                  </a>
                )}
              </div>
            </section>

            <section className="rounded-xl border border-border bg-white p-4 shadow-sm">
              <h2 className="text-sm font-black text-foreground">Brief de livraison</h2>
              <p className="mt-3 rounded-lg border border-border bg-muted/30 p-3 text-sm font-semibold leading-relaxed text-muted-foreground">
                {brief.summary}
              </p>
              <div className="mt-4 grid gap-3 md:grid-cols-2">
                <div className="rounded-lg border border-border bg-muted/30 p-3">
                  <p className="text-xs font-black uppercase tracking-wide text-muted-foreground">Livrables</p>
                  <ul className="mt-2 grid gap-1 text-sm font-semibold text-muted-foreground">
                    {brief.deliverables.map((item) => <li key={item}>{item}</li>)}
                  </ul>
                </div>
                <div className="rounded-lg border border-border bg-muted/30 p-3">
                  <p className="text-xs font-black uppercase tracking-wide text-muted-foreground">Qualite</p>
                  <ul className="mt-2 grid gap-1 text-sm font-semibold text-muted-foreground">
                    {brief.qualityChecks.map((item) => <li key={item}>{item}</li>)}
                  </ul>
                </div>
              </div>
              <div className="mt-4 grid gap-3 md:grid-cols-2">
                <div className="rounded-lg border border-border bg-muted/30 p-3">
                  <p className="text-xs font-black uppercase tracking-wide text-muted-foreground">A demander / verifier</p>
                  <ul className="mt-2 grid gap-1 text-sm font-semibold text-muted-foreground">
                    {brief.intakeFields.map((item) => <li key={item}>{item}</li>)}
                  </ul>
                </div>
                <div className="rounded-lg border border-border bg-muted/30 p-3">
                  <p className="text-xs font-black uppercase tracking-wide text-muted-foreground">Manquants probables</p>
                  <ul className="mt-2 grid gap-1 text-sm font-semibold text-muted-foreground">
                    {brief.missingInputs.length > 0 ? brief.missingInputs.map((item) => <li key={item}>{item}</li>) : <li>Brief assez complet</li>}
                  </ul>
                </div>
              </div>
            </section>
          </div>

          <section className="mt-4 rounded-xl border border-border bg-white p-4 shadow-sm">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
              <div className="flex items-start gap-3">
                <ClipboardList size={18} className="mt-0.5 shrink-0 text-primary" />
                <div>
                  <h2 className="text-sm font-black text-foreground">Brouillon de production</h2>
                  <p className="mt-1 text-xs font-semibold leading-relaxed text-muted-foreground">
                    Structure interne a reprendre dans le document final pour livrer plus vite.
                  </p>
                </div>
              </div>
              <CopyTextButton text={brief.productionDraft} label="Copier brouillon" />
            </div>
            <pre className="mt-3 max-h-96 overflow-auto whitespace-pre-wrap rounded-lg border border-border bg-muted/30 p-3 text-xs font-semibold leading-relaxed text-foreground">{brief.productionDraft}</pre>
          </section>

          <section className="mt-4 rounded-xl border border-emerald-200 bg-emerald-50 p-4">
            <div className="flex items-start gap-3">
              <ShieldCheck size={18} className="mt-0.5 shrink-0 text-emerald-800" />
              <div>
                <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                  <h2 className="text-sm font-black text-emerald-950">Message pret a envoyer</h2>
                  <CopyTextButton text={message} label="Copier message" />
                </div>
                <pre className="mt-2 whitespace-pre-wrap rounded-lg bg-white/75 p-3 text-xs font-semibold leading-relaxed text-emerald-950">{message}</pre>
              </div>
            </div>
          </section>
        </div>
      </section>
    </main>
  );
}
