provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

terraform {
  backend "gcs" {
    bucket = "td-docker-back"
    prefix = "terraform/state"
  }
}

resource "google_container_cluster" "gke-cluster" {
  name		= "gke-cluster"
  zone		= "${var.zone}"
  initial_node_count = "2"
  node_version = "1.10.11-gke.1"
  min_master_version = "1.10.11-gke.1"
  enable_legacy_abac = false
  
  node_config {
    disk_size_gb = "20"
    machine_type = "g1-small"
  }

  master_auth {
    username = ""
    password = ""
  }
  addons_config {
    kubernetes_dashboard {
      disabled = false
    }
  }
}
    
