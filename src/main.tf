resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_a" {
  name           = var.subnet_name_a
  zone           = var.default_zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_a
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.subnet_name_b
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_b
}

data "yandex_compute_image" "my_image" {
  family = var.image_family
}

module "vpc_dev" {
  source       = "./vpc"
}

module "test-vm" {
  source         = "git::https://github.com/Borschik27/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name
  network_id     = module.vpc_dev.network_info.id
  subnet_zones   = [module.vpc_dev.subnet_info.zone]
  subnet_ids     = [module.vpc_dev.subnet_info.id]
  instance_name  = "${var.inst_name_a}-${count.index + 1}"
  count = 2
  image_family   = var.image_family
  public_ip      = true

  labels = { 
    owner   = var.owner,
    project = var.proj_a
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

# модуль для ВМ проекта "marketing"
module "marketing" {
  source         = "git::https://github.com/Borschik27/yandex_compute_instance.git?ref=main" #"${var.git_src}"
  env_name       = var.env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.default_zone_a]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = var.inst_name_a
  instance_count = 1
  image_family   = var.image_family
  public_ip      = true

  labels = {
    owner   = var.owner,
    project = var.proj_a
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

# модуль для ВМ проекта "analytics"
module "analytics" {
  source         = "git::https://github.com/Borschik27/yandex_compute_instance.git?ref=main" #"${var.git_src}"
  env_name       = var.env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.default_zone_b]
  subnet_ids     = [yandex_vpc_subnet.develop_b.id]
  instance_name  = var.inst_name_b
  instance_count = 1
  image_family   = var.image_family
  public_ip      = true

  labels = {
    owner   = var.owner,
    project = var.proj_b
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    ssh_key = var.vms_ssh_root_key[0],
    uname   = var.vm_user,
    ugroup  = var.vm_u_group,
    shell   = var.vm_u_shell,
    s_com   = join(", ", var.sudo_cloud_init),
    pack    = join("\n  - ", var.pack_list)
  }
}
