resource "google_compute_instance" "docker" {
  count        = "${var.instance_count}"
  name         = "${var.name}-${count.index+1}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = "${var.tags}"

  boot_disk {
    initialize_params {
      image = "${var.docker_disk_image}"
    }
  }

  network_interface {
    network = "default"

  access_config = {}
  }

  metadata {
    ssh-keys = "shma:${file(var.public_key_path)}"
  }

  service_account {
    scopes = [ "cloud-platform" ]
    email = "${var.svc_account}"
  }

}

