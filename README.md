# Modern Workplace L1/L2 Support Capstone

Hands-on Modern Workplace support lab simulating L1/L2 administration across Microsoft Entra ID, Microsoft 365, Microsoft Intune, Windows 11 endpoints, identity lifecycle management, endpoint security, application deployment, troubleshooting, and proactive remediation.

---

## Project Overview

This project was built to simulate the day-to-day responsibilities of an IT Support, Service Desk, Desktop Support, or Modern Workplace administrator supporting a small corporate Microsoft environment.

Rather than demonstrating isolated features, the lab follows an endpoint through a realistic lifecycle:

**User provisioning → licensing → identity security → device enrollment → compliance → configuration → application deployment → troubleshooting → remote administration → proactive remediation**

The environment was designed, configured, tested, troubleshot, and documented from scratch.

---

## Documentation Guide

- [Environment architecture](architecture/environment-architecture.md)
- [Business scenario](docs/business-scenario.md) and [identity standards](docs/identity-access-standards.md)
- [Validation summary and evidence boundaries](validation/validation-summary.md)
- [Windows Hello incident](troubleshooting/windows-hello-provisioning.md) and [bulk-provisioning incident](troubleshooting/bulk-user-provisioning-password-policy.md)
- [Print Spooler remediation case](docs/print-spooler-remediation.md)
- [Dataset guide](data/README.md) and [script inventory and limitations](scripts/README.md)

## Environment

| Component | Technology |
|---|---|
| Identity | Microsoft Entra ID |
| Productivity | Microsoft 365 |
| Endpoint Management | Microsoft Intune |
| Endpoint | Windows 11 |
| Virtualization | UTM / QEMU |
| Automation | PowerShell / Microsoft Graph |
| Authentication | Microsoft Authenticator / MFA |
| Endpoint Security | Microsoft Defender |
| Source Control | GitHub |

---

## Skills Demonstrated

- Microsoft Entra ID user and group administration
- Microsoft 365 licensing and role assignment
- Bulk user provisioning with Microsoft Graph / PowerShell
- Role-based access control and least privilege
- Emergency administrator sign-in validation
- Multi-factor authentication
- Windows 11 enrollment into Microsoft Intune
- Device groups and targeted policy assignment
- Endpoint compliance policy creation and validation
- Microsoft Defender security configuration
- Windows Hello for Business policy troubleshooting
- Microsoft Store application deployment through Intune
- Required application assignment and installation monitoring
- Remote device synchronization and administration
- Endpoint naming and lifecycle management
- Per-setting compliance validation
- Print Spooler detection and remediation workflows
- Intune proactive remediations
- Troubleshooting and root-cause analysis
- Technical documentation and evidence collection

---

## Key Implementations

### 1. Identity and Organization Setup

Created a realistic Microsoft 365 organizational structure containing users across multiple departments including:

- Executive
- Human Resources
- Sales
- IT
- Finance
- Operations

Users were created both manually and through bulk provisioning workflows.

Microsoft 365 licenses, job titles, departments, and administrative roles were assigned to simulate a real business environment.

---

### 2. Identity Security and Access Control

Implemented identity-security controls including:

- Conditional Access MFA policy rollout
- Administrative role assignment
- Least-privilege access
- Emergency administrative access
- Documented standards for separating standard and privileged access

Validated role assignments through Microsoft Graph and captured successful MFA policy results for the emergency administrator sign-in.

---

### 3. Windows 11 Endpoint Enrollment

A Windows 11 virtual endpoint was enrolled into Microsoft Intune and associated with the test user **Sam Rivera**.

The endpoint was standardized and renamed:

`LAB-WIN11-01`

The endpoint was renamed from `WIN-8M79HVU6TOU` to `LAB-WIN11-01`. Saved Intune evidence captures both stages, with Sam Rivera as primary user, Personal ownership, and Compliant status.

---

### 4. Endpoint Compliance

Created a custom policy:

**Windows 11 Baseline Compliance**

The policy validates core security controls including:

- Firewall
- Antivirus
- Anti-spyware
- Microsoft Defender Antimalware
- Real-time protection

The enrolled Windows endpoint successfully reported **Compliant** against both the default Intune compliance policy and the custom Windows 11 baseline.

---

### 5. Endpoint Security Configuration

Created and deployed a custom Windows security configuration through the Intune Settings Catalog.

Controls included:

- Microsoft Defender real-time protection
- Defender behavior monitoring

Validated successful application of the custom Settings Catalog profile through saved Intune evidence. The separate compliance report also shows real-time protection as **Compliant**.

---

### 6. Windows Hello for Business Troubleshooting

During Entra sign-in, the Windows 11 VM became stuck during Windows Hello / PIN provisioning after MFA authentication.

A lab-specific Intune configuration profile was created:

**LAB - Disable Windows Hello for Business**

The policy disabled Windows Hello for Business provisioning for the test endpoint.

Verified policy application through Intune, checked `UsePassportForWork = 0` in the registry, and successfully restored Sam Rivera’s Entra sign-in. Saved Intune screenshots capture the successful policy application. See the [incident record](troubleshooting/windows-hello-provisioning.md) for the troubleshooting steps.

