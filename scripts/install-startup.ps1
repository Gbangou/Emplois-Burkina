# Installe Emplois Burkina dans le dossier Startup Windows
# Lance: PM2 avec tous les processus au démarrage de Windows

$startupFolder = [Environment]::GetFolderPath("Startup")
$projectRoot = Split-Path $PSScriptRoot -Parent
$shortcutPath = Join-Path $startupFolder "Emplois Burkina.lnk"

# Créer le raccourci dans le dossier Startup
$wsh = New-Object -ComObject WScript.Shell
$shortcut = $wsh.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-WindowStyle Hidden -Command `"cd '$projectRoot'; pm2 resurrect`""
$shortcut.WorkingDirectory = $projectRoot
$shortcut.Description = "Emplois Burkina — Démarre la plateforme automatiquement"
$shortcut.IconLocation = "powershell.exe,0"
$shortcut.Save()

Write-Host "✅ Emplois Burkina ajouté au démarrage Windows !"
Write-Host "   Raccourci créé dans : $shortcutPath"
Write-Host ""
Write-Host "   Au prochain démarrage de Windows, Emplois Burkina se lancera automatiquement."
Write-Host "   Pour démarrer maintenant : pm2 resurrect"
