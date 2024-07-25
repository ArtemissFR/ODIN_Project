Add-Type -AssemblyName System.Windows.Forms
$browser = New-Object System.Windows.Forms.WebBrowser
$browser.Dock = [System.Windows.Forms.DockStyle]::Fill
$form = New-Object System.Windows.Forms.Form
$form.Text = "Affichage HTML"
$form.Width = 800
$form.Height = 600
$form.Controls.Add($browser)

$htmlContent = @"
<html>
<head>
    <title>Affichage HTML</title>
</head>
<body>
    <h1>Bienvenue!</h1>
    <p>Voici un affichage HTML dans PowerShell.</p>
</body>
</html>
"@

$browser.DocumentText = $htmlContent
[System.Windows.Forms.Application]::Run($form)
