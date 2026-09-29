# Print Spooler Remediation Case

## Scenario

The lab intentionally stopped the Windows Print Spooler service to simulate a printing support incident on `LAB-WIN11-01`. The original README describes an Intune detection/remediation package used to restore the service.

## Script Behavior and Validation

The committed [detection script](../scripts/detect-print-spooler.ps1) checks Spooler and exits 0 when Running or 1 otherwise. The [remediation script](../scripts/remediate-print-spooler.ps1) requests Automatic startup, starts the service, and checks for Running status.

The source permits review of the code, exit paths, and requested startup type. Repository validation was syntax/static only; it did not execute these scripts. The saved evidence does not independently confirm the applied startup type, execution identity, PowerShell bitness, assignments, or schedule. See [script limitations](../scripts/README.md).

## Evidence Sequence

| Stage | Evidence | What is visible |
|---|---|---|
| Simulated failure | [Stopped service](../evidence/remediation/print-spooler-stopped-before-remediation.png) | `Stop-Service` followed by `Get-Service`; Spooler is Stopped |
| Remote action | [Intune action report](../evidence/remediation/intune-remediation-action-complete.png) | One Run remediation action is Complete; two other entries are Pending |
| Observed outcome | [Running service](../evidence/remediation/print-spooler-remediation-success.png) | Earlier Stopped output followed by a later Running result |

Taken with the original lab narrative, these captures support the remediation case. They do not independently prove the detection result, link a specific action ID to the local terminal output, or establish that all attempts completed. The service screenshots use an Administrator PowerShell terminal; this does not establish the execution identity of the Intune scripts.

## Documentation Status

The stopped/running evidence and remote action capture are preserved. The committed scripts are available for source review; live retesting was outside the repository cleanup. A scheduled proactive-remediation configuration is not shown in the saved screenshots.

See [script status](../scripts/README.md) and the [validation summary](../validation/validation-summary.md).
