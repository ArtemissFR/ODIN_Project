# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Dossier C:\ODIN créé."
} else {
    Write-Host "Dossier C:\ODIN existe déjà."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\Harden-AD")) {
    New-Item -Path "C:\ODIN\Harden-AD" -ItemType Directory
    Write-Host "Dossier C:\ODIN\Harden-AD créé."
} else {
    Write-Host "Dossier C:\ODIN\Hello-My-Dir existe déjà."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://github.com/LoicVeirman/HardenAD/archive/refs/heads/Master.zip"
$zipPath = "C:\ODIN\Harden-AD\Harden-AD.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "Téléchargement de l'archive GitHub terminé."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\Harden-AD"
Write-Host "Décompression de l'archive terminée."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Fichier zip supprimé."