This scenario demonstrates practical troubleshooting involving:

- Authentication
- Intune policy deployment
- Windows registry validation
- Endpoint synchronization
- Provisioning-stage isolation and a lab-specific workaround

---

### 7. Application Deployment

Applications were centrally deployed through Microsoft Intune using **Microsoft Store app (new)**.

Required applications included:

- Company Portal
- Microsoft PowerToys

Both applications were assigned to the lab Windows device group and successfully installed on `LAB-WIN11-01`.

Installation was verified through:

- Intune application deployment reporting
- Device-centric managed application reporting
- Local Windows application validation

---

### 8. Remote Endpoint Administration

Remote administrative actions were performed through Intune, including:

- Device synchronization
- Policy refresh
- Application processing
- Configuration refresh

The captured remote sync reports:

- 4 of 4 policies succeeded
- 2 applications offered
- Scripts: completed, with no script updates

The endpoint remained compliant and Intune-managed after administrative changes.

---

### 9. Proactive Remediation

A practical support scenario was created around the Windows **Print Spooler** service.

The service was intentionally stopped to simulate a common end-user printing issue.

The workflow used two PowerShell scripts:

**Detection script**

- Checks the state of the Print Spooler service
- Returns a failure condition when the service is stopped

**Remediation script**

- Configures the Print Spooler startup type
- Starts the service
- Verifies that the service returns to a running state

The remediation package was deployed through Intune and executed remotely against:

`LAB-WIN11-01`

Initiated Intune remediation, verified that the service returned to **Running**, and captured a completed Intune device action.

The supplied original [detection](scripts/detect-print-spooler.ps1) and [remediation](scripts/remediate-print-spooler.ps1) scripts are included. See the [script notes](scripts/README.md) for implementation details. See the [remediation case](docs/print-spooler-remediation.md) for the workflow and saved evidence.

---

## Troubleshooting Highlights

Documented support incidents cover:

- [Bulk user provisioning and password complexity](troubleshooting/bulk-user-provisioning-password-policy.md)
- [Windows Hello provisioning loop](troubleshooting/windows-hello-provisioning.md)

The [Print Spooler case](docs/print-spooler-remediation.md) demonstrates service recovery and remote-action reporting. Together, these records connect symptoms, troubleshooting actions, and validated outcomes.

---

## Repository Structure

```text
architecture/
data/
docs/
evidence/
├── device-management/
├── identity/
├── remediation/
└── security/
scripts/
troubleshooting/
validation/
README.md
```

## Folder Purpose

- architecture/ — Environment and design documentation
- data/ — Provisioning datasets and supporting data
- docs/ — Administrative implementation notes
- evidence/ — Screenshots validating completed configurations
- scripts/ — PowerShell and Microsoft Graph automation
- troubleshooting/ — Issues, root causes, and resolutions
- validation/ — Configuration and outcome validation

## Key Outcomes

By the end of the lab, the environment demonstrated:

- A functioning Microsoft 365 organization
- Structured Entra ID identities and departments
- Microsoft 365 licensing
- MFA and administrative access controls
- An enrolled and managed Windows 11 endpoint
- Custom compliance policies
- Successful application of the custom Defender configuration profile
- Centralized application deployment
- Remote endpoint administration
- A Print Spooler remediation case with service-state and remote-action evidence
- Documented troubleshooting and validation

## Selected Evidence

Saved screenshots document key lab milestones. See the [validation summary](validation/validation-summary.md) for evidence boundaries and supporting records.

### Endpoint Management

- [Managed Windows 11 endpoint](evidence/device-management/device-renamed-intune.png)
- [Device configuration policies succeeded](evidence/device-management/device-configuration-success.png)
- [Windows 11 compliance settings](evidence/device-management/windows11-baseline-setting-compliance.png)
- [Managed applications installed](evidence/device-management/managed-apps-inventory.png)
- [Remote Intune sync completed](evidence/device-management/remote-sync-success.png)

### Proactive Remediation

- [Print Spooler stopped before remediation](evidence/remediation/print-spooler-stopped-before-remediation.png)
- [Print Spooler restored successfully](evidence/remediation/print-spooler-remediation-success.png)
- [Intune remediation action completed](evidence/remediation/intune-remediation-action-complete.png)

### Identity and Security

- [Identity administration evidence](evidence/identity/)
- [Security and privileged access evidence](evidence/security/)

## Target Roles

This project demonstrates practical experience relevant to:

- IT Support Technician
- Help Desk / Service Desk Analyst
- Desktop Support Technician
- Technical Support Analyst
- Microsoft 365 Support
- Junior Systems Administrator
- Modern Workplace / Endpoint Support
- SOC / Security Operations roles requiring endpoint administration knowledge

## Author

### Femi Ijatoye

CompTIA Security+ certified IT support professional with hands-on experience across Microsoft 365, Entra ID, Intune, Windows, macOS, Linux, networking, endpoint security, troubleshooting, and technical support.
