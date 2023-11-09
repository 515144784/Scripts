variable "project_id" {
  type        = string
  description = "project_id"
}

variable "instance_name" {
  type        = string
  description = "instance_name"
}

variable "machine_type" {
  type        = string
  description = "machine_type"
}

variable "zone" {
  type        = string
  description = "vm zone"
}

variable "image" {
  type        = string
  description = "vm image"
}

variable "vpc_network" {
  type        = string
  description = "vpc_network"
}

variable "subnetwork" {
  description = "subnetwork of the host project VPC"
  type        = string
}

variable "service_account" {
  description = "service account of the VM"
  type        = string
}


variable "reserved_ip" {
  description = "reserved ip to be assigned for the  VM"
  type        = string
}

variable "boot_disk_size" {
  description = "size of the boot disk"
  type        = number
}

variable "boot_disk_type" {
  description = "type of the boot disk"
  type        = string
}



variable "tags" {
  description = "network tags for the VM"
  type        = list(string)
}

### variables for additional disk 

variable "additional_disk_name" {
  description = "name of the additional disk"
  type        = string
}

variable "additional_disk_type" {
  description = "type of the additional disk"
  type        = string
}

variable "additional_disk_size" {
  description = "size of the additional disk"
  type        = number
}