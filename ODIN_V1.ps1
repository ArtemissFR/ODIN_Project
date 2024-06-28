# Chargement des Assemblies nécessaires
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Chemin vers les fichiers que tu veux débloquer
$scriptHelloMyDir = "Hello-My-Dir\Hello_My_Dir.ps1"
$scriptHelloMyDirConfig = "Hello-My-Dir\Hello_My_Dir_Config.ps1"
$scriptPingCastle = "PingCastle\PingCastle.ps1"
$scriptRansomLord = "RansomLord\RansomLord_v3.1.ps1"
$scriptODIN = "ODIN_V1.ps1"

# Utilisation de la cmdlet Unblock-File
Unblock-File -Path $scriptHelloMyDir
Unblock-File -Path $scriptHelloMyDirConfig
Unblock-File -Path $scriptPingCastle
Unblock-File -Path $scriptRansomLord
Unblock-File -Path $scriptODIN

# Chemin vers ton image PNG
$imagePath = "Documentation/.files/ODIN_logo.png"

# Chargement de l'image depuis le fichier
$image = [System.Drawing.Image]::FromFile($imagePath)

# Création de la Forme
$form = New-Object System.Windows.Forms.Form
$form.Text = "Choix d'Options"
$form.Size = New-Object System.Drawing.Size(300,300)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# Création d'un PictureBox pour afficher l'image
$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Image = $image
$pictureBox.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$pictureBox.Location = New-Object System.Drawing.Point(50, 10)  # Ajuste la position en fonction de tes besoins

# Création des Boutons
$button1 = New-Object System.Windows.Forms.Button
$button1.Location = New-Object System.Drawing.Point(50,50)
$button1.Size = New-Object System.Drawing.Size(200,30)
$button1.Text = "PingCastle"
$button1.Add_Click({
    Start-Process powershell -ArgumentList "-File PingCastle\PingCastle.ps1"
    $form.Close()
})

$button2 = New-Object System.Windows.Forms.Button
$button2.Location = New-Object System.Drawing.Point(50,90)
$button2.Size = New-Object System.Drawing.Size(200,30)
$button2.Text = "RansomLord"
$button2.Add_Click({
    Start-Process powershell -ArgumentList "-File RansomLord\RansomLord_v3.1.ps1"
    $form.Close()
})

$button3 = New-Object System.Windows.Forms.Button
$button3.Location = New-Object System.Drawing.Point(50,130)
$button3.Size = New-Object System.Drawing.Size(200,30)
$button3.Text = "Hello-My-Dir"
$button3.Add_Click({
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir.ps1"
    # Attendre que le premier script se termine avant d'exécuter le second script
    Start-Sleep -Seconds 30 # Ajuste le temps d'attente si nécessaire
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir_Config.ps1"
    $form.Close()
})

$button4 = New-Object System.Windows.Forms.Button
$button4.Location = New-Object System.Drawing.Point(50,170)
$button4.Size = New-Object System.Drawing.Size(200,30)
$button4.Text = "HardenAD (in progress...)"
$button4.Add_Click({
    Start-Process powershell -ArgumentList "-File Harden-AD\HardenAD.ps1"
    $form.Close()
})

$buttonCancel = New-Object System.Windows.Forms.Button
$buttonCancel.Location = New-Object System.Drawing.Point(50,210)
$buttonCancel.Size = New-Object System.Drawing.Size(200,30)
$buttonCancel.Text = "Annuler"
$buttonCancel.Add_Click({
    $form.Close()
})

# Ajout des contrôles à la Forme
$form.Controls.Add($pictureBox)
$form.Controls.Add($button1)
$form.Controls.Add($button2)
$form.Controls.Add($button3)
$form.Controls.Add($button4)
$form.Controls.Add($buttonCancel)

# Calcul de la taille totale de la forme
$formSizeHeight = 250 + $pictureBox.Height  # Ajuste la hauteur totale en fonction de la position des boutons et de l'image
$form.Size = New-Object System.Drawing.Size(300, $formSizeHeight)

# Affichage de la Forme
$form.ShowDialog()
