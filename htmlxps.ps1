Add-Type -AssemblyName System.Windows.Forms

# Crée une instance de WebBrowser
$browser = New-Object System.Windows.Forms.WebBrowser
$browser.Dock = [System.Windows.Forms.DockStyle]::Fill

# Crée une instance de Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Affichage HTML avec CSS"
$form.Width = 800
$form.Height = 600
$form.Controls.Add($browser)

# Contenu HTML avec CSS intégré
$htmlContent = @"
<html>
<head>
    <title>Affichage HTML avec CSS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            text-align: center;
        }
        h1 {
            color: #007BFF;
        }
        p {
            font-size: 18px;
        }
    </style>
</head>
<body>
    <h1>Bienvenue!</h1>
    <p>Ceci est une page HTML avec CSS intégrée affichée dans PowerShell.</p>
</body>
</html>
"@

# Charge le contenu HTML dans le WebBrowser
$browser.DocumentText = $htmlContent

# Affiche le formulaire
[System.Windows.Forms.Application]::Run($form)
