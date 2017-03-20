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
  description = "VM Configuration. Key is used to lookup values in vm_options variable"
  default     = "std_ubuntu_server"
}

variable "std_ubuntu_server" {
  description = "Predefined hardware/os combos. Only override if creating a custom setup"
  type = "map"
  default = {
    "image" = "Standard_D2_v2",
    "publisher" = "MicrosoftWindowsServer",
    "offer" = "WindowsServer",
    "sku" = "2012-R2-Datacenter",
    "version" = "latest"
  }
}

variable "std_windows_server" {
  description = "Predefined hardware/os combos. Only override if creating a custom setup"
  type = "map"
  default = {
    "image" = "Standard_D2_v2",
    "publisher" = "Canonical",
    "offer" = "UbuntuServer",
    "sku" = "16.04-LTS",
    "version" = "latest"
  }
}
