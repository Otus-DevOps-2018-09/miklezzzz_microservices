variable docker_disk_image {
  description = "Disk image for docker host"
  default     = "docker-host"
}

variable project {
  description = "Project ID"
}

variable name {
  description = "Host name"
  default = "docker-host-gitlabrunner"
}

variable docker_ip_name {
  description = "IP resource name"
  default = "docker-ip"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable public_key_path {
  description = "Path to the public key for ssh"
}

variable disk_image {
  description = "Diks image"
}

variable ssh_key_for_provisioners {
  description = "SSH private key for provisioners"
}

variable instance_count {
  description = "Number of instances to run"
  default     = "1"
}

