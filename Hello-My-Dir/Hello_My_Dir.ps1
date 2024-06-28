# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Dossier C:\ODIN créé."
} else {
    Write-Host "Dossier C:\ODIN existe déjà."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\Hello-My-Dir")) {
    New-Item -Path "C:\ODIN\Hello-My-Dir" -ItemType Directory
    Write-Host "Dossier C:\ODIN\Hello-My-Dir créé."
} else {
    Write-Host "Dossier C:\ODIN\Hello-My-Dir existe déjà."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://github.com/LoicVeirman/Hello-My-Dir/archive/refs/heads/main.zip"
$zipPath = "C:\ODIN\Hello-My-Dir\Hello-My-Dir.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "Téléchargement de l'archive GitHub terminé."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\Hello-My-Dir"
Write-Host "Décompression de l'archive terminée."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Fichier zip supprimé."

# Copie le fichier RunSetup.xml dans le dossier décompressé
$sourcePath = "Configuration\RunSetup.xml"
$destinationPath = "C:\ODIN\Hello-My-Dir\Hello-My-Dir-main\Configuration\RunSetup.xml"

if (-Not (Test-Path -Path $destinationPath)) {
    Copy-Item -Path $sourcePath -Destination $destinationPath
    Write-Host "Fichier RunSetup.xml copié avec succès."
} else {
    Write-Host "Le fichier RunSetup.xml existe déjà dans le dossier destination."
}
