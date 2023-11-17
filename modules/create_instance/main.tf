terraform {

  # Используемая версия Teraform в проекте 
  required_version = "= 1.5.5"

  # Используемая провайдера YandexCloud в проекте 
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "= 0.100.0"
    }
  }
}

# Получение образа от провайдера
data "yandex_compute_image" "my_image" {
  family = var.os_family_name
}

# Создание ВМ1 на основе образа 
resource "yandex_compute_instance" "server" {
  name     = "${var.os_family_name}-server-${var.name-server}"
  zone     = "ru-central1-${var.zone}"
  hostname = "${var.os_family_name}-server-${var.name-server}"

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = var.ssh_key_server
  }

}

resource "yandex_vpc_subnet" "subnet" {
  network_id     = var.main_network_id
  zone           = "ru-central1-${var.zone}"
  v4_cidr_blocks = [var.cidr_blocks]
}
