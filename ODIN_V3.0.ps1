Add-Type -AssemblyName System.Windows.Forms

function Create-Form1 {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Installation"
    $form.Size = New-Object System.Drawing.Size(300,200)

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "Installation"
    $label.Location = New-Object System.Drawing.Point(10,10)
    $form.Controls.Add($label)

    $nextButton = New-Object System.Windows.Forms.Button
    $nextButton.Text = "Next"
    $nextButton.Location = New-Object System.Drawing.Point(200,130)
    $nextButton.Add_Click({ 
        $form.Hide()
        Create-Form2
        $form.Close()
    })
    $form.Controls.Add($nextButton)

    $form.ShowDialog()
}

function Create-Form2 {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Lancement"
    $form.Size = New-Object System.Drawing.Size(300,200)

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "Lancement"
    $label.Location = New-Object System.Drawing.Point(10,10)
    $form.Controls.Add($label)

    $launchButton = New-Object System.Windows.Forms.Button
    $launchButton.Text = "Launch"
    $launchButton.Location = New-Object System.Drawing.Point(200,130)
    $launchButton.Add_Click({
        [System.Windows.Forms.MessageBox]::Show("Lancement réussi !")
    })
    $form.Controls.Add($launchButton)

    $form.ShowDialog()
}

Create-Form1
