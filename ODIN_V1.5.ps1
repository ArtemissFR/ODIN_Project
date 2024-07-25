Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Path to the files you want to unlock

$scriptHelloMyDir = "Hello-My-Dir\Hello_My_Dir.ps1" # --> Hello-My-Dir
$scriptHelloMyDirConfig = "Hello-My-Dir\Hello_My_Dir_Config.ps1" # --> Hello-My-Dir Configuration

$scriptHardenAD = "Harden-AD\Harden-AD.ps1" # --> HardenAD
$scriptHardenADStart = "Harden-AD\Harden-AD_start.ps1" # --> HardenAD
$scriptRunHardenAD = "C:\ODIN\Harden-AD\HardenAD-Master\HardenAD.ps1" # --> HardenAD 
$scriptRunHardenADGui = "C:\ODIN\Harden-AD\HardenAD-Master\Run-HardenADGui.ps1" # --> HardenAD

$scriptPingCastle = "PingCastle\PingCastle.ps1" # --> PingCastle
$scriptPurpleKnight = "PurpleKnight\PurpleKnight.ps1" # --> PurpleKnight

$scriptRansomLord = "RansomLord\RansomLord_v3.1.ps1" # --> RansomLord

$scriptADACLScanner = "ADACLScanner\ADACLScanner.ps1" # --> AD ACL Scanner
$scriptADACLScannerStart = "C:\ODIN\AD ACL Scanner\ADACLScanner-master\ADACLScan.ps1" # --> AD ACL Scanner

$scriptODIN = "ODIN_V1.5.ps1" # --> ODIN Installer

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

