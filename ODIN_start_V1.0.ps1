# Chargement des Assemblies nécessaires
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Chemin vers les fichiers que tu veux débloquer
$scriptHelloMyDir = "Hello-My-Dir\Hello_My_Dir.ps1"
$scriptHardenADStart = "Harden-AD\Harden-AD_start.ps1"

# Utilisation de la cmdlet Unblock-File
Unblock-File -Path $scriptHelloMyDir
Unblock-File -Path $scriptHardenADStart

# Création de la Forme
$form = New-Object System.Windows.Forms.Form
$form.Text = "[ODIN] - Start"
$form.Size = New-Object System.Drawing.Size(300,500)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# Création des Boutons
$button1 = New-Object System.Windows.Forms.Button
$button1.Location = New-Object System.Drawing.Point(50,50)
$button1.Size = New-Object System.Drawing.Size(200,30)
$button1.Text = "Hello-My-Dir"
$button1.Add_Click({
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir.ps1"
    # Attendre que le premier script se termine avant d'exécuter le second script
    Start-Sleep -Seconds 30 # Ajuste le temps d'attente si nécessaire
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir_Config.ps1"
})

$button2 = New-Object System.Windows.Forms.Button
$button2.Location = New-Object System.Drawing.Point(50,90)
$button2.Size = New-Object System.Drawing.Size(200,30)
$button2.Text = "Harden-AD (in progress ...)"
$button2.Add_Click({
    Start-Process powershell -ArgumentList "-File Harden-AD\Harden-AD_start.ps1"
})

$button3 = New-Object System.Windows.Forms.Button
$button3.Location = New-Object System.Drawing.Point(50,130)
$button3.Size = New-Object System.Drawing.Size(200,30)
$button3.Text = "PingCastle"
$button3.Add_Click({
    $pingcastle_path = "C:\ODIN\PingCastle"
    Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $pingcastle_path; .\PingCastle.exe`""
})

$button4 = New-Object System.Windows.Forms.Button
$button4.Location = New-Object System.Drawing.Point(50,170)
$button4.Size = New-Object System.Drawing.Size(200,30)
$button4.Text = "PurpleKnight"
$button4.Add_Click({
    $purpleknight_path = "C:\ODIN\PurpleKnight"
    Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $purpleknight_path; .\PurpleKnight.exe`""
})

$buttonCancel = New-Object System.Windows.Forms.Button
$buttonCancel.Location = New-Object System.Drawing.Point(50,210)
$buttonCancel.Size = New-Object System.Drawing.Size(200,30)
$buttonCancel.Text = "Terminer"
$buttonCancel.Add_Click({
    $form.Close()
})

# Ajout des contrôles à la Forme
$form.Controls.Add($button1) # Hello-My-Dir
$form.Controls.Add($button2) # Harden-AD
$form.Controls.Add($button3) # PingCastle
$form.Controls.Add($button4) # PurpleKnight
$form.Controls.Add($buttonCancel) # Terminer

# Affichage de la Forme
$form.ShowDialog()
