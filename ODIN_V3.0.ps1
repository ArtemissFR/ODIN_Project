Add-Type -AssemblyName System.Windows.Forms

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