function Create-FormInstall {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "[ODIN] - Installer"
    $form.Size = New-Object System.Drawing.Size(300,450)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

###########################################################################
    # Créer la barre de navigation (MenuStrip)
    $menuStrip = New-Object System.Windows.Forms.MenuStrip
    
    # Créer les éléments du menu
    $menuItemAbout = New-Object System.Windows.Forms.ToolStripMenuItem
    $menuItemAbout.Text = "About"
    
    $menuItemTools = New-Object System.Windows.Forms.ToolStripMenuItem
    $menuItemTools.Text = "Other Tools"
    
    # Ajouter les éléments du menu à la barre de navigation
    $menuStrip.Items.Add($menuItemAbout)
    $menuStrip.Items.Add($menuItemTools)
    
    # Ajouter la barre de navigation au formulaire
    $form.Controls.Add($menuStrip)
    
    # Définir les événements des boutons
    $menuItemAbout.Add_Click({
        $message = "ODIN Project : Version 1.5" + [System.Environment]::NewLine + "Project by Louis Provost"
        [System.Windows.Forms.MessageBox]::Show($message, "About")
    })
        
    $menuItemTools.Add_Click({
        $htmlFilePath = "Documentation\Tools\index.html"  # Remplace par le chemin de ton fichier HTML
        [System.Diagnostics.Process]::Start("explorer.exe", $htmlFilePath)
    })
###########################################################################

    # BUTTON 1 --> HELLO-MY-DIR
    $button1_hellomydir = New-Object System.Windows.Forms.Button
    $button1_hellomydir.Location = New-Object System.Drawing.Point(50,50)
    $button1_hellomydir.Size = New-Object System.Drawing.Size(200,30)
    $button1_hellomydir.Text = "Download Hello-My-Dir"
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
    $button2_hardenad.Text = "Download Harden-AD"
    $button2_hardenad.Add_Click({
        Start-Process powershell -ArgumentList "-File Harden-AD\Harden-AD.ps1"
    })
    # BUTTON 2 --> HARDEN-AD
    
    # BUTTON 3 --> RANSOMLORD
    $button3_ransomlord = New-Object System.Windows.Forms.Button
    $button3_ransomlord.Location = New-Object System.Drawing.Point(50,130)
    $button3_ransomlord.Size = New-Object System.Drawing.Size(200,30)
    $button3_ransomlord.Text = "Download RansomLord (You will need to press Enter)"
    $button3_ransomlord.Add_Click({
        Start-Process powershell -ArgumentList "-File RansomLord\RansomLord_v3.1.ps1"
    })
    # BUTTON 3 --> RANSOMLORD
    
    # BUTTON 4 --> PINGCASTLE
    $button4_pingcastle = New-Object System.Windows.Forms.Button
    $button4_pingcastle.Location = New-Object System.Drawing.Point(50,170)
    $button4_pingcastle.Size = New-Object System.Drawing.Size(200,30)
    $button4_pingcastle.Text = "Download PingCastle"
    $button4_pingcastle.Add_Click({
        Start-Process powershell -ArgumentList "-File PingCastle\PingCastle.ps1"
    })
    # BUTTON 4 --> PINGCASTLE
    
    # BUTTON 5 --> PURPLEKNIGHT
    $button5_purpleknight = New-Object System.Windows.Forms.Button
    $button5_purpleknight.Location = New-Object System.Drawing.Point(50,210)
    $button5_purpleknight.Size = New-Object System.Drawing.Size(200,30)
    $button5_purpleknight.Text = "Download PurpleKnight"
    $button5_purpleknight.Add_Click({
        Start-Process powershell -ArgumentList "-File PurpleKnight\PurpleKnight.ps1"
    })
    # BUTTON 5 --> PURPLEKNIGHT
    
    # BUTTON 6 --> AD ACL Scanner
    $button6_adaclscanner = New-Object System.Windows.Forms.Button
    $button6_adaclscanner.Location = New-Object System.Drawing.Point(50,250)
    $button6_adaclscanner.Size = New-Object System.Drawing.Size(200,30)
    $button6_adaclscanner.Text = "Download AD ACL Scanner"
    $button6_adaclscanner.Add_Click({
        Start-Process powershell -ArgumentList "-File ADACLScanner\ADACLScanner.ps1"
        Start-Sleep -Seconds 30 # Ajuste le temps d'attente si nécessaire
        Unblock-File -Path $scriptADACLScannerStart # --> AD ACL Scanner
    })
    # BUTTON 6 --> AD ACL Scanner

    # BUTTON 7 --> Next
    $button7_next = New-Object System.Windows.Forms.Button
    $button7_next.Text = "Next ..."
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
    $form.Text = "[ODIN] - Launcher"
    $form.Size = New-Object System.Drawing.Size(300,400)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

###########################################################################
    # Créer la barre de navigation (MenuStrip)
    $menuStrip = New-Object System.Windows.Forms.MenuStrip
    
    # Créer les éléments du menu
    $menuItemAbout = New-Object System.Windows.Forms.ToolStripMenuItem
    $menuItemAbout.Text = "About"
    
    $menuItemTools = New-Object System.Windows.Forms.ToolStripMenuItem
    $menuItemTools.Text = "Other Tools"
    
    # Ajouter les éléments du menu à la barre de navigation
    $menuStrip.Items.Add($menuItemAbout)
    $menuStrip.Items.Add($menuItemTools)
    
    # Ajouter la barre de navigation au formulaire
    $form.Controls.Add($menuStrip)
    
    # Définir les événements des boutons
    $menuItemAbout.Add_Click({
        $message = "ODIN Project : Version 1.5" + [System.Environment]::NewLine + "Project by Louis Provost"
        [System.Windows.Forms.MessageBox]::Show($message, "About")
    })
        
    $menuItemTools.Add_Click({
        $htmlFilePath = "Documentation\Tools\index.html"  # Remplace par le chemin de ton fichier HTML
        [System.Diagnostics.Process]::Start("explorer.exe", $htmlFilePath)
    })
###########################################################################


    # BUTTON 1 --> HELLO-MY-DIR
    $button1_exe_hellomydir = New-Object System.Windows.Forms.Button
    $button1_exe_hellomydir.Location = New-Object System.Drawing.Point(50,50)
    $button1_exe_hellomydir.Size = New-Object System.Drawing.Size(200,30)
    $button1_exe_hellomydir.Text = "Execute Hello-My-Dir"
    $button1_exe_hellomydir.Add_Click({
    })
    # BUTTON 1 --> HELLO-MY-DIR
    
    # BUTTON 2 --> HARDEN-AD
    $button2_exe_hardenad = New-Object System.Windows.Forms.Button
    $button2_exe_hardenad.Location = New-Object System.Drawing.Point(50,90)
    $button2_exe_hardenad.Size = New-Object System.Drawing.Size(200,30)
    $button2_exe_hardenad.Text = "Execute Harden-AD"
    $button2_exe_hardenad.Add_Click({
        Unblock-File -Path $scriptRunHardenAD
        Unblock-File -Path $scriptRunHardenADGui
        Create-FormHardenAD
    })
    # BUTTON 2 --> HARDEN-AD
    
    # BUTTON 3 --> PINGCASTLE
    $button3_exe_pingcastle = New-Object System.Windows.Forms.Button
    $button3_exe_pingcastle.Location = New-Object System.Drawing.Point(50,130)
    $button3_exe_pingcastle.Size = New-Object System.Drawing.Size(200,30)
    $button3_exe_pingcastle.Text = "Execute PingCastle"
    $button3_exe_pingcastle.Add_Click({
        $pingcastle_path = "C:\ODIN\PingCastle"
        Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $pingcastle_path; .\PingCastle.exe`""
    })
    # BUTTON 3 --> PINGCASTLE
    
    # BUTTON 4 --> PURPLEKNIGHT
    $button4_exe_purpleknight = New-Object System.Windows.Forms.Button
    $button4_exe_purpleknight.Location = New-Object System.Drawing.Point(50,170)
    $button4_exe_purpleknight.Size = New-Object System.Drawing.Size(200,30)
    $button4_exe_purpleknight.Text = "Execute PurpleKnight"
    $button4_exe_purpleknight.Add_Click({
        $purpleknight_path = "'C:\ODIN\PurpleKnight\PK Community 4.2\'"
        Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $purpleknight_path; .\PurpleKnight.exe`""
    })
    # BUTTON 4 --> PURPLEKNIGHT
    
    # BUTTON 5 --> AD ACL Scanner
    $button5_exe_adaclscanner = New-Object System.Windows.Forms.Button
    $button5_exe_adaclscanner.Location = New-Object System.Drawing.Point(50,210)
    $button5_exe_adaclscanner.Size = New-Object System.Drawing.Size(200,30)
    $button5_exe_adaclscanner.Text = "Execute AD ACL Scanner"
    $button5_exe_adaclscanner.Add_Click({
        $adaclscanner_path = "'C:\ODIN\AD ACL Scanner\ADACLScanner-master\'"
        Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $adaclscanner_path; .\ADACLScan.ps1`""
    })
    # BUTTON 5 --> AD ACL Scanner
    
    # BUTTON 6 --> FINISH
    $button6_finish = New-Object System.Windows.Forms.Button
    $button6_finish.Location = New-Object System.Drawing.Point(50,250)
    $button6_finish.Size = New-Object System.Drawing.Size(200,30)
    $button6_finish.Text = "Finish"
    $button6_finish.Add_Click({
        $form.Close()
    })
    # BUTTON 6 --> FINISH

    # Ajout des contrôles à la Forme
    $form.Controls.Add($button1_exe_hellomydir) # --> Hello-My-Dir
    $form.Controls.Add($button2_exe_hardenad) # --> HardenAD
    $form.Controls.Add($button3_exe_pingcastle) # --> PingCastle
    $form.Controls.Add($button4_exe_purpleknight) # --> PurpleKnight
    $form.Controls.Add($button5_exe_adaclscanner) # --> AD ACL Scanner
    $form.Controls.Add($button6_finish) # --> Finish

    $form.ShowDialog()
}

function Create-FormHardenAD {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "[ODIN] - HardenAD"
    $form.Size = New-Object System.Drawing.Size(300,400)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "[ODIN] - HardenAD"
#    $label.Location = New-Object System.Drawing.Point(10,10)
    $form.Controls.Add($label)

    # Création des Boutons
    $button1_ConfigHarden = New-Object System.Windows.Forms.Button
    $button1_ConfigHarden.Location = New-Object System.Drawing.Point(50,50)
    $button1_ConfigHarden.Size = New-Object System.Drawing.Size(200,30)
    $button1_ConfigHarden.Text = "Config Harden-AD"
    $button1_ConfigHarden.Add_Click({
        $hardenad_path = "C:\ODIN\Harden-AD\HardenAD-Master"
        Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $hardenad_path; .\Run-HardenADGui`""
    })
    
    $button2_LaunchHarden = New-Object System.Windows.Forms.Button
    $button2_LaunchHarden.Location = New-Object System.Drawing.Point(50,90)
    $button2_LaunchHarden.Size = New-Object System.Drawing.Size(200,30)
    $button2_LaunchHarden.Text = "Launch Harden-AD"
    $button2_LaunchHarden.Add_Click({
        $hardenad_path = "C:\ODIN\Harden-AD\HardenAD-Master"
        Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $hardenad_path; .\HardenAD`""
    })
    
    $button3_finish = New-Object System.Windows.Forms.Button
    $button3_finish.Location = New-Object System.Drawing.Point(50,130)
    $button3_finish.Size = New-Object System.Drawing.Size(200,30)
    $button3_finish.Text = "Finish"
    $button3_finish.Add_Click({
        $form.Close()
    })
    
    # Ajout des contrôles à la Forme
    $form.Controls.Add($button1_ConfigHarden) # --> Config Harden-AD
    $form.Controls.Add($button2_LaunchHarden) # --> Launch Harden-AD
    $form.Controls.Add($button3_finish) # --> Finish
    
    # Affichage de la Forme
    $form.ShowDialog()

}

Create-FormInstall
