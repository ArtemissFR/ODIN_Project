# Chargement des Assemblies nécessaires
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Chemin vers les fichiers que tu veux débloquer
$scriptHardenADStart = "Harden-AD\Harden-AD_start.ps1"
$scriptADACLScanner = "AD ACL Scanner\ADACLScan.ps1"

# Utilisation de la cmdlet Unblock-File
Unblock-File -Path $scriptHardenADStart

# Création de la Forme
$form = New-Object System.Windows.Forms.Form
$form.Text = "[ODIN] - APPLICATION LAUNCHER"
$form.Size = New-Object System.Drawing.Size(300,400)
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
$button2.Text = "Execute Harden-AD"
$button2.Add_Click({
    Start-Process powershell -ArgumentList "-File Harden-AD\Harden-AD_start.ps1"
})

$button3 = New-Object System.Windows.Forms.Button
$button3.Location = New-Object System.Drawing.Point(50,130)
$button3.Size = New-Object System.Drawing.Size(200,30)
$button3.Text = "Execute PingCastle"
$button3.Add_Click({
    $pingcastle_path = "C:\ODIN\PingCastle"
    Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $pingcastle_path; .\PingCastle.exe`""
})

$button4 = New-Object System.Windows.Forms.Button
$button4.Location = New-Object System.Drawing.Point(50,170)
$button4.Size = New-Object System.Drawing.Size(200,30)
$button4.Text = "Execute PurpleKnight"
$button4.Add_Click({
    $purpleknight_path = "C:\ODIN\PurpleKnight\PK Community 4.2"
    Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $purpleknight_path; .\PurpleKnight.exe`""
})

$button5 = New-Object System.Windows.Forms.Button
$button5.Location = New-Object System.Drawing.Point(50,210)
$button5.Size = New-Object System.Drawing.Size(200,30)
$button5.Text = "Execute AD ACL Scanner"
$button5.Add_Click({
    $adaclscanner_path = "C:\ODIN\AD ACL Scanner\ADACLScanner-master"
    Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $adaclscanner_path; .\ADACLScan.ps1`""
})

$buttonCancel = New-Object System.Windows.Forms.Button
$buttonCancel.Location = New-Object System.Drawing.Point(50,250)
$buttonCancel.Size = New-Object System.Drawing.Size(200,30)
$buttonCancel.Text = "Finish"
$buttonCancel.Add_Click({
    $form.Close()
})

# Ajout des contrôles à la Forme
$form.Controls.Add($button1) # Hello-My-Dir
$form.Controls.Add($button2) # Harden-AD
$form.Controls.Add($button3) # PingCastle
$form.Controls.Add($button4) # PurpleKnight
$form.Controls.Add($button5) # PurpleKnight
$form.Controls.Add($buttonCancel) # Terminer

# Affichage de la Forme
$form.ShowDialog()
