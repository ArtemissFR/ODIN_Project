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
$row = New-Object System.Windows.Controls.RowDefinition
$row.Height = "*"
$grid.RowDefinitions.Add($row)

# Create the button panel on the left
$buttonPanel = New-Object System.Windows.Controls.StackPanel
$buttonPanel.Orientation = "Vertical"
[System.Windows.Controls.Grid]::SetColumn($buttonPanel, 0)

# Create the text box on the right for displaying results
$resultBox = New-Object System.Windows.Controls.TextBox
$resultBox.AcceptsReturn = $true
$resultBox.VerticalScrollBarVisibility = "Auto"
$resultBox.HorizontalScrollBarVisibility = "Auto"
[System.Windows.Controls.Grid]::SetColumn($resultBox, 1)

# Function to create a button
function Create-Button {
    param (
        [string]$buttonContent,
        [scriptblock]$scriptBlock
    )
    $button = New-Object System.Windows.Controls.Button
    $button.Content = $buttonContent
    $button.Add_Click({
        $result = & $scriptBlock
        $resultBox.Text += "$result`n"
    })
    $button
}

# Add buttons to the button panel
$button1 = Create-Button -buttonContent "Command 1" -scriptBlock { Get-Process }
$buttonPanel.Children.Add($button1)

$button2 = Create-Button -buttonContent "Command 2" -scriptBlock { Get-Service }
$buttonPanel.Children.Add($button2)

$button3 = Create-Button -buttonContent "Command 3" -scriptBlock { Get-EventLog -LogName System -Newest 10 }
$buttonPanel.Children.Add($button3)

# Add the button panel and the result box to the grid
$grid.Children.Add($buttonPanel)
$grid.Children.Add($resultBox)

# Set the content of the window to the grid
$window.Content = $grid

# Show the window
$window.ShowDialog()
