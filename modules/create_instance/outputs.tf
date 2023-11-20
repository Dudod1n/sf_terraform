
output "internal_ip_address_server" {
  value       = yandex_compute_instance.server.network_interface[0].ip_address
  description = " An internal IP address of the instance server-lemp"
}

output "external_ip_address_server" {
  value       = yandex_compute_instance.server.network_interface[0].nat_ip_address
  description = "An assigned external IP address if the instance server-lemp"
}

output "instance_subnet_id" {
  value       = yandex_vpc_subnet.subnet.id
  description = "ID подсети созданной виртуальной машины"
}
