# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Folder C:\ODIN created."
} else {
    Write-Host "Folder C:\ODIN already exist."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\PingCastle")) {
    New-Item -Path "C:\ODIN\PingCastle" -ItemType Directory
    Write-Host "Folder C:\ODIN\PingCastle created."
} else {
    Write-Host "Folder C:\ODIN\PingCastle already exist."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://github.com/vletoux/pingcastle/releases/download/3.2.0.1/PingCastle_3.2.0.1.zip"
$zipPath = "C:\ODIN\PingCastle\PingCastle.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "GitHub archive download completed."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\PingCastle"
Write-Host "Archive decompression completed."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Zip file deleted."
