resource "google_compute_http_health_check" "kubernetes" {
  name               = "kubernetes"
  request_path       = "/healthz"
  host               = "kubernetes.default.svc.cluster.local"
}

resource "google_compute_firewall" "kubernetes-the-hard-way-allow-health-check" {
  name    = "kubernetes-the-hard-way-allow-health-check"
  network = "${var.network-link}"

  allow {
    protocol = "tcp"
  }

  source_ranges = [ "209.85.152.0/22", "209.85.204.0/22", "35.191.0.0/16" ]
}

resource "google_compute_target_pool" "kubernetes-target-pool" {
  name = "kubernetes-target-pool"

  health_checks = [
    "${google_compute_http_health_check.kubernetes.self_link}",
  ]

  instances = [ "${var.pool_instances}" ]

}

resource "google_compute_forwarding_rule" "kubernetes-forwarding-rule" {
  name       = "kubernetes-forwarding-rule"
  target     = "${google_compute_target_pool.kubernetes-target-pool.self_link}"
  port_range = "6443"
  region     = "${var.region}"
  ip_address = "${var.external_ip}"
}

