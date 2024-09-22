output "network_info" {
  description = "Информация о созданной сети"
  value       = yandex_vpc_network.dev
}

output "subnet_info" {
  description = "Информация о созданной подсети"
  value       = yandex_vpc_subnet.subnet
}