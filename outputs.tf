output "public_ip" {
  value = "${azurerm_public_ip.ip.ip_address}"
}

output "private_ip" {
  value = "${azurerm_network_interface.nic.private_ip_address}"
}

output "username" {
  value = "${var.username}"
}

output "password" {
  value = "${var.password}"
}
