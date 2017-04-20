output "private_ip" {
  value = "${azurerm_network_interface.private_nic.private_ip_address}"
}

output "bastion_ip" {
  value = "${var.allspark["bastion_ip"]}"
}

output "username" {
  value = "${var.username}"
}

output "password" {
  value = "${var.password}"
}

output "allspark_data" {
  value = {
    bastion_ip = "${var.bastion["bastion_ip"]}"
    username   = "${var.username}"
    private_ip = "${azurerm_network_interface.private_nic.private_ip_address}"
  }
}
