provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

module "gcp_vm" {
  source = "../../../modules/vm"

  project_id = var.project_id
  region = var.region
  zone = var.zone

  cluster = var.cluster
  project_name = var.project_name
  dc = var.dc
  env = var.env

  machine = var.machine
  disk_type = var.disk_type
  disk_size_gb = var.disk_size_gb
  source_image = var.source_image
}