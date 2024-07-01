# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Dossier C:\ODIN créé."
} else {
    Write-Host "Dossier C:\ODIN existe déjà."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\AD ACL Scanner")) {
    New-Item -Path "C:\ODIN\AD ACL Scanner" -ItemType Directory
    Write-Host "Dossier C:\ODIN\AD ACL Scanner créé."
} else {
    Write-Host "Dossier C:\ODIN\AD ACL Scanner existe déjà."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://github.com/LoicVeirman/HardenAD/archive/refs/heads/Master.zip"
$zipPath = "C:\ODIN\AD ACL Scanner\AD-ACL-Scanner.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "Téléchargement de l'archive GitHub terminé."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\AD ACL Scanner"
Write-Host "Décompression de l'archive terminée."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Fichier zip supprimé."

