# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Dossier C:\ODIN créé."
} else {
    Write-Host "Dossier C:\ODIN existe déjà."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\PingCastle")) {
    New-Item -Path "C:\ODIN\PingCastle" -ItemType Directory
    Write-Host "Dossier C:\ODIN\PingCastle créé."
} else {
    Write-Host "Dossier C:\ODIN\PingCastle existe déjà."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://github.com/vletoux/pingcastle/releases/download/3.2.0.1/PingCastle_3.2.0.1.zip"
$zipPath = "C:\ODIN\PingCastle\PingCastle.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "Téléchargement de l'archive GitHub terminé."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\PingCastle"
Write-Host "Décompression de l'archive terminée."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Fichier zip supprimé."
