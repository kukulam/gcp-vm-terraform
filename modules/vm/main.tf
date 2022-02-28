provider "google" {
  project = var.project_id
  region = var.region
}

resource "google_compute_instance" gcp_vm_instance {
  machine_type = var.machine
  name = var.cluster
  zone = var.zone

  boot_disk {
    auto_delete = true
    initialize_params {
      image = var.source_image
      type = var.disk_type
      size = var.disk_size_gb
    }
  }

  network_interface {
    network = "default"
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = "echo \"starting vm\""
}