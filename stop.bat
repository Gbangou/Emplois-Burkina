@echo off
title Emplois Burkina — Arrêt
cd /d "%~dp0"
echo Arrêt de tous les processus Emplois Burkina...
pm2 stop all
pm2 delete all
echo Terminé.
pause
