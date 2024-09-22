variable "network_name" {
  description = "Имя сети"
  default = "dev"
  type        = string
}

variable "zone" {
  description = "Зона, в которой будет создана подсеть"
  default = "ru-central1-a"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "CIDR блок для подсети"
  default = "10.0.1.0/24"
  type        = string
}

variable "env_name" {
  description = "env_name"
  default = "manager"
  type        = string
}