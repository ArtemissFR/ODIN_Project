# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Folder C:\ODIN created."
} else {
    Write-Host "Folder C:\ODIN already exist."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\Hello-My-Dir")) {
    New-Item -Path "C:\ODIN\Hello-My-Dir" -ItemType Directory
    Write-Host "Folder C:\ODIN\Hello-My-Dir created."
} else {
    Write-Host "Folder C:\ODIN\Hello-My-Dir already exist."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://github.com/LoicVeirman/Hello-My-Dir/archive/refs/heads/main.zip"
$zipPath = "C:\ODIN\Hello-My-Dir\Hello-My-Dir.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "GitHub archive download completed."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\Hello-My-Dir"
Write-Host "Archive decompression completed."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Zip file deleted."
