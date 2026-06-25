/**
 * PM2 Ecosystem — Emplois Burkina
 *
 * Démarrer :             pm2 start ecosystem.config.cjs
 * Statut :               pm2 status
 * Logs en direct :       pm2 logs
 * Logs processus web :   pm2 logs emplois-burkina-web
 * Arrêter :              pm2 stop all
 * Redémarrer :           pm2 restart all
 * Activer au boot :      pm2 startup  → suivre l'instruction → pm2 save
 */
const path = require("path");
const ROOT = __dirname;

module.exports = {
  apps: [
    // ── 1. API NestJS — scraping cron intégré (toutes les 45 min) ──
    {
      name: "emplois-burkina-api",
      cwd: ROOT,
      script: path.join("scripts", "start-api.mjs"),
      watch: false,
      autorestart: true,
      max_restarts: 20,
      restart_delay: 5000,
      env: {
        NODE_ENV: "development",
        PORT: "4000",
        EMPLOIS_BURKINA_AUTOMATION_INTERVAL_MINUTES: "45",
        EMPLOIS_BURKINA_AUTOMATION_RUN_ON_START: "true"
      },
      error_file: path.join(ROOT, "logs", "api-error.log"),
      out_file: path.join(ROOT, "logs", "api-out.log"),
      merge_logs: true,
      log_date_format: "YYYY-MM-DD HH:mm:ss"
    },

    // ── 2. Front-end Next.js ──
    {
      name: "emplois-burkina-web",
      cwd: ROOT,
      script: path.join("scripts", "start-web.mjs"),
      watch: false,
      autorestart: true,
      max_restarts: 20,
      restart_delay: 5000,
      env: {
        NODE_ENV: "development",
        PORT: "3000"
      },
      error_file: path.join(ROOT, "logs", "web-error.log"),
      out_file: path.join(ROOT, "logs", "web-out.log"),
      merge_logs: true,
      log_date_format: "YYYY-MM-DD HH:mm:ss"
    },

    // ── 3. Daemon scraper autonome (toutes les 60 min, fallback) ──
    {
      name: "emplois-burkina-scraper",
      cwd: ROOT,
      script: path.join("scripts", "automation-daemon.mjs"),
      watch: false,
      autorestart: true,
      max_restarts: 10,
      restart_delay: 30000,
      env: {
        EMPLOIS_BURKINA_AUTOMATION_INTERVAL_MINUTES: "60",
        EMPLOIS_BURKINA_AUTOMATION_RUN_ON_START: "false",
        NODE_ENV: "production"
      },
      error_file: path.join(ROOT, "logs", "scraper-error.log"),
      out_file: path.join(ROOT, "logs", "scraper-out.log"),
      merge_logs: true,
      log_date_format: "YYYY-MM-DD HH:mm:ss"
    }
  ]
};
