# Chargement des Assemblies nécessaires pour créer l'interface graphique
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Création de la Forme
$form = New-Object System.Windows.Forms.Form
$form.Text = "Choix d'Options"
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = "CenterScreen"

# Création des Boutons
$button1 = New-Object System.Windows.Forms.Button
$button1.Location = New-Object System.Drawing.Point(50,50)
$button1.Size = New-Object System.Drawing.Size(200,30)
$button1.Text = "PingCastle"
$button1.Add_Click({
    # Remplacer 'script1.ps1' par le chemin du premier script à exécuter
    Start-Process powershell -ArgumentList "-File script1.ps1"
    $form.Close()
})

$button2 = New-Object System.Windows.Forms.Button
$button2.Location = New-Object System.Drawing.Point(50,90)
$button2.Size = New-Object System.Drawing.Size(200,30)
$button2.Text = "RansomLord"
$button2.Add_Click({
    # Remplacer 'script2.ps1' par le chemin du second script à exécuter
    Start-Process powershell -ArgumentList "-File script2.ps1"
    $form.Close()
})

$button3 = New-Object System.Windows.Forms.Button
$button3.Location = New-Object System.Drawing.Point(50,130)
$button3.Size = New-Object System.Drawing.Size(200,30)
$button3.Text = "Hello-My-Dir"
$button3.Add_Click({
    # Remplacer 'script3.ps1' par le chemin du troisième script à exécuter
    Start-Process powershell -ArgumentList "-File script3.ps1"
    $form.Close()
})

# Ajout des Boutons à la Forme
$form.Controls.Add($button1)
$form.Controls.Add($button2)
$form.Controls.Add($button3)

# Affichage de la Forme
$form.ShowDialog()
