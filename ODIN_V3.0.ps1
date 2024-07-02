Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Path to the files you want to unlock
$scriptHelloMyDir = "Hello-My-Dir\Hello_My_Dir.ps1" # --> Hello-My-Dir
$scriptHelloMyDirConfig = "Hello-My-Dir\Hello_My_Dir_Config.ps1" # --> Hello-My-Dir Configuration
$scriptHardenAD = "Harden-AD\Harden-AD.ps1" # --> HardenAD
$scriptHardenADStart = "Harden-AD\Harden-AD_start.ps1" # --> HardenAD
$scriptPingCastle = "PingCastle\PingCastle.ps1" # --> PingCastle
$scriptPurpleKnight = "PurpleKnight\PurpleKnight.ps1" # --> PurpleKnight
$scriptRansomLord = "RansomLord\RansomLord_v3.1.ps1" # --> RansomLord
$scriptADACLScanner = "ADACLScanner\ADACLScanner.ps1" # --> AD ACL Scanner
$scriptADACLScannerStart = "AD ACL Scanner\ADACLScan.ps1" # --> AD ACL Scanner
$scriptODIN = "ODIN_V1.0.ps1" # --> ODIN Installer
$scriptODINExecuter = "ODIN_Executer_V1.0.ps1" # --> ODIN Gui application launcher

# Use of cmdlet Unblock-File --> Unblock script powershell
Unblock-File -Path $scriptHelloMyDir # --> Hello-My-Dir
Unblock-File -Path $scriptHelloMyDirConfig # --> Hello-My-Dir Configuration
Unblock-File -Path $scriptHardenAD # --> HardenAD
Unblock-File -Path $scriptHardenADStart # --> HardenAD
Unblock-File -Path $scriptPingCastle # --> PingCastle
Unblock-File -Path $scriptPurpleKnight # --> PurpleKnight
Unblock-File -Path $scriptRansomLord # --> RansomLord
Unblock-File -Path $scriptADACLScanner # --> AD ACL Scanner
Unblock-File -Path $scriptADACLScannerStart # --> AD ACL Scanner
Unblock-File -Path $scriptODIN # --> ODIN Installer
Unblock-File -Path $scriptODINExecuter # --> ODIN Gui application launcher

function Create-FormInstall {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "[ODIN] - Installer"
    $form.Size = New-Object System.Drawing.Size(300,200)

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "[ODIN] - Installer"
    $label.Location = New-Object System.Drawing.Point(10,10)
    $form.Controls.Add($label)

    $nextButton = New-Object System.Windows.Forms.Button
    $nextButton.Text = "Next"
    $nextButton.Location = New-Object System.Drawing.Point(200,130)
    $nextButton.Add_Click({ 
        $form.Hide()
        Create-FormLaunch
        $form.Close()
    })
    $form.Controls.Add($nextButton)

    $form.ShowDialog()
}

function Create-FormLaunch {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "[ODIN] - Launcher"
    $form.Size = New-Object System.Drawing.Size(300,200)

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "[ODIN] - Launcher"
    $label.Location = New-Object System.Drawing.Point(10,10)
    $form.Controls.Add($label)

    $launchButton = New-Object System.Windows.Forms.Button
    $launchButton.Text = "Launch"
    $launchButton.Location = New-Object System.Drawing.Point(200,130)
    $launchButton.Add_Click({
#        [System.Windows.Forms.MessageBox]::Show(" !")
    })
    $form.Controls.Add($launchButton)

    $form.ShowDialog()
}

Create-FormInstall
