resource "azurerm_network_interface" "private_nic" {
    name = "${var.name}_nic0"
    location = "${var.allspark["location"]}"
    resource_group_name = "${var.allspark["resource_group_name"]}"

    ip_configuration {
        name = "${var.name}_ip"
        subnet_id = "${module.subnet_config.id}"
        private_ip_address_allocation = "dynamic"
    }
}
