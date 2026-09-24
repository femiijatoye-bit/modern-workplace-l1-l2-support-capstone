# Bulk Entra user provisioning from CSV
# Requires Microsoft.Graph PowerShell module
# Expected CSV columns:
# DisplayName,UserPrincipalName,FirstName,LastName,JobTitle,Department,UsageLocation

$csvPath = Join-Path -Path $PSScriptRoot -ChildPath '../data/entra-bulk-users.csv'
$users = Import-Csv -LiteralPath $csvPath -ErrorAction Stop

Connect-MgGraph -Scopes "User.ReadWrite.All"

foreach ($user in $users) {

    $tempPassword = "N5!" + ([guid]::NewGuid().ToString("N").Substring(0,16)) + "aA9#"

    $passwordProfile = @{
        Password = $tempPassword
        ForceChangePasswordNextSignIn = $true
    }

    New-MgUser `
        -AccountEnabled:$true `
        -DisplayName $user.DisplayName `
        -UserPrincipalName $user.UserPrincipalName `
        -MailNickname ($user.UserPrincipalName.Split("@")[0]) `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -JobTitle $user.JobTitle `
        -Department $user.Department `
        -UsageLocation $user.UsageLocation `
        -PasswordProfile $passwordProfile

    Write-Host "Created:" $user.DisplayName
}
