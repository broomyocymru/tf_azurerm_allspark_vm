resource "azurerm_network_interface" "private_nic" {
    name = "${var.name}_nic0"
    location = "${var.allspark["location"]}"
    resource_group_name = "${var.allspark["resource_group_name"]}"

    ip_configuration {
        name = "${var.name}_ip"
        subnet_id = "${module.subnet_config.id}"
        private_ip_address_allocation = "dynamic"
    }

    tags {
      project = "${var.allspark["tag_proj"]}"
      environment =  "${var.allspark["tag_env"]}"
    }
}

resource "azurerm_network_security_rule" "inbound_rules" {
    count                       = "${length(var.vpc_inbound_ports)}"
    name                        = "inbound_${element(var.vpc_inbound_ports, count.index)}"
    priority                    = "${200 + count.index}"
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "${element(var.vpc_inbound_ports, count.index)}"
    source_address_prefix       = "VirtualNetwork"
    destination_address_prefix  = "*"
    resource_group_name         = "${var.allspark["resource_group_name"]}"
    network_security_group_name = "${module.subnet_config.nsg_name}"
}

resource "azurerm_network_security_rule" "outbound_rules" {
    count                       = "${length(var.vpc_outbound_ports)}"
    name                        = "inbound_${element(var.vpc_outbound_ports, count.index)}"
    priority                    = "${200 + count.index}"
    direction                   = "Outbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "${element(var.vpc_outbound_ports, count.index)}"
    source_address_prefix       = "VirtualNetwork"
    destination_address_prefix  = "*"
    resource_group_name         = "${var.allspark["resource_group_name"]}"
    network_security_group_name = "${module.subnet_config.nsg_name}"
}
