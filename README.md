# Modern Workplace L1/L2 Support Capstone

Hands-on Modern Workplace support lab simulating L1/L2 administration across Microsoft Entra ID, Microsoft 365, Microsoft Intune, Windows 11 endpoints, identity lifecycle management, endpoint security, application deployment, troubleshooting, and proactive remediation.

---

## Project Overview

This project was built to simulate the day-to-day responsibilities of an IT Support, Service Desk, Desktop Support, or Modern Workplace administrator supporting a small corporate Microsoft environment.

Rather than demonstrating isolated features, the lab follows an endpoint through a realistic lifecycle:

**User provisioning → licensing → identity security → device enrollment → compliance → configuration → application deployment → troubleshooting → remote administration → proactive remediation**

The environment was designed, configured, tested, troubleshot, and documented from scratch.

---

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
- Emergency / break-glass administrator configuration
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
- PowerShell detection and remediation scripting
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

- MFA registration and enforcement
- Administrative role assignment
- Least-privilege access
- Emergency administrative access
- Separation between standard users and privileged accounts

Role assignments and authentication behavior were validated through the Microsoft administration portals.

---

### 3. Windows 11 Endpoint Enrollment

A Windows 11 virtual endpoint was enrolled into Microsoft Intune and associated with the test user **Sam Rivera**.

The endpoint was standardized and renamed:

`LAB-WIN11-01`

Successful enrollment, synchronization, user association, and Intune management were validated from both the endpoint and administration console.

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

Successful policy application was validated from the device-centric configuration report.

---

### 6. Windows Hello for Business Troubleshooting

During Entra sign-in, the Windows 11 VM became stuck during Windows Hello / PIN provisioning after MFA authentication.

A lab-specific Intune configuration profile was created:

**LAB - Disable Windows Hello for Business**

The policy disabled Windows Hello for Business provisioning for the test endpoint.

Policy application was independently validated through the Windows registry:

`UsePassportForWork = 0`

After the policy applied, Entra sign-in completed successfully.

This scenario demonstrates practical troubleshooting involving:

- Authentication
- Intune policy deployment
- Windows registry validation
- Endpoint synchronization
- Root-cause isolation

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

A remote sync successfully processed:

- 4 policies
- 2 applications
- script status

The endpoint remained compliant and Intune-managed after administrative changes.

---

### 9. Proactive Remediation

A practical support scenario was created around the Windows **Print Spooler** service.

The service was intentionally stopped to simulate a common end-user printing issue.

Two PowerShell scripts were created:

**Detection script**
- Checks the state of the Print Spooler service
- Returns a failure condition when the service is stopped

**Remediation script**
- Configures the Print Spooler startup type
- Starts the service
- Verifies that the service returns to a running state

The remediation package was deployed through Intune and executed remotely against:

`LAB-WIN11-01`

The complete workflow was validated:

**Stopped → Detected → Remote remediation initiated → Running**

The Intune Device Actions report confirmed the remote remediation action completed successfully.

---

## Troubleshooting Highlights

This lab intentionally included troubleshooting rather than only documenting successful configuration.

Examples include:

- Windows Hello for Business provisioning loop
- MFA authentication behavior
- Intune policy propagation delays
- Application installation reporting delays
- Device synchronization
- Intune registry-policy validation
- Application deployment validation
- Remediation reporting behavior
- PowerShell script formatting issues between macOS and Windows

Troubleshooting findings are documented in the `/troubleshooting` directory.

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
### Key Outcomes
By the end of the lab, the environment demonstrated:
- A functioning Microsoft 365 organization
- Structured Entra ID identities and departments
- Microsoft 365 licensing
- MFA and administrative access controls
- An enrolled and managed Windows 11 endpoint
- Custom compliance policies
- Microsoft Defender configuration enforcement
- Centralized application deployment
- Remote endpoint administration
- Automated PowerShell remediation
- Documented troubleshooting and validation
### Target Roles
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
