export function normalize(value = "") {
  return value
    .toString()
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");
}

export function tokenizeNormalized(value = "") {
  return normalize(value)
    .split(/[^a-z0-9]+/i)
    .map((token) => token.trim())
    .filter((token) => token.length >= 2);
}

export function readStorageArray(key) {
  try {
    const data = JSON.parse(localStorage.getItem(key) || "[]");
    return Array.isArray(data) ? data : [];
  } catch {
    return [];
  }
}

export function writeStorageArray(key, items) {
  localStorage.setItem(key, JSON.stringify(items));
}

export function boundedDistance(a = "", b = "", maxDistance = 1) {
  if (a === b) return 0;
  if (!a || !b) return Number.MAX_SAFE_INTEGER;
  if (Math.abs(a.length - b.length) > maxDistance) return Number.MAX_SAFE_INTEGER;

  const rows = Array.from({ length: a.length + 1 }, () => new Array(b.length + 1).fill(0));
  for (let i = 0; i <= a.length; i += 1) rows[i][0] = i;
  for (let j = 0; j <= b.length; j += 1) rows[0][j] = j;

  for (let i = 1; i <= a.length; i += 1) {
    let rowMin = Number.MAX_SAFE_INTEGER;
    for (let j = 1; j <= b.length; j += 1) {
      const cost = a[i - 1] === b[j - 1] ? 0 : 1;
      rows[i][j] = Math.min(rows[i - 1][j] + 1, rows[i][j - 1] + 1, rows[i - 1][j - 1] + cost);
      rowMin = Math.min(rowMin, rows[i][j]);
    }
    if (rowMin > maxDistance) return Number.MAX_SAFE_INTEGER;
  }

  return rows[a.length][b.length];
}

export function formatFcfa(value) {
  return new Intl.NumberFormat("fr-FR").format(value || 0) + " FCFA";
}

export function escapeHtml(value = "") {
  return value
    .toString()
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

export function displayDate(value) {
  if (!value) return "Date inconnue";
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return value;
  return new Intl.DateTimeFormat("fr-BF", {
    day: "2-digit",
    month: "short",
    year: "numeric",
  }).format(date);
}

export function formatJobDate(value, fallback = "Date non precisee") {
  if (!value) return fallback;
  const date = new Date(`${String(value).slice(0, 10)}T00:00:00`);
  if (Number.isNaN(date.getTime())) return fallback;
  return new Intl.DateTimeFormat("fr-BF", {
    day: "2-digit",
    month: "short",
    year: "numeric",
  }).format(date);
}

export function daysUntil(value) {
  if (!value) return null;
  const target = new Date(`${String(value).slice(0, 10)}T23:59:59`);
  if (Number.isNaN(target.getTime())) return null;
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  return Math.ceil((target - today) / 86_400_000);
}

export function getDeadlineTarget(value) {
  if (!value) return null;
  const target = new Date(`${String(value).slice(0, 10)}T23:59:59`);
  return Number.isNaN(target.getTime()) ? null : target;
}

export function millisecondsUntil(value) {
  const target = getDeadlineTarget(value);
  return target ? target.getTime() - Date.now() : null;
}

export function formatCountdown(value) {
  const remaining = millisecondsUntil(value);
  if (remaining === null) return "";
  if (remaining <= 0) return "00h 00mn 00s";

  const totalSeconds = Math.floor(remaining / 1000);
  const days = Math.floor(totalSeconds / 86_400);
  const hours = Math.floor((totalSeconds % 86_400) / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);
  const seconds = totalSeconds % 60;

  if (days > 0) {
    return `${days}j ${String(hours).padStart(2, "0")}h ${String(minutes).padStart(2, "0")}mn`;
  }

  return `${String(hours).padStart(2, "0")}h ${String(minutes).padStart(2, "0")}mn ${String(seconds).padStart(2, "0")}s`;
}

export function slugify(value = "") {
  return String(value)
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/&/g, " et ")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 90);
}
