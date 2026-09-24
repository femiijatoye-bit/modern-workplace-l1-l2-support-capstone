# Script Inventory and Limitations

## Existing Script

[new-entra-users-from-csv.ps1](new-entra-users-from-csv.ps1) connects to Microsoft Graph using `User.ReadWrite.All`, imports a CSV, generates temporary passwords in memory, and calls `New-MgUser`. It requests a password change at next sign-in and prints a Created message for each loop iteration.

The script expects Microsoft Graph PowerShell commands and an authenticated identity with sufficient permissions. Its expected CSV columns are DisplayName, UserPrincipalName, GivenName, Surname, JobTitle, Department, and UsageLocation.

## Current Usage Status

The script is preserved unchanged and is not ready to run directly from this repository:

- Its input `./data/users-to-provision.csv` is absent and is resolved relative to the caller's working directory.
- The existing [provisioning dataset](../data/entra-bulk-users.csv) uses `FirstName` and `LastName` instead of `GivenName` and `Surname`.
- The script has no explicit existing-user check or per-user error handling. Its unconditional Created message should not be treated as independent success verification.
- It creates user objects; it does not assign licenses, department groups, or managers.

Before future reuse, the input path and schema need an approved correction and offline validation. No script execution against Microsoft Graph was performed as part of the documentation cleanup. See the [dataset guide](../data/README.md).

## Print Spooler Scripts

The original detection and remediation scripts described in the lab README are absent. No replacement scripts are included. The [Print Spooler case](../docs/print-spooler-remediation.md) records the available evidence and the limits on reproducibility until the original files are recovered.
