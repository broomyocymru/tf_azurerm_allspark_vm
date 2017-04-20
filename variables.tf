variable "allspark" {
  description = "allspark network and storage details"
  type = "map"
}

variable "bastion" {
  description = "bastion data"
  type = "map"
}

variable "name" {
  description = "Hostname"
}

variable "username" {
  description = "Admin Username"
}

variable "password" {
  description = "Admin Password"
}

variable "role" {
  description = "Server Role"
  default     = "none"
}

variable "subnet" {
  description = "allspark subnet to attach too, defaults to admin"
  default = "admin"
}

variable "vm" {
  description = "VM Configuration"
  default     = "std_ubuntu_server" # bastion, std_windows_server
}

variable "disk_size" {
  description = "OS Disk size in GB"
  default     = "40"
}

variable "vpc_inbound_ports" {
  description = ""
  type = "list"
  default = []
}

variable "vpc_outbound_ports" {
  description = ""
  type = "list"
  default = []
}
