Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Command Selector"
$form.Size = New-Object System.Drawing.Size(300,250)
$form.StartPosition = "CenterScreen"

# Create checkboxes
$checkbox1 = New-Object System.Windows.Forms.CheckBox
$checkbox1.Text = "Run OBS"
$checkbox1.Location = New-Object System.Drawing.Point(30,30)
$checkbox1.AutoSize = $true
$checkbox1.Checked = $true

$checkbox2 = New-Object System.Windows.Forms.CheckBox
$checkbox2.Text = "Run Notion"
$checkbox2.Location = New-Object System.Drawing.Point(30,60)
$checkbox2.AutoSize = $true

$checkbox3 = New-Object System.Windows.Forms.CheckBox
$checkbox3.Text = "Run MacOS VM"
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
        Start-Process -FilePath "$scriptPath\OBS Studio.lnk"
    }
    if ($checkbox2.Checked) {
        Start-Process -FilePath "$scriptPath\Notion.exe"
    }
    if ($checkbox3.Checked) {
        Start-Process -Filepath "$scriptPath\MacOS VMWare.cmd"
	# Start-Process -Filepath "C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe" -ArgumentList "start `"X:\Common\VMWare-MacOS12\macOS 12.vmx`""
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