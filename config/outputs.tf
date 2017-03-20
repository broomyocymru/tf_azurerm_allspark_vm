output "image" {
  value = "${element(split(",",lookup(var.options, var.key),1))}"
}

output "publisher" {
  value = "${element(split(",",lookup(var.options, var.key),2))}"
}

output "offer" {
  value = "${element(split(",",lookup(var.options, var.key),3))}"
}

output "sku" {
  value = "${element(split(",",lookup(var.options, var.key),4))}"
}

output "version" {
  value = "${element(split(",",lookup(var.options, var.key),5))}"
}
