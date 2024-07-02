Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Création du formulaire
$form = New-Object System.Windows.Forms.Form
$form.Text = "Interface Utilisateur PowerShell"
$form.Size = New-Object System.Drawing.Size(500, 400)
$form.StartPosition = "CenterScreen"

# Création de la barre de recherche
$searchBox = New-Object System.Windows.Forms.TextBox
$searchBox.Location = New-Object System.Drawing.Point(10, 10)
$searchBox.Size = New-Object System.Drawing.Size(460, 30)
$form.Controls.Add($searchBox)

# Création du panel pour les boutons
$buttonPanel = New-Object System.Windows.Forms.FlowLayoutPanel
$buttonPanel.Location = New-Object System.Drawing.Point(10, 50)
$buttonPanel.Size = New-Object System.Drawing.Size(460, 300)
$buttonPanel.FlowDirection = "TopDown"
$buttonPanel.WrapContents = $true
$buttonPanel.AutoScroll = $true
$form.Controls.Add($buttonPanel)

# Dictionnaire des commandes à exécuter
$commands = @{
    "Script 1" = { Write-Host "Exécution du Script 1"; Start-Sleep -Seconds 1 }
    "Script 2" = { Write-Host "Exécution du Script 2"; Start-Sleep -Seconds 1 }
    "Script 3" = { Write-Host "Exécution du Script 3"; Start-Sleep -Seconds 1 }
}

# Fonction pour mettre à jour les boutons en fonction de la recherche
function Update-Buttons {
    $searchText = $searchBox.Text.ToLower()
    $buttonPanel.Controls.Clear()
    foreach ($command in $commands.GetEnumerator()) {
        if ($command.Key.ToLower().Contains($searchText)) {
            $button = New-Object System.Windows.Forms.Button
            $button.Text = $command.Key
            $button.Width = 400
            $button.Add_Click({
                $command.Value.Invoke()
            })
            $buttonPanel.Controls.Add($button)
        }
    }
}

# Ajouter les boutons au départ
Update-Buttons

# Événement lors de la saisie dans la barre de recherche
$searchBox.Add_TextChanged({
    Update-Buttons
})

# Affichage du formulaire
$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()
