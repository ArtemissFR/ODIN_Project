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
$scriptADACLScannerStart = "C:\ODIN\AD ACL Scanner\ADACLScanner-master\ADACLScan.ps1" # --> AD ACL Scanner

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

Unblock-File -Path $scriptODIN # --> ODIN Installer
Unblock-File -Path $scriptODINExecuter # --> ODIN Gui application launcher

function Create-FormInstall {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "[ODIN] - DOWNLOADER / INSTALLER"
    $form.Size = New-Object System.Drawing.Size(300,500)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "[ODIN] - DOWNLOADER / INSTALLER"
    $label.Location = New-Object System.Drawing.Point(10,10)
    $form.Controls.Add($label)

    # BUTTON 1 --> HELLO-MY-DIR
    $button1_hellomydir = New-Object System.Windows.Forms.Button
    $button1_hellomydir.Location = New-Object System.Drawing.Point(50,50)
    $button1_hellomydir.Size = New-Object System.Drawing.Size(200,30)
    $button1_hellomydir.Text = "Hello-My-Dir"
    $button1_hellomydir.Add_Click({
        Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir.ps1"
        # Attendre que le premier script se termine avant d'exécuter le second script
        Start-Sleep -Seconds 30 # Ajuste le temps d'attente si nécessaire
        Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir_Config.ps1"
    })
    # BUTTON 1 --> HELLO-MY-DIR
    
    # BUTTON 2 --> HARDEN-AD
    $button2_hardenad = New-Object System.Windows.Forms.Button
    $button2_hardenad.Location = New-Object System.Drawing.Point(50,90)
    $button2_hardenad.Size = New-Object System.Drawing.Size(200,30)
    $button2_hardenad.Text = "Harden-AD (in progress ...)"
    $button2_hardenad.Add_Click({
        Start-Process powershell -ArgumentList "-File Harden-AD\Harden-AD.ps1"
    })
    # BUTTON 2 --> HARDEN-AD
    
    # BUTTON 3 --> RANSOMLORD
    $button3_ransomlord = New-Object System.Windows.Forms.Button
    $button3_ransomlord.Location = New-Object System.Drawing.Point(50,130)
    $button3_ransomlord.Size = New-Object System.Drawing.Size(200,30)
    $button3_ransomlord.Text = "RansomLord"
    $button3_ransomlord.Add_Click({
        Start-Process powershell -ArgumentList "-File RansomLord\RansomLord_v3.1.ps1"
    })
    # BUTTON 3 --> RANSOMLORD
    
    # BUTTON 4 --> PINGCASTLE
    $button4_pingcastle = New-Object System.Windows.Forms.Button
    $button4_pingcastle.Location = New-Object System.Drawing.Point(50,170)
    $button4_pingcastle.Size = New-Object System.Drawing.Size(200,30)
    $button4_pingcastle.Text = "PingCastle"
    $button4_pingcastle.Add_Click({
        Start-Process powershell -ArgumentList "-File PingCastle\PingCastle.ps1"
    })
    # BUTTON 4 --> PINGCASTLE
    
    # BUTTON 5 --> PURPLEKNIGHT
    $button5_purpleknight = New-Object System.Windows.Forms.Button
    $button5_purpleknight.Location = New-Object System.Drawing.Point(50,210)
    $button5_purpleknight.Size = New-Object System.Drawing.Size(200,30)
    $button5_purpleknight.Text = "PurpleKnight"
    $button5_purpleknight.Add_Click({
        Start-Process powershell -ArgumentList "-File PurpleKnight\PurpleKnight.ps1"
    })
    # BUTTON 5 --> PURPLEKNIGHT
    
    # BUTTON 6 --> AD ACL Scanner
    $button6_adaclscanner = New-Object System.Windows.Forms.Button
    $button6_adaclscanner.Location = New-Object System.Drawing.Point(50,250)
    $button6_adaclscanner.Size = New-Object System.Drawing.Size(200,30)
    $button6_adaclscanner.Text = "AD ACL Scanner"
    $button6_adaclscanner.Add_Click({
        Start-Process powershell -ArgumentList "-File ADACLScanner\ADACLScanner.ps1"
        Start-Sleep -Seconds 30 # Ajuste le temps d'attente si nécessaire
        Unblock-File -Path $scriptADACLScannerStart # --> AD ACL Scanner
    })
    # BUTTON 6 --> AD ACL Scanner

    # BUTTON 7 --> Next
    $button7_next = New-Object System.Windows.Forms.Button
    $button7_next.Text = "Next"
    $button7_next.Location = New-Object System.Drawing.Point(200,290)
    $button7_next.Add_Click({ 
        $form.Hide()
        Create-FormLaunch
        $form.Close()
    })
    # BUTTON 7 --> Next   

    # Ajout des contrôles à la Forme
    $form.Controls.Add($button1_hellomydir) # --> Hello-My-Dir
    $form.Controls.Add($button2_hardenad) # --> Harden-AD
    $form.Controls.Add($button3_ransomlord) # --> RansomLord
    $form.Controls.Add($button4_pingcastle) # --> PingCastle
    $form.Controls.Add($button5_purpleknight) # --> PurpleKnight
    $form.Controls.Add($button6_adaclscanner) # --> AD ACL Scanner
    $form.Controls.Add($button7_next) # --> ODIN application launcher

    $form.ShowDialog()
}

function Create-FormLaunch {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "[ODIN] - APPLICATION LAUNCHER"
    $form.Size = New-Object System.Drawing.Size(300,400)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "[ODIN] - APPLICATION LAUNCHER"
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
