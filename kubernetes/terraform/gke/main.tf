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

resource "google_container_node_pool" "powerful-worker" {
  name       = "powerful-worker"
  zone       = "${var.zone}"
  cluster    = "${google_container_cluster.gke-cluster.name}"
  node_count = 1

  node_config {
    disk_size_gb = "40"
    machine_type = "n1-standard-2"
    oauth_scopes = [
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring",
    ]
    tags = [
      "powerful-worker"
    ]
  }
}

resource "google_container_cluster" "gke-cluster" {
  name		= "gke-cluster"
  zone		= "${var.zone}"
  node_version = "1.10.11-gke.1"
  min_master_version = "1.10.11-gke.1"
  enable_legacy_abac = true
  initial_node_count = 3

  lifecycle {
    ignore_changes = ["node_pool"]
  }

  node_config {
    disk_size_gb = "20"
    machine_type = "g1-small"
    oauth_scopes = [
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring",
    ]
    tags = [
      "default-worker"
    ]
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
    
