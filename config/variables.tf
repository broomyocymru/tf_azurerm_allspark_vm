variable "key" {
  description = "Output path of generated ssh keys"
  default = "std_ubuntu_server"
}

variable "options" {
  description = "Predefined hardware/os combos."
  type = "map"
  default = {
    "bastion" = "Standard_D2_v2,Canonical,UbuntuServer,16.04-LTS,latest,linux"
    "min_ubuntu_server" = "Standard_DS1_v2,Canonical,UbuntuServer,16.04-LTS,latest,linux"
    "std_windows_server" = "Standard_D2_v2,MicrosoftWindowsServer,WindowsServer,2012-R2-Datacenter,latest,windows"
    "std_ubuntu_server" = "Standard_D2_v2,Canonical,UbuntuServer,16.04-LTS,latest,linux"
    "desktop_win10" = "Standard_D2_v2,MicrosoftWindowsServer,Windows-HUB,Windows-10-HUB,latest,windows"
    "desktop_ubuntu16" = "Standard_D2_v2,Canonical,UbuntuServer,16.04-LTS,latest,linux"
  }
}
