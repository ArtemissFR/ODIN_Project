# Chargement des Assemblies nécessaires
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Création de la fenêtre principale
$form = New-Object System.Windows.Forms.Form
$form.Text = "ODIN GUI"
$form.Size = New-Object System.Drawing.Size(400,300)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# Création du Panel avec barre de défilement
$panel = New-Object System.Windows.Forms.Panel
$panel.Location = New-Object System.Drawing.Point(0,0)
$panel.Size = New-Object System.Drawing.Size(400,300)
$panel.AutoScroll = $true

# Calcul de la position horizontale pour centrer les boutons
$buttonWidth = 300
$formWidth = $panel.ClientSize.Width
$centerX = ($formWidth - $buttonWidth) / 2

# Création des boutons
$buttons = @()

$button1 = New-Object System.Windows.Forms.Button
$button1.Location = New-Object System.Drawing.Point($centerX, 50)
$button1.Size = New-Object System.Drawing.Size($buttonWidth, 30)
$button1.Text = "Start command 1"
$button1.Add_Click({
    Execute-Command1
})
$buttons += $button1

$button2 = New-Object System.Windows.Forms.Button
$button2.Location = New-Object System.Drawing.Point($centerX, 100)
$button2.Size = New-Object System.Drawing.Size($buttonWidth, 30)
$button2.Text = "Start command 2"
$button2.Add_Click({
    Execute-Command2
})
$buttons += $button2

$button3 = New-Object System.Windows.Forms.Button
$button3.Location = New-Object System.Drawing.Point($centerX, 150)
$button3.Size = New-Object System.Drawing.Size($buttonWidth, 30)
$button3.Text = "Start command 3"
$button3.Add_Click({
    Execute-Command3
})
$buttons += $button3

# Ajout des boutons au Panel
foreach ($button in $buttons) {
    $panel.Controls.Add($button)
}

# Ajout du Panel à la fenêtre principale
$form.Controls.Add($panel)

# Affichage de la fenêtre
$form.Add_Shown({ $form.Activate() })
[System.Windows.Forms.Application]::Run($form)
