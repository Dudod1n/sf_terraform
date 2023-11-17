variable "cloud_id" {
  type        = string
  default     = "b1ghohslr95nkotg5vom"
  description = "Default yandex cloud id in Ya.Cloud"
}

variable "folder_id" {
  type        = string
  default     = "b1gcpvio7cegc9qadr8g"
  description = "Default yandex folder id"
}

variable "ssh_key_server" {
  type    = string
  default = null
}

# Начало блока "Изменяемые переменные" -----------------------

variable "name-server" {
  type    = string
  default = "1"
}
variable "zone" {
  type        = string
  default     = "a"
  description = "Use specific availability zone"
}

variable "main_network_id" {
  type    = string
  default = null
}

variable "cidr_blocks" {
  type    = string
  default = null
}

variable "os_family_name" {
  type    = string
  default = "lemp"
}
# Конец блока "Изменяемые переменные" -----------------------
