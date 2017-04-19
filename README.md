tf_azurerm_allspark_vm
=======================

Terraform module to configure a VM within an allspark setup.
This module depends on tf_azurerm_allspark being used.

## Input variables
  * allspark [required] - n.b. this is a map of data generated from tf_azurerm_allspark_vpc
  * name [required]
  * username [required]
  * password [required]
  * vm [optional - Standard_D2_v2]


## Outputs
  * private_ip
  * bastion_ip
  * username
  * password
  * allspark_data { bastion_ip, username, private_ip}


## Example use

module "vm_archiva" {
  source    = "github.com/broomyocymru/tf_azurerm_allspark_vm"
  name      = "archiva"
  image     = "Standard_D2_v2"
  role      = "archiva_v2"
  os        = "ubuntu"
  allspark  = "${module.allspark.admin_data}"
  username  = "admin"
  password  = "test123!"
}

## License

MIT - see the included LICENSE file for more details.
