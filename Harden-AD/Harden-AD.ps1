# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Folder C:\ODIN created."
} else {
    Write-Host "Folder C:\ODIN already exists."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\Harden-AD")) {
    New-Item -Path "C:\ODIN\Harden-AD" -ItemType Directory
    Write-Host "Folder C:\ODIN\Harden-AD created."
} else {
    Write-Host "Folder C:\ODIN\Harden-AD already exists."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://github.com/LoicVeirman/HardenAD/archive/refs/heads/Master.zip"
$zipPath = "C:\ODIN\Harden-AD\Harden-AD.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "GitHub archive download completed."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\Harden-AD"
Write-Host "Archive decompression completed."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Zip file deleted."
