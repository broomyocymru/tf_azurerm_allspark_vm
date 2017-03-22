variable "allspark" {
  description = "allspark network and storage details"
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

variable "vm" {
  description = "VM Configuration"
  default     = "std_ubuntu_server" # bastion, std_windows_server
}

variable "public_ip" {
  description = "Public IP"
  default     = ""
}
