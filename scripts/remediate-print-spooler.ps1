$service = Get-Service -Name "Spooler" -ErrorAction SilentlyContinue

if ($null -eq $service) {
Write-Output "Print Spooler service was not found."
exit 1
}

try {
Set-Service -Name "Spooler" -StartupType Automatic
Start-Service -Name "Spooler"
$service = Get-Service -Name "Spooler"

if ($service.Status -eq "Running") {
    Write-Output "Print Spooler remediation succeeded. Service is running."
    exit 0
}
else {
    Write-Output "Print Spooler remediation failed. Service is not running."
    exit 1
}

}
catch {
Write-Output "Print Spooler remediation failed: $($_.Exception.Message)"
exit 1
}
