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

  # Размещение state файла в S3 хранилище
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "dudu-tf-bucket"
    region   = "ru-central1-a"
    key      = "dev/lemp.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  service_account_key_file = file("~/authorized_key.json")
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

# Создание сети
resource "yandex_vpc_network" "main_network" {
  name = "sf-network"
}

# Создание целевой группы
resource "yandex_lb_target_group" "tg_sf" {
  name      = "tg_sf"
  region_id = "ru-central1"

  target {
    subnet_id = module.create_server1.instance_subnet_id
    address   = module.create_server1.internal_ip_address_server
  }

  target {
    subnet_id = module.create_server2.instance_subnet_id
    address   = module.create_server2.internal_ip_address_server
  }
}

# Содание балансировщика нагрузки
resource "yandex_lb_network_load_balancer" "lb_sf" {

  listener {
    name = "ln_sf1"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.tg_sf.id
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

# Создание ВМ1
module "create_server1" {
  source          = "./modules/create_instance"
  main_network_id = yandex_vpc_network.main_network.id
  name-server     = "test1"
  os_family_name  = "lemp"
  zone            = "a"
  cidr_blocks     = "10.0.1.0/28"
  ssh_key_server  = "ubuntu:${file("~/.ssh/dudu_yan.pub")}"

}

# Создание ВМ2
module "create_server2" {
  source          = "./modules/create_instance"
  main_network_id = yandex_vpc_network.main_network.id
  name-server     = "test2"
  os_family_name  = "lamp"
  zone            = "b"
  cidr_blocks     = "10.0.2.0/28"
  ssh_key_server  = "ubuntu:${file("~/.ssh/dudu_yan.pub")}"

}




