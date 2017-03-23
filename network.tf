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

# Public IP is optional but will use a different nic if set.

resource "azurerm_public_ip" "ip" {
  count                        = "${var.public_ip == "" ? 0 : 1}"
  name                         = "${var.name}_publicip"
  location                     = "${var.allspark["location"]}"
  resource_group_name          = "${var.allspark["resource_group_name"]}"
  public_ip_address_allocation = "dynamic"
}

resource "azurerm_network_interface" "public_nic" {
    count = "${var.public_ip == "" ? 0 : 1}"
    name = "${var.name}_nic1"
    location = "${var.allspark["location"]}"
    resource_group_name = "${var.allspark["resource_group_name"]}"

    ip_configuration {
        name = "${var.name}_ip"
        subnet_id = "${module.subnet_config.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id = "${azurerm_public_ip.ip.id}"
    }
}

resource "azurerm_network_security_rule" "inbound" {
  name                        = "default_inbound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.allspark["resource_group_name"]}"
  network_security_group_name = "${module.subnet_config.nsg_id}"
}

resource "azurerm_network_security_rule" "outbound" {
  name                        = "default_outbound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.allspark["resource_group_name"]}"
  network_security_group_name = "${module.subnet_config.nsg_id}"
}
