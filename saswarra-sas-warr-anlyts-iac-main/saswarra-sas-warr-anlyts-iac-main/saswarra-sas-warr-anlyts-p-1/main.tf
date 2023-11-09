terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.38.0"
    }
    # google_beta = { # google-beta provider may be necessary for certain resources
    #   source  = "hashicorp/google-beta"
    #   version = ">=4.38.0"
    # }
  }
  cloud {
    # The name of your Terraform Cloud organization.
    organization = "applhome"
    workspaces {
      # The name of the Terraform Cloud workspace to store Terraform state files in.
      # This value cannot be or contain a variable. No interpolation.
      name = "saswarra-sas-warr-anlyts-p-1"
    }
  }
}

# Data resource containing the current GCP project; helpful as reference in other resources.
data "google_projects" "current_project" {
  filter = "name:saswarra-sas-warr-anlyts-p-1"
}
