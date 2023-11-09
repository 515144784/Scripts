# saswarra-sas-warr-anlyts-iac

Terraform IAC for saswarra-sas-warr-anlyts workspaces.

[![saswarra-sas-warr-anlyts-d-1](https://github.com/husa-init/saswarra-sas-warr-anlyts-iac/actions/workflows/saswarra-sas-warr-anlyts-d-1.yaml/badge.svg)](https://github.com/husa-init/saswarra-sas-warr-anlyts-iac/actions/workflows/saswarra-sas-warr-anlyts-d-1.yaml)
[![saswarra-sas-warr-anlyts-p-1](https://github.com/husa-init/saswarra-sas-warr-anlyts-iac/actions/workflows/saswarra-sas-warr-anlyts-p-1.yaml/badge.svg)](https://github.com/husa-init/saswarra-sas-warr-anlyts-iac/actions/workflows/saswarra-sas-warr-anlyts-p-1.yaml)

## Purpose

Repository of terraform for application infrastructure as code deployments
via Terraform Cloud Workspaces.

**NOTE: Do not mix non-IAC/non-Terraform data into this repository.  This
repository should only be used for Terraform Infrastructure-as-Code.**

## Workspace(s)

The following project workspaces exist:

* saswarra-sas-warr-anlyts-d-1
* saswarra-sas-warr-anlyts-p-1
## Usage

This repository comes pre-configured with basic workspace Terraform and relevant
Actions workflows to automatically apply your commits to Terraform Cloud.

Each workspace represents one deployment (GCP Project, AWS to be determined), and
there should be only one set of Terraform files for that workspace.  By default,
they are contained within a directory named the same as the workspace.

Each directory of Terraform files has an equivalent Actions workflow that will apply
those changes to the relevant Terraform Cloud workspace.

It is strongly recommended to keep with this workspace-terraform-as-directories 
design as it comes from the repository template.  This is the current best
practice recommendation.  It provides for clean separation, without the complexity
of multiple branches for content management, and instead keeps branches for applying
changes to the `main` branch by way of pull requests.

As mentioned above, it is strongly recommended to not mix non-IAC data into this
repository. If you need to keep architectural or design documentation, application
development, or other data for your deployment, those should be contained in their
own repository using a similar namespace as this `saswarra-sas-warr-anlyts-iac`
repository.  Such as `saswarra-sas-warr-anlyts-architecture`, or
`saswarra-sas-warr-anlyts-documentation`, et cetera.
