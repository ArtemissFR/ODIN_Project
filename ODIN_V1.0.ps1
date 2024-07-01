# Loading the necessary Assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Path to the files you want to unlock
$scriptHelloMyDir = "Hello-My-Dir\Hello_My_Dir.ps1" # --> Hello-My-Dir
$scriptHelloMyDirConfig = "Hello-My-Dir\Hello_My_Dir_Config.ps1" # --> Hello-My-Dir Configuration
$scriptHardenAD = "Harden-AD\Harden-AD.ps1" # --> HardenAD
$scriptPingCastle = "PingCastle\PingCastle.ps1" # --> PingCastle
$scriptPurpleKnight = "PurpleKnight\PurpleKnight.ps1" # --> PurpleKnight
$scriptRansomLord = "RansomLord\RansomLord_v3.1.ps1" # --> RansomLord
$scriptADACLScanner = "ADACLScanner\ADACLScanner.ps1" # --> AD ACL Scanner
$scriptODIN = "ODIN_V1.0.ps1" # --> ODIN Installer
$scriptODINExecuter = "ODIN_Executer_V1.0.ps1" # --> ODIN Gui application launcher

# Use of cmdlet Unblock-File --> Unblock script powershell
Unblock-File -Path $scriptHelloMyDir # --> Hello-My-Dir
Unblock-File -Path $scriptHelloMyDirConfig # --> Hello-My-Dir Configuration
Unblock-File -Path $scriptHardenAD # --> HardenAD
Unblock-File -Path $scriptPingCastle # --> PingCastle
Unblock-File -Path $scriptPurpleKnight # --> PurpleKnight
Unblock-File -Path $scriptRansomLord # --> RansomLord
Unblock-File -Path $scriptADACLScanner # --> AD ACL Scanner
Unblock-File -Path $scriptODIN # --> ODIN Installer
Unblock-File -Path $scriptODINExecuter # --> ODIN Gui application launcher

# Creating the Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "[ODIN]"
$form.Size = New-Object System.Drawing.Size(300,500)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# Création des Boutons
$button1 = New-Object System.Windows.Forms.Button
$button1.Location = New-Object System.Drawing.Point(50,50)
$button1.Size = New-Object System.Drawing.Size(200,30)
$button1.Text = "Hello-My-Dir"
$button1.Add_Click({
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir.ps1"
    # Attendre que le premier script se termine avant d'exécuter le second script
    Start-Sleep -Seconds 30 # Ajuste le temps d'attente si nécessaire
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir_Config.ps1"
})

$button2 = New-Object System.Windows.Forms.Button
$button2.Location = New-Object System.Drawing.Point(50,90)
$button2.Size = New-Object System.Drawing.Size(200,30)
$button2.Text = "Harden-AD (in progress ...)"
$button2.Add_Click({
    Start-Process powershell -ArgumentList "-File Harden-AD\Harden-AD.ps1"
})

$button3 = New-Object System.Windows.Forms.Button
$button3.Location = New-Object System.Drawing.Point(50,130)
$button3.Size = New-Object System.Drawing.Size(200,30)
$button3.Text = "RansomLord"
$button3.Add_Click({
    Start-Process powershell -ArgumentList "-File RansomLord\RansomLord_v3.1.ps1"
})

$button4 = New-Object System.Windows.Forms.Button
$button4.Location = New-Object System.Drawing.Point(50,170)
$button4.Size = New-Object System.Drawing.Size(200,30)
$button4.Text = "PingCastle"
$button4.Add_Click({
    Start-Process powershell -ArgumentList "-File PingCastle\PingCastle.ps1"
})

$button5 = New-Object System.Windows.Forms.Button
$button5.Location = New-Object System.Drawing.Point(50,210)
$button5.Size = New-Object System.Drawing.Size(200,30)
$button5.Text = "PurpleKnight"
$button5.Add_Click({
    Start-Process powershell -ArgumentList "-File PurpleKnight\PurpleKnight.ps1"
})

$button6 = New-Object System.Windows.Forms.Button
$button6.Location = New-Object System.Drawing.Point(50,250)
$button6.Size = New-Object System.Drawing.Size(200,30)
$button6.Text = "AD ACL Scanner"
$button6.Add_Click({
    Start-Process powershell -ArgumentList "-File ADACLScanner\ADACLScanner.ps1"
})

$buttonNext = New-Object System.Windows.Forms.Button
$buttonNext.Location = New-Object System.Drawing.Point(50,290)
$buttonNext.Size = New-Object System.Drawing.Size(200,30)
$buttonNext.Text = "Next ..."
$buttonNext.Add_Click({
    Start-Process powershell -ArgumentList "-File ODIN_Executer_V1.0.ps1"
    $form.Close()
})

# Ajout des contrôles à la Forme
$form.Controls.Add($button1) # --> Hello-My-Dir
$form.Controls.Add($button2) # --> Harden-AD
$form.Controls.Add($button3) # --> RansomLord
$form.Controls.Add($button4) # --> PingCastle
$form.Controls.Add($button5) # --> PurpleKnight
$form.Controls.Add($button6) # --> AD ACL Scanner
$form.Controls.Add($buttonNext) # --> ODIN application launcher

# Affichage de la Forme
$form.ShowDialog()
