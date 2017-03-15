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

variable "image" {
  description = "Azure VM Image type"
  default     = "Standard_D2_v2"
}

variable "role" {
  description = "Server Role"
  default     = "none"
}

variable "os" {
  description = "Operating System"
  default     = "ubuntu"
}
