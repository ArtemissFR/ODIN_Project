# Import the required .NET namespaces
Add-Type -AssemblyName PresentationFramework

# Create the main window
$window = New-Object System.Windows.Window
$window.Title = "PowerShell GUI"
$window.Width = 800
$window.Height = 600

# Create a Grid layout
$grid = New-Object System.Windows.Controls.Grid

# Define the columns
$col1 = New-Object System.Windows.Controls.ColumnDefinition
$col1.Width = "200"
$col2 = New-Object System.Windows.Controls.ColumnDefinition
$col2.Width = "*"
$grid.ColumnDefinitions.Add($col1)
$grid.ColumnDefinitions.Add($col2)

# Define the rows
$row1 = New-Object System.Windows.Controls.RowDefinition
$row1.Height = "Auto"
$row2 = New-Object System.Windows.Controls.RowDefinition
$row2.Height = "*"
$grid.RowDefinitions.Add($row1)
$grid.RowDefinitions.Add($row2)

# Create the search box panel
$searchPanel = New-Object System.Windows.Controls.StackPanel
$searchPanel.Orientation = "Horizontal"
[System.Windows.Controls.Grid]::SetColumn($searchPanel, 0)
[System.Windows.Controls.Grid]::SetRow($searchPanel, 0)

# Create the search box
$searchBox = New-Object System.Windows.Controls.TextBox
$searchBox.Width = 150
$searchBox.Margin = "10,10,10,10"
$searchPanel.Children.Add($searchBox)

# Create the button panel on the left
$buttonPanel = New-Object System.Windows.Controls.StackPanel
$buttonPanel.Orientation = "Vertical"
$buttonPanel.HorizontalAlignment = "Center"
[System.Windows.Controls.Grid]::SetColumn($buttonPanel, 0)
[System.Windows.Controls.Grid]::SetRow($buttonPanel, 1)

# Create the text box on the right for displaying results
$resultBox = New-Object System.Windows.Controls.TextBox
$resultBox.AcceptsReturn = $true
$resultBox.VerticalScrollBarVisibility = "Auto"
$resultBox.HorizontalScrollBarVisibility = "Auto"
$resultBox.Margin = "10"
[System.Windows.Controls.Grid]::SetColumn($resultBox, 1)
[System.Windows.Controls.Grid]::SetRow($resultBox, 0)
[System.Windows.Controls.Grid]::SetRowSpan($resultBox, 2)

# Function to create a button
function Create-Button {
    param (
        [string]$buttonContent,
        [scriptblock]$scriptBlock
    )
    $button = New-Object System.Windows.Controls.Button
    $button.Content = $buttonContent
    $button.Margin = "5"
    $button.Width = 150
    $button.Add_Click({
        $result = & $scriptBlock
        $resultBox.Text += "$result`n"
    })
    $button
}

# Add buttons to the button panel
$buttons = @(
    @{ Name = "Command 1"; Script = { Get-Process } },
    @{ Name = "Command 2"; Script = { Get-Service } },
    @{ Name = "Command 3"; Script = { Get-EventLog -LogName System -Newest 10 } }
)

$buttonControls = @()

foreach ($btn in $buttons) {
    $button = Create-Button -buttonContent $btn.Name -scriptBlock $btn.Script
    $buttonPanel.Children.Add($button)
    $buttonControls += $button
}

# Add search functionality
$searchBox.Add_TextChanged({
    $searchText = $searchBox.Text.ToLower()
    $buttonPanel.Children.Clear()
    foreach ($button in $buttonControls) {
        if ($button.Content.ToString().ToLower().Contains($searchText)) {
            $buttonPanel.Children.Add($button)
        }
    }
})

# Add the search panel and the button panel to the grid
$grid.Children.Add($searchPanel)
$grid.Children.Add($buttonPanel)
$grid.Children.Add($resultBox)

# Set the content of the window to the grid
$window.Content = $grid

# Show the window
$window.ShowDialog()
