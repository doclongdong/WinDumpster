Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Command Selector"
$form.Size = New-Object System.Drawing.Size(300,250)
$form.StartPosition = "CenterScreen"

# Create checkboxes
$checkbox1 = New-Object System.Windows.Forms.CheckBox
$checkbox1.Text = "Run 1.ps1"
$checkbox1.Location = New-Object System.Drawing.Point(30,30)
$checkbox1.AutoSize = $true

$checkbox2 = New-Object System.Windows.Forms.CheckBox
$checkbox2.Text = "Run 2.ps1"
$checkbox2.Location = New-Object System.Drawing.Point(30,60)
$checkbox2.AutoSize = $true

$checkbox3 = New-Object System.Windows.Forms.CheckBox
$checkbox3.Text = "Run 3.ps1"
$checkbox3.Location = New-Object System.Drawing.Point(30,90)
$checkbox3.AutoSize = $true

# Timer label
$timerLabel = New-Object System.Windows.Forms.Label
$timerLabel.Text = "Time remaining: 30"
$timerLabel.Location = New-Object System.Drawing.Point(30,130)
$timerLabel.AutoSize = $true

# OK button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Text = "OK"
$okButton.Location = New-Object System.Drawing.Point(100,170)
$okButton.Size = New-Object System.Drawing.Size(80,30)

# Timer setup
$timeLeft = 30
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000 # 1 second
$timer.Add_Tick({
    $timeLeft--
    $timerLabel.Text = "Time remaining: $timeLeft"
    if ($timeLeft -le 0) {
        $timer.Stop()
        $form.Close()
    }
})
$timer.Start()

# OK button action
$okButton.Add_Click({
    $timer.Stop()

    $scriptPath = Get-Location

    # you can add "-NoExit", "-ExecutionPolicy Bypass" to the arguments of each if needed

    if ($checkbox1.Checked) {
        Start-Process powershell.exe -ArgumentList "-File `"$scriptPath\1.ps1`""
    }
    if ($checkbox2.Checked) {
        Start-Process powershell.exe -ArgumentList "-File `"$scriptPath\2.ps1`""
    }
    if ($checkbox3.Checked) {
        Start-Process powershell.exe -ArgumentList "-File `"$scriptPath\3.ps1`""
    }

    $form.Close()
})

# Add controls to the form
$form.Controls.Add($checkbox1)
$form.Controls.Add($checkbox2)
$form.Controls.Add($checkbox3)
$form.Controls.Add($okButton)
$form.Controls.Add($timerLabel)

# Show the form (modal)
[void]$form.ShowDialog()