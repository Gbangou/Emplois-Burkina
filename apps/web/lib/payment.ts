export type PaymentInstructions = {
  provider: string;
  accountLabel: string;
  accountNumber?: string;
  reference: string;
  amountFcfa: number;
  status: "ready" | "needs_configuration";
  steps: string[];
};

export type PaymentReadiness = {
  status: "ready" | "needs_configuration";
  provider: string;
  accountLabel: string;
  hasAccountNumber: boolean;
  nextAction: string;
};

function cleanPublicValue(value: string | undefined, max = 80) {
  if (!value) return undefined;
  const trimmed = value.replace(/\s+/g, " ").trim();
  return trimmed ? trimmed.slice(0, max) : undefined;
}

export function buildPaymentInstructions(input: { orderId: string; amountFcfa: number }): PaymentInstructions {
  const provider = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_PROVIDER, 40) || "Mobile Money";
  const accountLabel = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_ACCOUNT_NAME, 80) || "Compte Emplois Burkina";
  const accountNumber = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_NUMBER, 40);
  const reference = input.orderId.slice(0, 18).toUpperCase();

  return {
    provider,
    accountLabel,
    accountNumber,
    reference,
    amountFcfa: input.amountFcfa,
    status: accountNumber ? "ready" : "needs_configuration",
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
  const provider = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_PROVIDER, 40) || "Mobile Money";
  const accountLabel = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_ACCOUNT_NAME, 80) || "Compte Emplois Burkina";
  const accountNumber = cleanPublicValue(process.env.EMPLOIS_BURKINA_PAYMENT_NUMBER, 40);

  return {
    status: accountNumber ? "ready" : "needs_configuration",
    provider,
    accountLabel,
    hasAccountNumber: Boolean(accountNumber),
    nextAction: accountNumber
      ? "Connecter la verification automatique des paiements et la livraison numerique."
      : "Ajouter EMPLOIS_BURKINA_PAYMENT_NUMBER dans l'environnement de production."
  };
}
