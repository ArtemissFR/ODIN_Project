# Chemin vers les fichiers que tu veux débloquer
$scriptHelloMyDir = "Hello-My-Dir\Hello_My_Dir.ps1"
$scriptPingCastle = "PingCastle\PingCastle.ps1"
$scriptRansomLord = "RansomLord\RansomLord_v3.1.ps1"
$scriptODIN = "ODIN_V1.ps1"

# Utilisation de la cmdlet Unblock-File
Unblock-File -Path $scriptHelloMyDir
Unblock-File -Path $scriptPingCastle
Unblock-File -Path $scriptRansomLord
Unblock-File -Path $scriptODIN

# Optionnel : Afficher un message pour confirmer que le fichier est débloqué
Write-Output "Le fichier $scriptHelloMyDir a été débloqué."
Write-Output "Le fichier $scriptPingCastle a été débloqué."
Write-Output "Le fichier $scriptRansomLord a été débloqué."
Write-Output "Le fichier $scriptODIN a été débloqué."

# Chargement des Assemblies nécessaires pour créer l'interface graphique
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Création de la Forme
$form = New-Object System.Windows.Forms.Form
$form.Text = "Choix d'Options"
$form.Size = New-Object System.Drawing.Size(300,250)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# Création des Boutons
$button1 = New-Object System.Windows.Forms.Button
$button1.Location = New-Object System.Drawing.Point(50,50)
$button1.Size = New-Object System.Drawing.Size(200,30)
$button1.Text = "PingCastle"
$button1.Add_Click({
    # Remplacer 'PingCastle\PingCastle.ps1' par le chemin du premier script à exécuter
    Start-Process powershell -ArgumentList "-File PingCastle\PingCastle.ps1"
    $form.Close()
})

$button2 = New-Object System.Windows.Forms.Button
$button2.Location = New-Object System.Drawing.Point(50,90)
$button2.Size = New-Object System.Drawing.Size(200,30)
$button2.Text = "RansomLord"
$button2.Add_Click({
    # Remplacer 'RansomLord\RansomLord_v3.1.ps1' par le chemin du second script à exécuter
    Start-Process powershell -ArgumentList "-File RansomLord\RansomLord_v3.1.ps1"
    $form.Close()
})

$button3 = New-Object System.Windows.Forms.Button
$button3.Location = New-Object System.Drawing.Point(50,130)
$button3.Size = New-Object System.Drawing.Size(200,30)
$button3.Text = "Hello-My-Dir"
$button3.Add_Click({
    # Remplacer 'Hello-My-Dir\Hello_My_Dir.ps1' par le chemin du troisième script à exécuter
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir.ps1"
    # Attendre que le premier script se termine avant d'exécuter le second script
    Start-Sleep -Seconds 30 # Ajuste le temps d'attente si nécessaire
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir_Config.ps1"
    $form.Close()
})

$buttonCancel = New-Object System.Windows.Forms.Button
$buttonCancel.Location = New-Object System.Drawing.Point(50,170)
$buttonCancel.Size = New-Object System.Drawing.Size(200,30)
$buttonCancel.Text = "Annuler"
$buttonCancel.Add_Click({
    $form.Close()
})

# Ajout des Boutons à la Forme
$form.Controls.Add($button1)
$form.Controls.Add($button2)
$form.Controls.Add($button3)
$form.Controls.Add($buttonCancel)

# Affichage de la Forme
$form.ShowDialog()
