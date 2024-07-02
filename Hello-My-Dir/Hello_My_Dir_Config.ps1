# Copie le fichier RunSetup.xml dans le dossier décompressé
$sourcePath = "Hello-My-Dir\Configuration\RunSetup.xml"
$destinationPath = "C:\ODIN\Hello-My-Dir\Hello-My-Dir-main\Configuration\RunSetup.xml"

if (-Not (Test-Path -Path $destinationPath)) {
    Copy-Item -Path $sourcePath -Destination $destinationPath
    Write-Host "File RunSetup.xml copied successfully."
} else {
    Write-Host "The file RunSetup.xml already exists in the destination folder."
}
