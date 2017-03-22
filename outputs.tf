output "public_ip" {
  value = "${azurerm_public_ip.ip.ip_address}"
}

output "private_ip" {
  value = "${azurerm_network_interface.private_nic.private_ip_address}"
}

output "username" {
  value = "${var.username}"
}

output "password" {
  value = "${var.password}"
}
