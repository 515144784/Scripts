#
# EXAMPLE VARIABLES

# Service-Now App ID
variable "app_id" {
  type        = string
  description = "The Service-Now App ID"
  nullable    = false
}

##project _id

variable "project_id" {
  type        = string
  description = "project ID"
}

# Application name as it appears in the project name
variable "app_name" {
  type        = string
  description = "The application name as it appears as part of the project name"
  nullable    = false
}

## Variable for enabling APIs

variable "service_api" {
  type        = list(string)
  description = "apis"
}

#### variables for reserving static IP

variable "subnetwork" {
  type        = string
  description = "The subnet containing the address.  For EXTERNAL addresses use the empty string, \"\".  (e.g. \"projects/<project-name>/regions/<region-name>/subnetworks/<subnetwork-name>\")"
  default     = ""
}


variable "address_type" {
  type        = string
  description = "The type of address to reserve, either \"INTERNAL\" or \"EXTERNAL\". If unspecified, defaults to \"INTERNAL\"."
  default     = "INTERNAL"
}

variable "count_of_ips" {
  description = "number of IPs to be reserved"
  type        = number
}

variable "region" {
  description = "The region to create the address in"
  type        = string
  default     = ""
}


#create service account with required roles

variable "service_account_id" {
  description = " service account id"
  type = map(object({
    account_display_name = string
    roles                = list(string)
  }))
}

variable "account_display_name" {
  type        = string
  description = "service account display name"
  default     = "custom service account"
}


#### VM #####

variable "compute_instances_with_addl_disk" {
  type = map(object({
    machine_type         = string
    zone                 = string
    image                = string
    vpc_network          = string
    subnetwork           = string
    service_account      = string
    reserved_ip          = string
    boot_disk_type       = string
    boot_disk_size       = number
    tags                 = list(string)
    additional_disk_name = string
    additional_disk_type = string
    additional_disk_size = number
  }))
}

