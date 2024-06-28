# Définir l'URL de téléchargement et l'emplacement du fichier
$url = "https://github.com/malvuln/RansomLord/releases/download/v3/RansomLord_v3.1.exe"
$destinationPath = "C:\ODIN\RansomLord\RansomLord_v3.1.exe"

# Créer le dossier si il n'existe pas
if (-Not (Test-Path "C:\ODIN")) {
    New-Item -ItemType Directory -Path "C:\ODIN"
}

# Créer le dossier si il n'existe pas
if (-Not (Test-Path "C:\ODIN\RansomLord")) {
    New-Item -ItemType Directory -Path "C:\ODIN\RansomLord"
}

# Télécharger le fichier
Invoke-WebRequest -Uri $url -OutFile $destinationPath

# Changer de répertoire
Set-Location "C:\ODIN\RansomLord"

# Exécuter le fichier avec les paramètres
Start-Process -FilePath ".\RansomLord_v3.1.exe" -ArgumentList "-g" -Wait

# Si une entrée est nécessaire, envoyer une touche "Entrée"
#Start-Sleep -Seconds 2
#[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
