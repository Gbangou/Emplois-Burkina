"use client";

import { useState } from "react";
import { Check, Copy } from "lucide-react";

type CopyTextButtonProps = {
  text: string;
  label?: string;
};

export function CopyTextButton({ text, label = "Copier" }: CopyTextButtonProps) {
  const [copied, setCopied] = useState(false);

  async function copy() {
    try {
      await navigator.clipboard?.writeText(text);
      setCopied(true);
      window.setTimeout(() => setCopied(false), 1800);
    } catch {
      setCopied(false);
    }
  }

  return (
    <button
      type="button"
      onClick={copy}
      className="inline-flex h-9 items-center justify-center gap-2 rounded-lg border border-border bg-white px-3 text-xs font-black text-foreground transition-transform hover:-translate-y-0.5"
    >
      {copied ? <Check size={14} /> : <Copy size={14} />}
      {copied ? "Copie" : label}
    </button>
  );
}
