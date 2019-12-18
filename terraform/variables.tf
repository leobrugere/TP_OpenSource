variable "rsg" {
  default = "admin-ci"
}
variable "vn-ubuntu" {
  default = "vn-ubuntu"
}

variable "vn-net-ubuntu" {
  default = "10.0.0.0/16"
}

variable "vn-sub-ubuntu" {
  default = "sub-ubuntu"
}

variable "vn-sub-net-ubuntu" {
  default = "10.0.0.0/24"
}
variable "count" {
  default = 1
} 
variable "location" {
  default = "westeurope"
}
variable "tag" {
  default = "Demo terraform"
}
variable "ip-pub-ubuntu" {
  default = "vm-ubuntu-ip-pub"
}
variable "vn-net-ubuntu-nsg" {
  default = "vn-net-ubuntu-nsg"
}
variable "nic-ubuntu" {
  default = "vm-u-nic"
}
variable "vm-osdisk" {
  default = "os-disk"
}
variable "user-name" {
  default = "user01"
}
variable "admin_username" {
  default="user01"
}
variable "admin_password" {
  default="theadminp@ssw0rd"
}

