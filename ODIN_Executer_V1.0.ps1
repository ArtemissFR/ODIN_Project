# Loading the necessary Assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Path to the files you want to unlock
$scriptHardenADStart = "Harden-AD\Harden-AD_start.ps1"
$scriptADACLScanner = "AD ACL Scanner\ADACLScan.ps1"

# Use of cmdlet Unblock-File --> Unblock script powershell
Unblock-File -Path $scriptHardenADStart # --> HardenAD
Unblock-File -Path $scriptADACLScanner # --> AD ACL Scanner

# Creating the Form
$form = New-Object System.Windows.Forms.Form
$form.Text = "[ODIN] - APPLICATION LAUNCHER"
$form.Size = New-Object System.Drawing.Size(300,400)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# BUTTON 1 --> HELLO-MY-DIR
$button1_exe_hellomydir = New-Object System.Windows.Forms.Button
$button1_exe_hellomydir.Location = New-Object System.Drawing.Point(50,50)
$button1_exe_hellomydir.Size = New-Object System.Drawing.Size(200,30)
$button1_exe_hellomydir.Text = "Hello-My-Dir"
$button1_exe_hellomydir.Add_Click({
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir.ps1"
    # Attendre que le premier script se termine avant d'exécuter le second script
    Start-Sleep -Seconds 30 # Ajuste le temps d'attente si nécessaire
    Start-Process powershell -ArgumentList "-File Hello-My-Dir\Hello_My_Dir_Config.ps1"
})
# BUTTON 1 --> HELLO-MY-DIR

# BUTTON 2 --> HARDEN-AD
$button2_exe_hardenad = New-Object System.Windows.Forms.Button
$button2_exe_hardenad.Location = New-Object System.Drawing.Point(50,90)
$button2_exe_hardenad.Size = New-Object System.Drawing.Size(200,30)
$button2_exe_hardenad.Text = "Execute Harden-AD"
$button2_exe_hardenad.Add_Click({
    Start-Process powershell -ArgumentList "-File Harden-AD\Harden-AD_start.ps1"
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
    $purpleknight_path = "C:\ODIN\PurpleKnight\PK Community 4.2"
    Start-Process powershell -ArgumentList "-NoProfile -NoExit -Command `"Set-Location -Path $purpleknight_path; .\PurpleKnight.exe`""
})
# BUTTON 4 --> PURPLEKNIGHT

# BUTTON 5 --> AD ACL Scanner
$button5_exe_adaclscanner = New-Object System.Windows.Forms.Button
$button5_exe_adaclscanner.Location = New-Object System.Drawing.Point(50,210)
$button5_exe_adaclscanner.Size = New-Object System.Drawing.Size(200,30)
$button5_exe_adaclscanner.Text = "Execute AD ACL Scanner"
$button5_exe_adaclscanner.Add_Click({
    $adaclscanner_path = "C:\ODIN\AD ACL Scanner\ADACLScanner-master"
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

# Affichage de la Forme
$form.ShowDialog()
