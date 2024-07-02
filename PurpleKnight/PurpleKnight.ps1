# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Folder C:\ODIN created."
} else {
    Write-Host "Folder C:\ODIN already exist."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\PurpleKnight")) {
    New-Item -Path "C:\ODIN\PurpleKnight" -ItemType Directory
    Write-Host "Folder C:\ODIN\PurpleKnight created."
} else {
    Write-Host "Folder C:\ODIN\PurpleKnight already exist."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://semperis.com/downloads/tools/pk/PurpleKnight-Community.zip"
$zipPath = "C:\ODIN\PurpleKnight\PurpleKnight.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "GitHub archive download completed."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\PurpleKnight"
Write-Host "Archive decompression completed."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Zip file deleted."
