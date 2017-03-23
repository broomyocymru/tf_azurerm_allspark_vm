resource "azurerm_network_interface" "private_nic" {
    name = "${var.name}_nic0"
    location = "${var.allspark["location"]}"
    resource_group_name = "${var.allspark["resource_group_name"]}"

    ip_configuration {
        name = "${var.name}_ip"
        subnet_id = "${element(var.allspark["subnet_id"], index(var.allspark["subnet_name"],var.subnet))}"
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
        subnet_id = "${element(var.allspark["subnet_id"], index(var.allspark["subnet_name"],var.subnet))}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id = "${azurerm_public_ip.ip.id}"
    }
}
