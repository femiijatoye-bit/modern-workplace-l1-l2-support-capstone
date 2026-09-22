# Bulk User Provisioning Failure — Password Complexity

## Scenario

During Microsoft Entra ID bulk user provisioning, a test import was performed for the fictional employee Avery Morgan before provisioning the remaining workforce.

The bulk operation was submitted successfully but later returned a failed status.

## Symptom

The Microsoft Entra bulk operation reported that user creation failed.

The exported bulk-operation result contained the following error:

> The specified password does not comply with password complexity requirements. Please provide a different password.

## Root Cause

The temporary password supplied in the private Microsoft bulk-create CSV did not satisfy Microsoft Entra password complexity requirements.

No credentials or temporary passwords are stored in this public repository.

## Resolution

1. Reviewed the exported bulk-operation error details.
2. Identified password complexity as the specific failure condition.
3. Replaced the temporary password in the private local CSV with a stronger password.
4. Re-exported the CSV.
5. Re-ran the Microsoft Entra bulk-create operation.
6. Verified that Avery Morgan was successfully created.
7. Validated the imported user attributes, including:
   - display name
   - user principal name
   - first and last name
   - job title
   - department
   - usage location
   - account enabled status

## Result

The second bulk provisioning attempt completed successfully and the Avery Morgan account was created with the intended identity and business attributes.

## Lessons Learned

- Validate bulk imports with a small test batch before provisioning many users.
- Review row-level export results instead of relying only on the high-level failed status.
- Password policy failures can prevent user creation even when the CSV structure is otherwise valid.
- Sensitive operational data such as temporary passwords should remain outside public source control.
- Post-change validation is required even after an import reports success.
