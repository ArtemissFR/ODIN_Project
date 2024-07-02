# Importation des modules nécessaires
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Création de la fenêtre principale
$form = New-Object System.Windows.Forms.Form
$form.Text = "Mon Interface GUI"
$form.Size = New-Object System.Drawing.Size(800, 600)
$form.StartPosition = "CenterScreen"

# Création de la partie gauche (Panneau des boutons et barre de recherche)
$leftPanel = New-Object System.Windows.Forms.Panel
$leftPanel.Size = New-Object System.Drawing.Size(300, 600)
$leftPanel.Dock = [System.Windows.Forms.DockStyle]::Left

# Barre de recherche
$searchBox = New-Object System.Windows.Forms.TextBox
$searchBox.Size = New-Object System.Drawing.Size(280, 20)
$searchBox.Location = New-Object System.Drawing.Point(10, 10)
$leftPanel.Controls.Add($searchBox)

# Panneau pour les boutons
$buttonPanel = New-Object System.Windows.Forms.Panel
$buttonPanel.Size = New-Object System.Drawing.Size(280, 550)
$buttonPanel.Location = New-Object System.Drawing.Point(10, 40)
$leftPanel.Controls.Add($buttonPanel)

# Liste de boutons
$buttons = @()
$commands = @{
    "Commande 1" = { Write-Output "Exécution de la commande 1" }
    "Commande 2" = { Write-Output "Exécution de la commande 2" }
    "Commande 3" = { Write-Output "Exécution de la commande 3" }
}

# Fonction pour créer les boutons
function Create-Buttons {
    $buttonPanel.Controls.Clear()
    $filteredCommands = $commands.Keys | Where-Object { $_ -like "*$($searchBox.Text)*" }
    $yPos = 10
    foreach ($command in $filteredCommands) {
        $button = New-Object System.Windows.Forms.Button
        $button.Text = $command
        $button.Size = New-Object System.Drawing.Size(260, 30)
        $button.Location = New-Object System.Drawing.Point(10, $yPos)
        $button.Add_Click({
            $outputBox.Text = & $commands[$command]
        })
        $buttonPanel.Controls.Add($button)
        $buttons += $button
        $yPos += 40
    }
}

# Initialiser les boutons
Create-Buttons

# Ajouter un événement pour la barre de recherche
$searchBox.Add_TextChanged({
    Create-Buttons
})

# Création de la partie droite (Affichage des résultats)
$rightPanel = New-Object System.Windows.Forms.Panel
$rightPanel.Size = New-Object System.Drawing.Size(500, 600)
$rightPanel.Dock = [System.Windows.Forms.DockStyle]::Fill

# Zone de texte pour afficher les résultats
$outputBox = New-Object System.Windows.Forms.TextBox
$outputBox.Multiline = $true
$outputBox.Size = New-Object System.Drawing.Size(480, 560)
$outputBox.Location = New-Object System.Drawing.Point(10, 10)
$outputBox.ScrollBars = [System.Windows.Forms.ScrollBars]::Vertical
$rightPanel.Controls.Add($outputBox)

# Ajout des panneaux à la fenêtre principale
$form.Controls.Add($leftPanel)
$form.Controls.Add($rightPanel)

# Affichage de la fenêtre
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
