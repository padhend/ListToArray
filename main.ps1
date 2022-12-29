<# 
.NAME
    listToArray
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$ListToArray                     = New-Object system.Windows.Forms.Form
$ListToArray.ClientSize          = New-Object System.Drawing.Point(345,670)
$ListToArray.text                = "ListToArray"
$ListToArray.TopMost             = $false

$tb_variable                     = New-Object system.Windows.Forms.TextBox
$tb_variable.multiline           = $false
$tb_variable.width               = 150
$tb_variable.height              = 16
$tb_variable.location            = New-Object System.Drawing.Point(9,43)
$tb_variable.Font                = New-Object System.Drawing.Font('Calibri',14)
$tb_variable.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$tb_varItems                     = New-Object system.Windows.Forms.TextBox
$tb_varItems.multiline           = $true
$tb_varItems.width               = 322
$tb_varItems.height              = 459
$tb_varItems.location            = New-Object System.Drawing.Point(10,92)
$tb_varItems.Font                = New-Object System.Drawing.Font('Calibri',14)
$tb_varItems.ForeColor           = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$bt_submit                       = New-Object system.Windows.Forms.Button
$bt_submit.text                  = "Convert"
$bt_submit.width                 = 323
$bt_submit.height                = 30
$bt_submit.location              = New-Object System.Drawing.Point(10,566)
$bt_submit.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Underline))
$bt_submit.DialogResult          = [System.Windows.Forms.DialogResult]::OK

$lb_variable                     = New-Object system.Windows.Forms.Label
$lb_variable.text                = "Enter the variable name in the box"
$lb_variable.AutoSize            = $true
$lb_variable.width               = 25
$lb_variable.height              = 10
$lb_variable.location            = New-Object System.Drawing.Point(12,20)
$lb_variable.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$ListToArray.controls.AddRange(@($tb_variable,$tb_varItems,$bt_submit,$lb_variable))
$result = $ListToArray.ShowDialog()

#region Logic 
if (($result -eq [System.Windows.Forms.DialogResult]::OK)) {
    $global:variableName = $tb_variable.Text
    $global:listItems = $tb_varItems.Text.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)

    New-Variable -name "$variableName" -value $listItems -Scope global

    Write-host "Variable Name: `$$variableName"
    Get-Variable -Name "$variableName" -ValueOnly

}
#endregion