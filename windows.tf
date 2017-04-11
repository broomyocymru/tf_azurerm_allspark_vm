resource "azurerm_virtual_machine" "windows" {
    count = "${module.vm_config.windows}"
    name = "${var.name}"
    location = "${var.allspark["location"]}"
    resource_group_name = "${var.allspark["resource_group_name"]}"
    # todo - remove picking first element once terraform supports multiple nics
    network_interface_ids = ["${element(concat(azurerm_network_interface.public_nic.*.id, azurerm_network_interface.private_nic.*.id),0)}"]
    vm_size = "${module.vm_config.image}"

    storage_image_reference {
        publisher = "${module.vm_config.publisher}"
        offer = "${module.vm_config.offer}"
        sku = "${module.vm_config.sku}"
        version = "${module.vm_config.version}"
    }

    storage_os_disk {
        name = "${var.name}_os"
        vhd_uri = "${var.allspark["storage_account_endpoint"]}${module.subnet_config.storage_container}/${var.name}_os_disk.vhd"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    os_profile {
        computer_name = "${var.name}"
        admin_username = "${var.username}"
        admin_password = "${var.password}"

        custom_data = "${base64encode("Param($RemoteHostName = \"${var.name}\", $ComputerName = \"${var.name}\", $WinRmPort = 5986) ${file("${path.module}/winrm.ps1")}")}"
    }

    os_profile_windows_config {
        provision_vm_agent = true
        enable_automatic_upgrades = true

        additional_unattend_config {
            pass = "oobeSystem"
            component = "Microsoft-Windows-Shell-Setup"
            setting_name = "AutoLogon"
            content = "<AutoLogon><Password><Value>${var.password}</Value></Password><Enabled>true</Enabled><LogonCount>1</LogonCount><Username>${var.username}</Username></AutoLogon>"
        }

        additional_unattend_config {
            pass = "oobeSystem"
            component = "Microsoft-Windows-Shell-Setup"
            setting_name = "FirstLogonCommands"
            content = "${file("winrm.xml")}"
        }
    }

    tags {
        environment = "${var.allspark["resource_group_name"]}"
        role = "${var.role}"
        os = "${module.vm_config.offer}-${module.vm_config.sku}"
        ssh_user = "${var.username}"
        ssh_ip = "${element(concat(azurerm_network_interface.public_nic.*.private_ip_address, azurerm_network_interface.private_nic.*.private_ip_address),0)}"
        remote_connect = "winrm"
        remote_port = "5986"
    }
}
