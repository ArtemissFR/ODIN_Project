# Chargement des Assemblies nécessaires
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Chemin vers les fichiers que tu veux débloquer
$scriptRunHardenAD = "C:\ODIN\Harden-AD\HardenAD-Master\HardenAD.ps1"
$scriptRunHardenADGui = "C:\ODIN\Harden-AD\HardenAD-Master\Run-HardenADGui.ps1"

# Utilisation de la cmdlet Unblock-File
Unblock-File -Path $scriptRunHardenAD
Unblock-File -Path $scriptRunHardenADGui

# Création de la Forme
$form = New-Object System.Windows.Forms.Form
$form.Text = "[ODIN] - HardenAD"
$form.Size = New-Object System.Drawing.Size(300,300)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# Création des Boutons
$button1 = New-Object System.Windows.Forms.Button
$button1.Location = New-Object System.Drawing.Point(50,50)
$button1.Size = New-Object System.Drawing.Size(200,30)
$button1.Text = "Config Harden-AD"
$button1.Add_Click({
    $hardenad_path = "C:\ODIN\Harden-AD\HardenAD-Master"
    Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $hardenad_path; .\HardenAD`""
})

$button2 = New-Object System.Windows.Forms.Button
$button2.Location = New-Object System.Drawing.Point(50,90)
$button2.Size = New-Object System.Drawing.Size(200,30)
$button2.Text = "Launch Harden-AD"
$button2.Add_Click({
    $hardenad_path = "C:\ODIN\Harden-AD\HardenAD-Master"
    Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $hardenad_path; .\Run-HardenADGui`""
})

$buttonCancel = New-Object System.Windows.Forms.Button
$buttonCancel.Location = New-Object System.Drawing.Point(50,130)
$buttonCancel.Size = New-Object System.Drawing.Size(200,30)
$buttonCancel.Text = "Terminer"
$buttonCancel.Add_Click({
    $form.Close()
})

# Ajout des contrôles à la Forme
$form.Controls.Add($button1) # Config Harden-AD
$form.Controls.Add($button2) # Launch Harden-AD
$form.Controls.Add($buttonCancel) # Terminer

# Affichage de la Forme
$form.ShowDialog()
