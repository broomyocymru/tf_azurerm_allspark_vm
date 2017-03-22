resource "azurerm_public_ip" "ip" {
  count                        = "${var.public_ip == "" ? 0 : 1}"
  name                         = "${var.name}_publicip"
  location                     = "${var.allspark["location"]}"
  resource_group_name          = "${var.allspark["resource_group_name"]}"
  public_ip_address_allocation = "dynamic"
}

resource "azurerm_network_interface" "nic" {
    name = "${var.name}_nic0"
    location = "${var.allspark["location"]}"
    resource_group_name = "${var.allspark["resource_group_name"]}"

    ip_configuration {
        name = "${var.name}_ip"
        subnet_id = "${var.allspark["subnet_id"]}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id = "${var.public_ip == "" ? "" : azurerm_public_ip.ip.id}"
    }
}
