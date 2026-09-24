# Validation Summary

This index records what the committed evidence shows. It is a review of saved lab artifacts, not a fresh test of the tenant or endpoint.

| Area | Evidence | Supported observation |
|---|---|---|
| Workforce groups | [Department membership](../evidence/identity/entra-department-group-membership-validation.png) | Eight department groups; membership counts total 25 |
| User provisioning | [Graph result](../evidence/identity/graph-powershell-user-provisioning-validation.png) | Emerson Baker creation output and queried attributes |
| Roles | [Administrative roles](../evidence/identity/entra-least-privilege-admin-role-validation.png) | Helpdesk Administrator and User Administrator assignments |
| Licensing | [License validation](../evidence/identity/m365-business-premium-license-validation.png) | Recorded license and licensed-user counts |
| MFA rollout | [Report-only](../evidence/security/conditional-access-mfa-report-only.png), [enabled](../evidence/security/conditional-access-mfa-enabled.png) | Custom MFA policy progresses from report-only to On |
| Emergency identity | [Sign-in policy results](../evidence/security/emergency-admin-conditional-access-validation.png) | Successful MFA policy results; no proof of an independent recovery design |
| Enrollment and naming | [Initial](../evidence/device-management/intune-device-enrollment-compliant.png), [renamed](../evidence/device-management/device-renamed-intune.png) | Intune-managed endpoint, Sam Rivera association, old and new names |
| Compliance | [Policies](../evidence/device-management/device-compliance-policies.png), [settings](../evidence/device-management/windows11-baseline-setting-compliance.png) | Default/custom policies and five custom checks report Compliant |
| Configuration | [Device report](../evidence/device-management/device-configuration-success.png), [Defender settings](../evidence/device-management/windows11-security-baseline-success.png) | Successful profile/settings application; configured values not displayed |
| Windows Hello | [Policy result](../evidence/device-management/windows-hello-policy-success.png) | Workaround profile reports success |
| Applications | [Managed apps](../evidence/device-management/managed-apps-inventory.png), [Company Portal](../evidence/device-management/company-portal-installed.png), [PowerToys](../evidence/device-management/powertoys-installed.png) | Required install status and local application presence |
| Remote sync | [Sync result](../evidence/device-management/remote-sync-success.png) | Four policies succeeded, two applications offered, no script updates |
| Print Spooler | [Stopped](../evidence/remediation/print-spooler-stopped-before-remediation.png), [running](../evidence/remediation/print-spooler-remediation-success.png), [action report](../evidence/remediation/intune-remediation-action-complete.png) | Service state transition and one completed action; two actions still pending in the capture |

## Evidence Boundaries

- The original README records Windows Hello registry validation (`UsePassportForWork = 0`) and successful sign-in after the workaround. No dedicated registry or post-workaround sign-in capture is committed.
- The original [detection](../scripts/detect-print-spooler.ps1) and [remediation](../scripts/remediate-print-spooler.ps1) scripts used during the lab are included with their PowerShell logic preserved. All three scripts pass PowerShell syntax parsing; no live execution was performed. Detection output, startup-type verification, and scheduling configuration remain absent. The screenshots do not establish every step independently.
- The provisioning script now resolves `data/entra-bulk-users.csv` relative to `$PSScriptRoot` and maps `FirstName`/`LastName` to `GivenName`/`Surname`. Validation is offline/static only; no Graph authentication, user creation, or Print Spooler script execution was performed.
- Earlier endpoint screenshots retain `WIN-8M79HVU6TOU`; later ones use `LAB-WIN11-01`. They document different stages of the lab.
- Screenshots are historical snapshots. A success result does not establish ongoing compliance or success of every attempted action.

## Supporting Records

- [Environment architecture](../architecture/environment-architecture.md)
- [Windows Hello incident](../troubleshooting/windows-hello-provisioning.md)
- [Bulk-provisioning incident](../troubleshooting/bulk-user-provisioning-password-policy.md)
- [Print Spooler case](../docs/print-spooler-remediation.md)
- [Dataset definitions](../data/README.md)
- [Script status and limitations](../scripts/README.md)
