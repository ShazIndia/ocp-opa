# OPA Policy Demo with GitHub Actions and OpenShift

## Overview
This repository demonstrates:
1. Writing and testing OPA policies using Rego.
2. Automating policy validation with GitHub Actions.
3. Enforcing policies on OpenShift with OPA Gatekeeper.

## Folder Structure
- **policies/**: Contains Rego policies and tests.
- **manifests/**: OpenShift manifests for Gatekeeper deployment.
- **.github/**: GitHub Actions workflows for CI.

## Features
- **Reusable Policies**: The same Rego policy is used across both CI and runtime enforcement.
- **GitHub Actions Integration**: Policies are validated automatically during CI.
- **OpenShift Enforcement**: Policies are enforced in real-time using OPA Gatekeeper.

## Prerequisites
- OpenShift cluster with OPA Gatekeeper installed.
- GitHub Actions enabled for this repository.

## Usage
1. **Run CI Tests**: Push code to the `main` branch to trigger policy validation in GitHub Actions.
   ```bash
   opa test policies/
