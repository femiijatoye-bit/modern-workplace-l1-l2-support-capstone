# Bulk Entra user provisioning from CSV
# Requires Microsoft.Graph PowerShell module
# Expected CSV columns:
# DisplayName,UserPrincipalName,GivenName,Surname,JobTitle,Department,UsageLocation

Connect-MgGraph -Scopes "User.ReadWrite.All"

$users = Import-Csv "./data/users-to-provision.csv"

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
        -GivenName $user.GivenName `
        -Surname $user.Surname `
        -JobTitle $user.JobTitle `
        -Department $user.Department `
        -UsageLocation $user.UsageLocation `
        -PasswordProfile $passwordProfile

    Write-Host "Created:" $user.DisplayName
}
