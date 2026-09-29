# Script Inventory and Limitations

## Entra User Provisioning

[new-entra-users-from-csv.ps1](new-entra-users-from-csv.ps1) imports [entra-bulk-users.csv](../data/entra-bulk-users.csv) using a path relative to `$PSScriptRoot`, before connecting to Microsoft Graph with `User.ReadWrite.All`. An import failure stops the script before authentication. The script generates temporary passwords in memory, calls `New-MgUser`, requests a password change at next sign-in, and prints a Created message for each loop iteration.

The CSV fields consumed are DisplayName, UserPrincipalName, FirstName, LastName, JobTitle, Department, and UsageLocation. `FirstName` maps to the Graph `GivenName` parameter; `LastName` maps to `Surname`. Both existing CSV files are unchanged. The 25-person employee roster is not the provisioning input; the provisioning dataset has 24 records.

The script requires Microsoft Graph PowerShell commands and an authenticated identity with sufficient permissions when used. Validation during cleanup was offline/static only; no Graph authentication or user creation occurred.

### Remaining Limitations

- There is no explicit existing-user check or per-user error handling. The unconditional Created message should not be treated as independent success verification.
- It creates user objects; it does not assign licenses, department groups, or managers.
- The path/schema correction has not been tested against a live tenant.

## Print Spooler Detection and Remediation

These scripts were developed and iteratively refined as part of the lab to support the stopped-service detection and remediation scenario. They were later prepared for repository inclusion through formatting corrections and syntax/static review. That repository review did not rerun the scripts against an endpoint.

| Script | Behavior |
|---|---|
| [detect-print-spooler.ps1](detect-print-spooler.ps1) | Checks Spooler; exits 0 when Running and 1 when stopped or not found |
| [remediate-print-spooler.ps1](remediate-print-spooler.ps1) | Checks service presence, requests Automatic startup, starts Spooler, and checks whether it is Running |

### Validation and Limitations

During the previous repository cleanup, all three PowerShell scripts passed syntax parsing. This established syntax validity, not live execution success. No Microsoft Graph authentication, user creation, or local Print Spooler execution occurred during that validation.

`Set-Service` and `Start-Service` do not specify `-ErrorAction Stop`, so the catch block is not guaranteed to handle non-terminating errors.

The saved lab evidence shows stopped/running service states and a completed Intune remediation action. It does not independently show detection output, confirm the configured startup type, establish the execution identity or schedule, or link a specific Intune action ID to the terminal output.

See the [remediation case](../docs/print-spooler-remediation.md) and [validation summary](../validation/validation-summary.md).
