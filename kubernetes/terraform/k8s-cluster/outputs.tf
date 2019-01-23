output "controller_external_ips" {
  value = "${module.controller.controller_ip}"
}

output "worker_external_ips" {
  value = "${module.worker.worker_ip}"
}
