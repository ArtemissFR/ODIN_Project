Add-Type -AssemblyName PresentationFramework

# Création de la fenêtre principale
$window = New-Object system.windows.window
$window.Title = "PowerShell GUI"
$window.Width = 400
$window.Height = 600
$window.WindowStartupLocation = "CenterScreen"

# Création d'une Grid pour l'organisation des éléments
$grid = New-Object system.windows.controls.grid
$window.Content = $grid

# Ajout des lignes et colonnes à la Grid
$rowDef1 = New-Object system.windows.controls.rowdefinition
$rowDef1.Height = "Auto"
$grid.RowDefinitions.Add($rowDef1)

$rowDef2 = New-Object system.windows.controls.rowdefinition
$grid.RowDefinitions.Add($rowDef2)

# Création de la barre de recherche
$searchBox = New-Object system.windows.controls.textbox
$searchBox.Margin = "10"
$searchBox.Height = 30
$searchBox.VerticalAlignment = "Top"
[system.windows.controls.grid]::SetRow($searchBox, 0)
$grid.Children.Add($searchBox)

# Création d'une StackPanel pour les boutons
$buttonPanel = New-Object system.windows.controls.stackpanel
$buttonPanel.Orientation = "Vertical"
$buttonPanel.HorizontalAlignment = "Center"
$buttonPanel.VerticalAlignment = "Top"
$buttonPanel.Margin = "10"
[system.windows.controls.grid]::SetRow($buttonPanel, 1)
$grid.Children.Add($buttonPanel)

# Liste des scripts ou commandes
$scripts = @(
    @{Name="Script 1"; Command="Write-Host 'Script 1 executed'"},
    @{Name="Script 2"; Command="Write-Host 'Script 2 executed'"},
    @{Name="Script 3"; Command="Write-Host 'Script 3 executed'"},
    # Ajoute autant de scripts que nécessaire ici
)

# Fonction pour créer les boutons
function Create-Buttons {
    $buttonPanel.Children.Clear()
    $filteredScripts = $scripts | Where-Object { $_.Name -like "*$($searchBox.Text)*" }
    foreach ($script in $filteredScripts) {
        $button = New-Object system.windows.controls.button
        $button.Content = $script.Name
        $button.Margin = "5"
        $button.Width = 150
        $button.Add_Click({
            Invoke-Expression $script.Command
        })
        $buttonPanel.Children.Add($button)
    }
}

# Création initiale des boutons
Create-Buttons

# Ajout d'un événement pour mettre à jour les boutons en fonction de la recherche
$searchBox.Add_TextChanged({
    Create-Buttons
})

# Affichage de la fenêtre
$window.ShowDialog()
