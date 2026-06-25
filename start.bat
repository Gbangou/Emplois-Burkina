@echo off
title Emplois Burkina — Démarrage
cd /d "%~dp0"

echo.
echo  ========================================
echo   Emplois Burkina — Lancement de la plateforme
echo  ========================================
echo.

:: Vérifier que PM2 est installé
where pm2 >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERREUR] PM2 non trouvé. Installation...
    npm install -g pm2
)

:: Arrêter les anciens processus si présents
echo [1/3] Nettoyage des anciens processus...
pm2 delete all 2>nul

:: Créer le dossier logs si absent
if not exist logs mkdir logs

:: Lancer tous les processus
echo [2/3] Lancement des processus...
pm2 start ecosystem.config.cjs

:: Afficher le statut
echo.
echo [3/3] Statut des processus :
pm2 status

echo.
echo  ========================================
echo   Emplois Burkina est en cours de démarrage !
echo.
echo   Front-end :  http://localhost:3000
echo   API :        http://localhost:4000
echo   Logs :       pm2 logs
echo   Arrêter :    pm2 stop all
echo  ========================================
echo.
pause
