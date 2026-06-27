export type PaymentInstructions = {
  mode: "manual_mobile_money" | "pawapay_payment_page";
  provider: string;
  accountLabel: string;
  accountNumber?: string;
  reference: string;
  amountFcfa: number;
  status: "ready" | "needs_configuration";
  redirectUrl?: string;
  requiresProof: boolean;
  steps: string[];
};

export type PaymentReadiness = {
  status: "ready" | "needs_configuration";
  mode: "manual_mobile_money" | "pawapay_payment_page";
  provider: string;
  accountLabel: string;
  hasAccountNumber: boolean;
  hasAggregatorToken: boolean;
  nextAction: string;
};

export type PawaPayPaymentPageResult =
  | { ok: true; redirectUrl: string }
  | { ok: false; reason: "not_configured" | "request_failed" };

function cleanPublicValue(value: string | undefined, max = 80) {
  if (!value) return undefined;
  const trimmed = value.replace(/\s+/g, " ").trim();
  return trimmed ? trimmed.slice(0, max) : undefined;
}

export function buildPaymentInstructions(input: { orderId: string; amountFcfa: number }): PaymentInstructions {
  const mode = getPaymentMode();
  const provider = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_PROVIDER, 40) || "Mobile Money";
  const accountLabel = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_ACCOUNT_NAME, 80) || "Compte Emplois Burkina";
  const accountNumber = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_NUMBER, 40);
  const reference = input.orderId.slice(0, 18).toUpperCase();

  if (mode === "pawapay_payment_page") {
    return {
      mode,
      provider: "pawaPay",
      accountLabel: "Paiement Mobile Money securise",
      reference,
      amountFcfa: input.amountFcfa,
      status: hasPawaPayConfig() ? "ready" : "needs_configuration",
      requiresProof: false,
      steps: hasPawaPayConfig()
        ? [
            "Cliquer sur le bouton de paiement securise.",
            "Choisir le wallet Mobile Money et autoriser le paiement.",
            "La confirmation sera synchronisee automatiquement apres retour pawaPay."
          ]
        : [
            "La commande est creee et prete pour paiement.",
            "Configurer PAWAPAY_API_TOKEN et EMPLOIS_BURKINA_BASE_URL.",
            "Le mode Mobile Money manuel reste disponible en secours."
          ]
    };
  }

  return {
    mode,
    provider,
    accountLabel,
    accountNumber,
    reference,
    amountFcfa: input.amountFcfa,
    status: accountNumber ? "ready" : "needs_configuration",
    requiresProof: true,
    steps: accountNumber
      ? [
          `Envoyer ${input.amountFcfa} FCFA via ${provider}.`,
          `Utiliser la reference ${reference} dans le commentaire ou message.`,
          "Garder la capture ou le SMS de confirmation."
        ]
      : [
          "La commande est creee et prete pour paiement.",
          "Configurer EMPLOIS_BURKINA_PAYMENT_NUMBER pour afficher le numero marchand.",
          "Connecter ensuite la confirmation automatique du paiement."
        ]
  };
}

export function getPaymentReadiness(): PaymentReadiness {
  const mode = getPaymentMode();
  const provider = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_PROVIDER, 40) || "Mobile Money";
  const accountLabel = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_ACCOUNT_NAME, 80) || "Compte Emplois Burkina";
  const accountNumber = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_NUMBER, 40);
  const hasAggregatorToken = hasPawaPayConfig();

  if (mode === "pawapay_payment_page") {
    return {
      status: hasAggregatorToken ? "ready" : "needs_configuration",
      mode,
      provider: "pawaPay",
      accountLabel: "Payment Page",
      hasAccountNumber: false,
      hasAggregatorToken,
      nextAction: hasAggregatorToken
        ? "Tester la sandbox pawaPay, configurer le callback et passer en production apres validation KYC."
        : "Creer le compte sandbox pawaPay, ajouter PAWAPAY_API_TOKEN puis configurer les callbacks."
    };
  }

  return {
    status: accountNumber ? "ready" : "needs_configuration",
    mode,
    provider,
    accountLabel,
    hasAccountNumber: Boolean(accountNumber),
    hasAggregatorToken,
    nextAction: accountNumber
      ? "Connecter la verification automatique des paiements et la livraison numerique."
      : "Ajouter EMPLOIS_BURKINA_PAYMENT_NUMBER dans l'environnement de production."
  };
}

export function getPaymentMode(): PaymentInstructions["mode"] {
  return process.env.EMPLOIS_BURKINA_PAYMENT_MODE === "pawapay_payment_page"
    ? "pawapay_payment_page"
    : "manual_mobile_money";
}

function hasPawaPayConfig() {
  return Boolean(process.env.PAWAPAY_API_TOKEN && process.env.EMPLOIS_BURKINA_BASE_URL);
}

export async function createPawaPayPaymentPage(input: {
  depositId: string;
  amountFcfa: number;
  reason: string;
  returnPath: string;
}): Promise<PawaPayPaymentPageResult> {
  const token = process.env.PAWAPAY_API_TOKEN;
  const baseUrl = process.env.PAWAPAY_API_BASE_URL || "https://api.sandbox.pawapay.io";
  const publicBaseUrl = process.env.EMPLOIS_BURKINA_BASE_URL;

  if (!token || !publicBaseUrl) return { ok: false, reason: "not_configured" };

  const res = await fetch(`${baseUrl.replace(/\/$/, "")}/v2/paymentpage`, {
    method: "POST",
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      depositId: input.depositId,
      returnUrl: new URL(input.returnPath, publicBaseUrl).toString(),
      amount: String(input.amountFcfa),
      country: process.env.PAWAPAY_COUNTRY || "BFA",
      reason: input.reason.slice(0, 120)
    })
  });

  if (!res.ok) return { ok: false, reason: "request_failed" };
  const data = await res.json() as { redirectUrl?: string };
  return data.redirectUrl ? { ok: true, redirectUrl: data.redirectUrl } : { ok: false, reason: "request_failed" };
}
