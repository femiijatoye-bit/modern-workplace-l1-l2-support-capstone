# detect-print-spooler.ps1

$service = Get-Service -Name "Spooler" -ErrorAction SilentlyContinue
if ($null -eq $service) {
Write-Output "Print Spooler service was not found."
exit 1
}
if ($service.Status -eq "Running") {
Write-Output "Print Spooler is running. No remediation required."
exit 0
}
else {
Write-Output "Print Spooler is not running. Remediation required."
exit 1
}
