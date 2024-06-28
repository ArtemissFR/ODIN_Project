# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Dossier C:\ODIN créé."
} else {
    Write-Host "Dossier C:\ODIN existe déjà."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\PurpleKnight")) {
    New-Item -Path "C:\ODIN\PurpleKnight" -ItemType Directory
    Write-Host "Dossier C:\ODIN\PurpleKnight créé."
} else {
    Write-Host "Dossier C:\ODIN\PurpleKnight existe déjà."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://semperis.com/downloads/tools/pk/PurpleKnight-Community.zip"
$zipPath = "C:\ODIN\PurpleKnight\PurpleKnight.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "Téléchargement de l'archive GitHub terminé."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\PurpleKnight"
Write-Host "Décompression de l'archive terminée."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Fichier zip supprimé."
