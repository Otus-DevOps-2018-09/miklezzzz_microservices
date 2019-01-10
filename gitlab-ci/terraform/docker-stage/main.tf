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

module "docker" {
  instance_count           = "${var.instance_count}"
  source                   = "../modules/docker"
  public_key_path          = "${var.public_key_path}"
  svc_account              = "${var.svc_account}"
  name                     = "${var.name}"
  zone                     = "${var.zone}"
  docker_disk_image        = "${var.docker_disk_image}"
  tags                     = ["stage", "docker", "gitlab-runner"]
  ssh_key_for_provisioners = "${var.ssh_key_for_provisioners}"
}


