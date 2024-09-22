terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 1.8.4"
}

# Ресурс для создания сети
resource "yandex_vpc_network" "dev" {
  name = var.network_name
}

# Ресурс для создания подсети
resource "yandex_vpc_subnet" "subnet" {
  name           = "${var.network_name}-${var.zone}"
  zone           = var.zone
  network_id     = yandex_vpc_network.dev.id
  v4_cidr_blocks = [var.v4_cidr_blocks]
}