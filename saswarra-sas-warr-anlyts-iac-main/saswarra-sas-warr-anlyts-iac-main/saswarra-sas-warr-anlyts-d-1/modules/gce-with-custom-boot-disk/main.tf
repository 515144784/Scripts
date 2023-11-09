
resource "google_compute_disk" "default" {
  name    = var.additional_disk_name
  type    = var.additional_disk_type
  project = var.project_id
  zone    = var.zone
  size    = var.additional_disk_size
}

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  project      = var.project_id
  zone         = var.zone
  boot_disk {
    initialize_params {
      size  = var.boot_disk_size
      type  = var.boot_disk_type
      image = var.image
    }
  }

  attached_disk {
    source      = google_compute_disk.default.id
    device_name = google_compute_disk.default.name
  }


  tags = var.tags
  network_interface {
    network    = var.vpc_network
    subnetwork = var.subnetwork
    network_ip = var.reserved_ip

  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service_account
    scopes = ["cloud-platform"]
  }

}
