output "cloudinit" {
  value = "\n${data.template_file.cloudinit.rendered}"
}

output "network_output" {
  value = module.vpc_dev.network_info
}

output "subnet_output" {
  value = module.vpc_dev.subnet_info
}