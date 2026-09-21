# Identity and Access Standards

## Purpose

This document defines the identity, naming, access, and administrative standards used within the Northstar Creative Solutions Modern Workplace lab.

These standards are intended to keep account creation consistent, reduce administrative mistakes, and support least-privilege practices.

## User Principal Name Standard

Standard user accounts will use the following naming format:

`firstname.lastname@ijatoye.onmicrosoft.com`

Example:

`blake.cooper@ijatoye.onmicrosoft.com`

The validated Microsoft 365 tenant domain for this lab is ijatoye.onmicrosoft.com.

## Display Name Standard

User display names will use:

`FirstName LastName`

Example:

`Blake Cooper`

## Account Naming Principles

- Use clear, predictable naming conventions.
- Avoid nicknames unless required by the business scenario.
- Do not reuse accounts belonging to former users.
- Do not create shared personal user accounts.
- Administrative accounts should be separate from standard daily-use accounts where licensing and platform capabilities permit.

## Group Naming Standard

Department and access groups will use descriptive names.

Examples:

- `GRP-Finance`
- `GRP-Sales`
- `GRP-Marketing`
- `GRP-Operations`
- `GRP-HumanResources`
- `GRP-CreativeServices`

Where a group is used for a specific resource or role, the name should clearly describe its purpose.

Example:

`GRP-Finance-SharedResources`

## Administrative Access

Administrative privileges will be assigned only when required.

Principles:

- Follow least privilege.
- Avoid using highly privileged roles for routine support tasks.
- Use role-specific administrative permissions where available.
- Maintain separate administrative identity where practical.
- Review privileged access after role changes or offboarding.

## Authentication and MFA

Where licensing and tenant capabilities permit:

- MFA will be enabled for appropriate accounts.
- Administrative accounts will receive stronger authentication requirements.
- Legacy or weaker authentication methods will be avoided where possible.
- Authentication configuration will be validated before being documented as implemented.

## Joiner, Mover, Leaver Principle

Identity changes will follow three lifecycle categories:

### Joiner

New employees require:

- account creation
- correct department and job information
- group membership
- licence assignment
- authentication setup
- device/access preparation where applicable

### Mover

Employees changing roles may require:

- department updates
- manager changes
- group membership changes
- removal of unnecessary access
- assignment of new access
- licence review

### Leaver

Departing employees require:

- sign-in/access restrictions
- session revocation where appropriate
- group and role review
- licence recovery
- device handling
- account retention or deletion according to the simulated scenario

## Security Rule

No passwords, MFA secrets, recovery codes, tokens, authentication secrets, or real personal information will be stored in this public repository.
