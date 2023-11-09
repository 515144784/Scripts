#
# EXAMPLE VARIABLES

# Service-Now App ID
app_id = "saswarra"

# Application name as it appears in the project name
app_name = "sas-warr-anlyts"

project_id = "saswarra-sas-warr-anlyts--1869"
## APIs to enable

service_api = ["vpcaccess.googleapis.com", "servicemanagement.googleapis.com", "servicecontrol.googleapis.com", "dns.googleapis.com", "datamigration.googleapis.com", "logging.googleapis.com", "run.googleapis.com", "sqladmin.googleapis.com", ]

### variable initiation for reserving static internal IP

count_of_ips = 3
region       = "us-east4"
subnetwork   = "projects/gcp-network-devnet-p-0c1e/regions/us-east4/subnetworks/gcp-network-devsub-p-001-use4"
address_type = "INTERNAL"

### Creating service account and assigning roles

service_account_id = {
  "sa-for-vms" = {
    account_display_name = "sa-for-vms"
    roles                = ["roles/compute.instanceAdmin.v1", "roles/logging.logWriter", "roles/monitoring.metricWriter"]
  }
}


### VM variables initialization  ##

compute_instances_with_addl_disk = {
  "sas-metadata-prd" = {
    machine_type         = "e2-standard-8"
    zone                 = "us-east4-a"
    image                = "rhel-9-v20230509"
    vpc_network          = "projects/gcp-network-devnet-p-0c1e/global/networks/gcp-network-devvpc-p"
    subnetwork           = "projects/gcp-network-devnet-p-0c1e/regions/us-east4/subnetworks/gcp-network-devsub-p-001-use4"
    service_account      = "sa-for-vms@saswarra-sas-warr-anlyts--1869.iam.gserviceaccount.com"
    reserved_ip          = "172.24.128.212"
    boot_disk_type       = "pd-balanced"
    boot_disk_size       = 100
    tags                 = []
    additional_disk_name = "sas-metadata-prd-addl-disk"
    additional_disk_type = "pd-balanced"
    additional_disk_size = 500
  }
}
