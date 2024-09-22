variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "vpc_name" {
  type        = string
}

variable "subnet_name_a" {
  type        = string
}

variable "subnet_name_b" {
  type        = string
}

variable "default_zone_a" {
  type        = string
}

variable "default_cidr_a" {
  type        = list(string)
}

variable "default_zone_b" {
  type        = string
}

variable "default_cidr_b" {
  type        = list(string)
}

variable "vms_ssh_root_key" {
  type        = list(string)
  default     = [] 
}

variable "sudo_cloud_init" {
  type        = list(string)
}

variable "pack_list" {
  type        = list(string)
  default     = []
}

variable "ppkyc" {
  type        = string
  description = "Path to key"
}

variable "platform_id" {
  type        = string
  description = "Platform ID"
}

variable "image_family" {
  type        = string
  description = "ISO Img"
}

variable "git_src" {
  type        = string
  description = "Git repo"
}

variable "env_name" {
  type        = string
}

variable "inst_name_a" {
  type        = string
}

variable "inst_name_b" {
  type        = string
}

variable "proj_a" {
  type        = string
}

variable "proj_b" {
  type        = string
}

variable "owner" {
  type        = string
}

variable "vm_user" {
  type        = string
}

variable "vm_u_group" {
  type        = string
}

variable "vm_u_shell" {
  type        = string
}

###example vm_web var
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "example vm_web_ prefix"
}

###example vm_db var
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "example vm_db_ prefix"
}