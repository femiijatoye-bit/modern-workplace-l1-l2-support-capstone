# Lab Datasets

These datasets describe the fictional Northstar Creative Solutions workforce. Existing CSV contents are preserved.

| File | Records | Purpose and schema |
|---|---:|---|
| [users.csv](users.csv) | 25 | Employee roster: EmployeeID, DisplayName, FirstName, LastName, Department, JobTitle, Manager, EmploymentStatus |
| [entra-bulk-users.csv](entra-bulk-users.csv) | 24 | Provisioning-oriented dataset: UserPrincipalName, DisplayName, FirstName, LastName, Department, JobTitle, ManagerUPN, UsageLocation |

The roster includes Blake Cooper; the provisioning-oriented dataset does not. The original README describes both manual and bulk creation, and Blake has dedicated identity evidence. This is consistent with separate provisioning workflows, but the precise reason for exclusion is not explicitly recorded. These files are not duplicates and should not be merged automatically.

`Manager` contains display names; `ManagerUPN` contains user principal names. The current provisioning script does not assign managers. The tenant domain and `CA` usage location are lab values, not portable defaults for another environment.

## Script Compatibility

The [provisioning script](../scripts/new-entra-users-from-csv.ps1) imports `entra-bulk-users.csv` using a path relative to `$PSScriptRoot`. It maps `FirstName` to `GivenName` and `LastName` to `Surname`.

`users.csv` remains the employee roster and is not the provisioning input; it lacks the required UPN and usage-location fields. The path/schema correction received offline/static validation only and has not been tested against a live tenant. Neither CSV was changed. See [script limitations](../scripts/README.md).
