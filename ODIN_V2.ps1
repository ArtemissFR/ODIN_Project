# Chargement des Assemblies nécessaires
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Chemin vers les fichiers que tu veux débloquer
$scripts = @(
    "Hello-My-Dir\Hello_My_Dir.ps1",
    "Hello-My-Dir\Hello_My_Dir_Config.ps1"
    "RansomLord\RansomLord_v3.1.ps1",
    "PingCastle\PingCastle.ps1",
    "PurpleKnight\PurpleKnight.ps1",
    # Ajoute d'autres scripts si nécessaire
)

# Débloquer tous les scripts
$scripts | ForEach-Object {
    Unblock-File -Path $_
}

# Création de la Forme
$form = New-Object System.Windows.Forms.Form
$form.Text = "Choix d'Options"
$form.Size = New-Object System.Drawing.Size(300, 200)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# Création du bouton de lancement
$buttonLaunch = New-Object System.Windows.Forms.Button
$buttonLaunch.Location = New-Object System.Drawing.Point(50, 50)
$buttonLaunch.Size = New-Object System.Drawing.Size(200, 30)
$buttonLaunch.Text = "Démarrer les scripts"
$buttonLaunch.Add_Click({
    # Lancer les scripts un par un dans l'ordre
    foreach ($script in $scripts) {
        Start-Process powershell -ArgumentList "-File $script"
        # Attendre que le script actuel se termine avant de continuer
        Start-Sleep -Seconds 5 # Temps d'attente ajustable
    }
    $form.Close()
})

# Création du bouton d'annulation
$buttonCancel = New-Object System.Windows.Forms.Button
$buttonCancel.Location = New-Object System.Drawing.Point(50, 100)
$buttonCancel.Size = New-Object System.Drawing.Size(200, 30)
$buttonCancel.Text = "Annuler"
$buttonCancel.Add_Click({
    $form.Close()
})

# Ajout des contrôles à la Forme
$form.Controls.Add($buttonLaunch)
$form.Controls.Add($buttonCancel)

# Affichage de la Forme
$form.ShowDialog()
