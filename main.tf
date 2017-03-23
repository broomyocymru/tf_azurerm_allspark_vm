module "vm_config" {
  source  = "config"
  key     = "${var.vm}"
}

module "subnet_config" {
  source  = "subnet"
  key     = "${var.subnet}"
  data    = "${var.allspark}"
}
