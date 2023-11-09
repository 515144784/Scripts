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
      name = "saswarra-sas-warr-anlyts-d-1"
    }
  }
}

# Data resource containing the current GCP project; helpful as reference in other resources.
data "google_projects" "current_project" {
  filter = "name:saswarra-sas-warr-anlyts-d-1"
}

#######################################################################
#     Enable apis required to create and manage resources             #
#######################################################################
module "enables-api" {
  source      = "./modules/enable-apis"
  project_id  = var.project_id
  service_api = var.service_api
}


#############################################################
#    reserving static internal IP to assign to VM            #
#############################################################

module "reserve-internal-ip" {
  source       = "./modules/reserve-internal-static-ip"
  count_of_ips = var.count_of_ips
  project_id   = var.project_id
  region       = var.region
  subnetwork   = var.subnetwork
  address_type = var.address_type
}

#############################################################
#    create service account iam and role binding            #
#############################################################

module "service-account-iam" {
  for_each             = var.service_account_id
  source               = "./modules/service-account-iam"
  project_id           = var.project_id
  service_account_id   = each.key
  account_display_name = each.value.account_display_name
  roles                = each.value.roles
  depends_on           = [module.enables-api]
}


#######################################################################
#          VM with custom boot disk        #
#######################################################################



module "vm-instance-with-boot-disk" {
  source               = "./modules/gce-with-custom-boot-disk"
  project_id           = var.project_id
  for_each             = var.compute_instances_with_addl_disk
  instance_name        = each.key
  machine_type         = each.value.machine_type
  zone                 = each.value.zone
  image                = each.value.image
  vpc_network          = each.value.vpc_network
  subnetwork           = each.value.subnetwork
  service_account      = each.value.service_account
  reserved_ip          = each.value.reserved_ip
  boot_disk_type       = each.value.boot_disk_type
  boot_disk_size       = each.value.boot_disk_size
  tags                 = each.value.tags
  additional_disk_name = each.value.additional_disk_name
  additional_disk_type = each.value.additional_disk_type
  additional_disk_size = each.value.additional_disk_size
}