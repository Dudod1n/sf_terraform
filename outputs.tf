output "internal_ip_address_server1" {
  value       = module.create_server1.internal_ip_address_server
  description = " An internal IP address of the instance server-lemp"
}

output "external_ip_address_server1" {
  value       = module.create_server1.external_ip_address_server
  description = "An assigned external IP address if the instance server-lemp"
}

output "internal_ip_address_server2" {
  value       = module.create_server2.internal_ip_address_server
  description = " An internal IP address of the instance server-lemp"
}

output "external_ip_address_server2" {
  value       = module.create_server2.external_ip_address_server
  description = "An assigned external IP address if the instance server-lemp"
}


