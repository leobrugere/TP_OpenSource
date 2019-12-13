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
variable "vm-name" {
  default = "vm-ubuntu"
}
variable "vm-osdisk" {
  default = "os-disk"
}
variable "user-name" {
  default = "user01"
}
variable "subnet" {
  type ="string"
}
variable "rsg-name" {
  type ="string"
}