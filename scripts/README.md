# Script Inventory and Limitations

## Entra User Provisioning

[new-entra-users-from-csv.ps1](new-entra-users-from-csv.ps1) imports [entra-bulk-users.csv](../data/entra-bulk-users.csv) using a path relative to `$PSScriptRoot`, before connecting to Microsoft Graph with `User.ReadWrite.All`. An import failure stops the script before authentication. The script generates temporary passwords in memory, calls `New-MgUser`, requests a password change at next sign-in, and prints a Created message for each loop iteration.

The CSV fields consumed are DisplayName, UserPrincipalName, FirstName, LastName, JobTitle, Department, and UsageLocation. `FirstName` maps to the Graph `GivenName` parameter; `LastName` maps to `Surname`. Both existing CSV files are unchanged. The 25-person employee roster is not the provisioning input; the provisioning dataset has 24 records.

The script requires Microsoft Graph PowerShell commands and an authenticated identity with sufficient permissions when used. Validation during cleanup was offline/static only; no Graph authentication or user creation occurred.

### Remaining Limitations

- There is no explicit existing-user check or per-user error handling. The unconditional Created message should not be treated as independent success verification.
- It creates user objects; it does not assign licenses, department groups, or managers.
- The path/schema correction has not been tested against a live tenant.

## Original Print Spooler Scripts

The following scripts were used during the Print Spooler remediation lab and are included with their original PowerShell logic preserved:

| Script | Behavior visible in the source |
|---|---|
| [detect-print-spooler.ps1](detect-print-spooler.ps1) | Queries Spooler; exits 0 if Running, otherwise exits 1, including when the service is not found |
| [remediate-print-spooler.ps1](remediate-print-spooler.ps1) | Checks service presence, requests Automatic startup, starts the service, checks Running status, and contains success/failure exit paths and a catch block |

### Implementation and Validation Notes

All three scripts pass PowerShell syntax parsing. This confirms syntax validity, not live execution results.

`Set-Service` and `Start-Service` also lack explicit `-ErrorAction Stop`; the catch block is not guaranteed to handle non-terminating errors. This existing logic is preserved.

All three files received syntax/static inspection only. Neither Print Spooler script was executed, and no service settings were changed. See the [validation summary](../validation/validation-summary.md) for saved-evidence boundaries.
