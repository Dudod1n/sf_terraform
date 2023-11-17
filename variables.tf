variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Use specific availability zone"
}

variable "cloud_id" {
  type        = string
  description = "Default yandex cloud id in Ya.Cloud"
}

variable "folder_id" {
  type        = string
  description = "Default yandex folder id"
}
