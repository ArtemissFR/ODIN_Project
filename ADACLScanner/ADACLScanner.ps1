# Vérifie si le dossier C:\ODIN existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN")) {
    New-Item -Path "C:\ODIN" -ItemType Directory
    Write-Host "Folder C:\ODIN created."
} else {
    Write-Host "Folder C:\ODIN already exist."
}

# Vérifie si le dossier C:\ODIN\Hello-My-Dir existe, sinon le créer
if (-Not (Test-Path -Path "C:\ODIN\AD ACL Scanner")) {
    New-Item -Path "C:\ODIN\AD ACL Scanner" -ItemType Directory
    Write-Host "Folder C:\ODIN\AD ACL Scanner created."
} else {
    Write-Host "Folder C:\ODIN\AD ACL Scanner already existt."
}

# Télécharge le fichier zip depuis GitHub
$zipUrl = "https://github.com/canix1/ADACLScanner/archive/refs/heads/master.zip"
$zipPath = "C:\ODIN\AD ACL Scanner\AD-ACL-Scanner.zip"

Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
Write-Host "GitHub archive download completed."

# Décompresse le fichier zip téléchargé
Expand-Archive -Path $zipPath -DestinationPath "C:\ODIN\AD ACL Scanner"
Write-Host "Archive decompression completed."

# Supprime le fichier zip après décompression
Remove-Item -Path $zipPath
Write-Host "Zip file deleted."

