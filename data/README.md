# Lab Datasets

These datasets describe the fictional Northstar Creative Solutions workforce. Existing CSV contents are preserved.

| File | Records | Purpose and schema |
|---|---:|---|
| [users.csv](users.csv) | 25 | Employee roster: EmployeeID, DisplayName, FirstName, LastName, Department, JobTitle, Manager, EmploymentStatus |
| [entra-bulk-users.csv](entra-bulk-users.csv) | 24 | Provisioning-oriented dataset: UserPrincipalName, DisplayName, FirstName, LastName, Department, JobTitle, ManagerUPN, UsageLocation |

The roster includes Blake Cooper; the provisioning-oriented dataset does not. The original README describes both manual and bulk creation, and Blake has dedicated identity evidence. This is consistent with separate provisioning workflows, but the precise reason for exclusion is not explicitly recorded. These files are not duplicates and should not be merged automatically.

`Manager` contains display names; `ManagerUPN` contains user principal names. The current provisioning script does not assign managers. The tenant domain and `CA` usage location are lab values, not portable defaults for another environment.

## Script Compatibility

The [provisioning script](../scripts/new-entra-users-from-csv.ps1) references `data/users-to-provision.csv`, which is absent. It also reads `GivenName` and `Surname`, while the provisioning dataset uses `FirstName` and `LastName`. The employee roster does not provide the script's required UPN and usage-location fields.

Neither CSV is a drop-in input for the unmodified script. No CSV or script corrections are included in this documentation cleanup. See [script limitations](../scripts/README.md).
