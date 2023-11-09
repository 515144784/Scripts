

resource "google_compute_address" "internal_static_ip" {
  count   = var.count_of_ips
  project = var.project_id
  region  = var.region
  #name         = var.name
  name         = "internal-static-${count.index}"
  subnetwork   = var.subnetwork
  address_type = var.address_type
}