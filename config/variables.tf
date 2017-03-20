variable "key" {
  description = "Output path of generated ssh keys"
  default = "std_ubuntu_server"
}

variable "options" {
  description = "Predefined hardware/os combos."
  type = "map"
  default = {
    "std_windows_server" = "Standard_D2_v2, MicrosoftWindowsServer, WindowsServer, 2012-R2-Datacenter, latest"
    "std_ubuntu_server" = "Standard_D2_v2, Canonical, UbuntuServer, 16.04-LTS, latest"
  }
}
