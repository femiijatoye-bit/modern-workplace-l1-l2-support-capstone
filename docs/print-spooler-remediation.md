# Print Spooler Remediation Case

## Scenario

The lab intentionally stopped the Windows Print Spooler service to simulate a printing support incident on `LAB-WIN11-01`. The original README describes an Intune detection/remediation package used to restore the service.

## Recorded Script Intent

The original lab narrative describes a detection script that checks the service state and reports a failure condition when stopped, and a remediation script that configures startup type, starts the service, and checks for a running state.

The original `.ps1` files are not committed. Their exact code, exit codes, configured startup type, execution identity, PowerShell bitness, assignments, and schedule cannot be verified from the repository. No replacement scripts have been created.

## Evidence Sequence

| Stage | Evidence | What is visible |
|---|---|---|
| Simulated failure | [Stopped service](../evidence/remediation/print-spooler-stopped-before-remediation.png) | `Stop-Service` followed by `Get-Service`; Spooler is Stopped |
| Remote action | [Intune action report](../evidence/remediation/intune-remediation-action-complete.png) | One Run remediation action is Complete; two other entries are Pending |
| Observed outcome | [Running service](../evidence/remediation/print-spooler-remediation-success.png) | Earlier Stopped output followed by a later Running result |

Taken with the original lab narrative, these captures support the remediation case. They do not independently prove the detection result, link a specific action ID to the local terminal output, or establish that all attempts completed. The service screenshots use an Administrator PowerShell terminal; this does not establish the execution identity of the Intune scripts.

## Documentation Status

The stopped/running evidence and remote action capture are preserved. Reproducible script review remains dependent on recovering the actual lab scripts. A scheduled proactive-remediation configuration is not shown in the saved screenshots.

See [script status](../scripts/README.md) and the [validation summary](../validation/validation-summary.md).
