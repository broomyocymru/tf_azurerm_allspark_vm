output "name" {
  value = "${element(split(",", var.allspark["subnet_name"]), index(split(",", var.allspark["subnet_index"]),var.key))}"
}

output "id" {
  value = "${element(split(",", var.allspark["subnet_id"]), index(split(",", var.allspark["subnet_index"]),var.key))}"
}

output "index" {
  value = "${index(split(",", var.allspark["subnet_index"]),var.key)}"
}

output "nsg_id" {
  value = "${element(split(",", var.allspark["nsg_id"]), index(split(",", var.allspark["subnet_index"]),var.key))}"
}

output "nsg_name" {
  value = "${element(split(",", var.allspark["nsg_name"]), index(split(",", var.allspark["subnet_index"]),var.key))}"
}
