# Windows Hello Provisioning Loop

## Symptom and Scope

The original lab README records a Windows 11 VM becoming stuck in Windows Hello / PIN provisioning after MFA during Entra sign-in. This record organizes that existing account and links the available evidence; it does not add a new test result.

## Investigation and Workaround

The lab isolated the issue to the Windows Hello provisioning stage and created the Intune Settings Catalog profile **LAB - Disable Windows Hello for Business** for the test endpoint. This was a lab-specific workaround, not a demonstrated general production resolution. The repository does not establish the underlying platform cause of the provisioning loop.

The original account records endpoint synchronization, registry validation of `UsePassportForWork = 0`, and successful Entra sign-in after the policy applied.

## Available Validation

- [Windows Hello policy report](../evidence/device-management/windows-hello-policy-success.png) shows one successful device, under the earlier name `WIN-8M79HVU6TOU`.
- [Device configuration report](../evidence/device-management/device-configuration-success.png) shows the profile succeeded for the later name `LAB-WIN11-01`.
- [Remote sync report](../evidence/device-management/remote-sync-success.png) records a completed sync; it is not itself a capture of the sign-in fix.

The registry value and successful post-workaround sign-in are documented observations from the original README. Dedicated screenshots or exported logs for those checks are not committed.

## Support Takeaways

Separate the symptom, workaround, and confirmed root cause. Record policy application independently from the user-visible outcome, and explain device renames so historical evidence remains understandable.

See the [validation summary](../validation/validation-summary.md) for the scope of the saved evidence.
