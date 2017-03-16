resource "azurerm_network_interface" "nic" {
    name = "${var.name}_nic0"
    location = "${var.allspark["location"]}"
    resource_group_name = "${var.allspark["resource_group_name"]}"

    ip_configuration {
        name = "${var.name}_ip"
        subnet_id = "${var.allspark["subnet_id"]}"
        private_ip_address_allocation = "dynamic"
    }
}

resource "azurerm_virtual_machine" "test" {
    name = "${var.name}"
    location = "${var.allspark["location"]}"
    resource_group_name = "${var.allspark["resource_group_name"]}"
    network_interface_ids = ["${azurerm_network_interface.nic.id}"]
    vm_size = "${var.image}"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "16.04-LTS"
        version = "latest"
    }

    storage_os_disk {
        name = "${var.name}_os"
        vhd_uri = "${var.allspark["storage_account_endpoint"]}${var.allspark["storage_container_name"]}/${var.name}_os_disk.vhd"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    os_profile {
        computer_name = "${var.name}"
        admin_username = "${var.username}"
        admin_password = "${var.password}"
    }

    os_profile_linux_config {
        disable_password_authentication = false

        ssh_keys {
          path = "/home/${var.username}/.ssh/authorized_keys"
          key_data = "${var.allspark["ssh_public"]}"
        }
    }

    tags {
        environment = "${var.allspark["resource_group_name"]}"
        role = "${var.role}"
        os = "${var.os}"
        ssh_user = "${var.username}"
        ssh_ip = "${azurerm_network_interface.nic.private_ip_address}"
    }
}
