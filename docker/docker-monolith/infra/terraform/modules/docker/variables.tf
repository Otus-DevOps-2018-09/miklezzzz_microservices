variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable docker_disk_image {
  description = "Disk image for docker host"
  default     = "ubuntu-1604-lts"
}

variable public_key_path {
  description = "Path to the public key for ssh"
}

variable name {
  description = "App name"
}

variable tags {
  description = "App tags"
  type        = "list"
}

variable ssh_key_for_provisioners {
  description = "Path to ssh private key for provisioners"
}

variable instance_count {
  description = "Number of instances to run"
  default     = "1"
}

