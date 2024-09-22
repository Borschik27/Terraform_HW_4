# Terraform_HW_4

Задание 1

```
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ yc compute instance list
+----------------------+---------------------+---------------+---------+---------------+-------------+
|          ID          |        NAME         |    ZONE ID    | STATUS  |  EXTERNAL IP  | INTERNAL IP |
+----------------------+---------------------+---------------+---------+---------------+-------------+
| epdpc5jma64rqo5rbe20 | develop-analytics-0 | ru-central1-b | RUNNING | 158.160.28.51 | 10.2.2.29   |
| fhmge1v4vc5gdmd139ob | develop-marketing-0 | ru-central1-a | RUNNING | 51.250.67.18  | 10.1.1.16   |
+----------------------+---------------------+---------------+---------+---------------+-------------+

sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ yc compute instance get epdpc5jma64rqo5rbe20 --format=json | jq '.label'
null
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ yc compute instance get epdpc5jma64rqo5rbe20 --format=json | jq '.labels'
{
  "owner": "sypchik",
  "project": "analytics"
}
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ yc compute instance get fhmge1v4vc5gdmd139ob --format=json | jq '.labels'
{
  "owner": "sypchik",
  "project": "marketing"
}

 terraform console
> module.marketing
{
  "external_ip_address" = [
    "51.250.67.18",
  ]
  "fqdn" = [
    "develop-marketing-0.ru-central1.internal",
  ]
  "internal_ip_address" = [
    "10.1.1.16",
  ]
  "labels" = [
    tomap({
      "owner" = "sypchik"
      "project" = "marketing"
    }),
  ]
  "network_interface" = [
    tolist([
      {
        "dns_record" = tolist([])
        "index" = 0
        "ip_address" = "10.1.1.16"
        "ipv4" = true
        "ipv6" = false
        "ipv6_address" = ""
        "ipv6_dns_record" = tolist([])
        "mac_address" = "d0:0d:10:70:7e:4f"
        "nat" = true
        "nat_dns_record" = tolist([])
        "nat_ip_address" = "51.250.67.18"
        "nat_ip_version" = "IPV4"
        "security_group_ids" = toset([])
        "subnet_id" = "e9brl4184t50r7emjvup"
      },
    ]),
  ]
}

> module.analytics
{
  "external_ip_address" = [
    "158.160.28.51",
  ]
  "fqdn" = [
    "develop-analytics-0.ru-central1.internal",
  ]
  "internal_ip_address" = [
    "10.2.2.29",
  ]
  "labels" = [
    tomap({
      "owner" = "sypchik"
      "project" = "analytics"
    }),
  ]
  "network_interface" = [
    tolist([
      {
        "dns_record" = tolist([])
        "index" = 0
        "ip_address" = "10.2.2.29"
        "ipv4" = true
        "ipv6" = false
        "ipv6_address" = ""
        "ipv6_dns_record" = tolist([])
        "mac_address" = "d0:0d:19:61:67:65"
        "nat" = true
        "nat_dns_record" = tolist([])
        "nat_ip_address" = "158.160.28.51"
        "nat_ip_version" = "IPV4"
        "security_group_ids" = toset([])
        "subnet_id" = "e2lkfm79921nqlo6rp5s"
      },
    ]),
  ]
}
>
```


Задание 2 

```
Apply complete! Resources: 2 added, 0 changed, 1 destroyed.

Outputs:

cloudinit = <<EOT

#cloud-config
users:
  - name: ubuntu
    groups: sudo
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCW8VMQj1Ytwl2DVRv8/7Cdz8uJKkqXL7kh6knmCMLnl4mFHIz2lqhstwpRvrmlg3xzgyMqqPvuARj4b6wtj5oCSCqWUpa1Nzaw+5yPkYk+HIf4e1QIqw6FhsvIgOXMpPiC+cFZ2ztfk6MoEKGqhxeNvmieV9H4vhr+L8DjIG3AP/hdi4llQq+HYeVjJJQQKbpTvhc6uw+skDKHPerCf/H1tq8WqJnj1FsZUf35cjoByPDl/wtThSFHDNYfO+8NoJEi0IEeCcJmgWgnqlRTET2ghCs8ug6C2dKXBslYoTvFCaWdUKiMsmYVl3SLGc+btHIDnzGX4ul21Bw62exXBA0EWb2d0vtUmSi/QXDu4ghQzygagQ+8WVa95V5GhMexnCyonaj17Dvr+djMnwjDu8a0ge+f6WeeyCgDHqHtc9V6g5V18VtqHwutoc7bQM+QO2eQ3p09I0Afx4WRRB6GzEZm/Ha/K8YpRPajVAede7d2Vj0IppI5Z2oG9BK4vxJXRL8= sypchik@Mirror
package_update: true
package_upgrade: false
packages:
  - nginx
  - git

EOT
network_output = {
  "created_at" = "2024-09-22T00:23:10Z"
  "default_security_group_id" = "enps73o331r75n2rpkur"
  "description" = ""
  "folder_id" = "b1gs98og2f2h12cvb2pj"
  "id" = "enpm23n3j7mtsq1cenih"
  "labels" = tomap({})
  "name" = "dev"
  "subnet_ids" = tolist([
    "e9be1huqmkmlqp567kqj",
  ])
  "timeouts" = null /* object */
}
subnet_output = {
  "created_at" = "2024-09-22T00:23:13Z"
  "description" = ""
  "dhcp_options" = tolist([])
  "folder_id" = "b1gs98og2f2h12cvb2pj"
  "id" = "e9be1huqmkmlqp567kqj"
  "labels" = tomap({})
  "name" = "dev-ru-central1-a"
  "network_id" = "enpm23n3j7mtsq1cenih"
  "route_table_id" = ""
  "timeouts" = null /* object */
  "v4_cidr_blocks" = tolist([
    "10.0.1.0/24",
  ])
  "v6_cidr_blocks" = tolist([])
  "zone" = "ru-central1-a"
}
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform-docs markdown ./
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.129.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_analytics"></a> [analytics](#module\_analytics) | git::https://github.com/Borschik27/yandex_compute_instance.git | main |
| <a name="module_marketing"></a> [marketing](#module\_marketing) | git::https://github.com/Borschik27/yandex_compute_instance.git | main |
| <a name="module_test-vm"></a> [test-vm](#module\_test-vm) | git::https://github.com/Borschik27/yandex_compute_instance.git | main |
| <a name="module_vpc_dev"></a> [vpc\_dev](#module\_vpc\_dev) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.develop](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.develop_a](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.develop_b](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [yandex_compute_image.my_image](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | n/a | `string` | n/a | yes |
| <a name="input_default_cidr_a"></a> [default\_cidr\_a](#input\_default\_cidr\_a) | n/a | `list(string)` | n/a | yes |
| <a name="input_default_cidr_b"></a> [default\_cidr\_b](#input\_default\_cidr\_b) | n/a | `list(string)` | n/a | yes |
| <a name="input_default_zone_a"></a> [default\_zone\_a](#input\_default\_zone\_a) | n/a | `string` | n/a | yes |
| <a name="input_default_zone_b"></a> [default\_zone\_b](#input\_default\_zone\_b) | n/a | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | n/a | `string` | n/a | yes |
| <a name="input_git_src"></a> [git\_src](#input\_git\_src) | Git repo | `string` | n/a | yes |
| <a name="input_image_family"></a> [image\_family](#input\_image\_family) | ISO Img | `string` | n/a | yes |
| <a name="input_inst_name_a"></a> [inst\_name\_a](#input\_inst\_name\_a) | n/a | `string` | n/a | yes |
| <a name="input_inst_name_b"></a> [inst\_name\_b](#input\_inst\_name\_b) | n/a | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | n/a | `string` | n/a | yes |
| <a name="input_pack_list"></a> [pack\_list](#input\_pack\_list) | n/a | `list(string)` | `[]` | no |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | Platform ID | `string` | n/a | yes |
| <a name="input_ppkyc"></a> [ppkyc](#input\_ppkyc) | Path to key | `string` | n/a | yes |
| <a name="input_proj_a"></a> [proj\_a](#input\_proj\_a) | n/a | `string` | n/a | yes |
| <a name="input_proj_b"></a> [proj\_b](#input\_proj\_b) | n/a | `string` | n/a | yes |
| <a name="input_subnet_name_a"></a> [subnet\_name\_a](#input\_subnet\_name\_a) | n/a | `string` | n/a | yes |
| <a name="input_subnet_name_b"></a> [subnet\_name\_b](#input\_subnet\_name\_b) | n/a | `string` | n/a | yes |
| <a name="input_sudo_cloud_init"></a> [sudo\_cloud\_init](#input\_sudo\_cloud\_init) | n/a | `list(string)` | n/a | yes |
| <a name="input_vm_db_name"></a> [vm\_db\_name](#input\_vm\_db\_name) | example vm\_db\_ prefix | `string` | `"netology-develop-platform-db"` | no |
| <a name="input_vm_u_group"></a> [vm\_u\_group](#input\_vm\_u\_group) | n/a | `string` | n/a | yes |
| <a name="input_vm_u_shell"></a> [vm\_u\_shell](#input\_vm\_u\_shell) | n/a | `string` | n/a | yes |
| <a name="input_vm_user"></a> [vm\_user](#input\_vm\_user) | n/a | `string` | n/a | yes |
| <a name="input_vm_web_name"></a> [vm\_web\_name](#input\_vm\_web\_name) | example vm\_web\_ prefix | `string` | `"netology-develop-platform-web"` | no |
| <a name="input_vms_ssh_root_key"></a> [vms\_ssh\_root\_key](#input\_vms\_ssh\_root\_key) | n/a | `list(string)` | `[]` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudinit"></a> [cloudinit](#output\_cloudinit) | n/a |
| <a name="output_network_output"></a> [network\_output](#output\_network\_output) | n/a |
| <a name="output_subnet_output"></a> [subnet\_output](#output\_subnet\_output) | n/a |
```

Задание 3

```
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform state list
data.template_file.cloudinit
data.yandex_compute_image.my_image
yandex_vpc_network.develop
yandex_vpc_subnet.develop_a
yandex_vpc_subnet.develop_b
module.analytics.data.yandex_compute_image.my_image
module.analytics.yandex_compute_instance.vm[0]
module.marketing.data.yandex_compute_image.my_image
module.marketing.yandex_compute_instance.vm[0]
module.test-vm[0].data.yandex_compute_image.my_image
module.test-vm[0].yandex_compute_instance.vm[0]
module.test-vm[1].data.yandex_compute_image.my_image
module.test-vm[1].yandex_compute_instance.vm[0]
module.vpc_dev.yandex_vpc_network.dev
module.vpc_dev.yandex_vpc_subnet.subnet
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform state rm module.vpc_dev
Removed module.vpc_dev.yandex_vpc_network.dev
Removed module.vpc_dev.yandex_vpc_subnet.subnet
Successfully removed 2 resource instance(s).
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform state rm module.test-vm
Removed module.test-vm[0].data.yandex_compute_image.my_image
Removed module.test-vm[0].yandex_compute_instance.vm[0]
Removed module.test-vm[1].data.yandex_compute_image.my_image
Removed module.test-vm[1].yandex_compute_instance.vm[0]
Successfully removed 4 resource instance(s).
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform state show module.vpc_dev.yandex_vpc_network.network
No instance found for the given address!

This command requires that the address references one specific instance.
To view the available instances, use "terraform state list". Please modify
the address to reference a specific instance.
sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform state list
data.template_file.cloudinit
data.yandex_compute_image.my_image
yandex_vpc_network.develop
yandex_vpc_subnet.develop_a
yandex_vpc_subnet.develop_b
module.analytics.data.yandex_compute_image.my_image
module.analytics.yandex_compute_instance.vm[0]
module.marketing.data.yandex_compute_image.my_image
module.marketing.yandex_compute_instance.vm[0]

sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ yc vpc network list
+----------------------+---------+
|          ID          |  NAME   |
+----------------------+---------+
| enpb5l5umrt5kuoc9knt | develop |
| enpgrsth1ff56jc7prd2 | default |
| enpm23n3j7mtsq1cenih | dev     |
+----------------------+---------+

sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform import module.vpc_dev.yandex_vpc_network.dev enpm23n3j7mtsq1cenih
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=453a942210a8e24b46524f8b39343db42617980913f9ae61d5f82af0301e5f82]
module.vpc_dev.yandex_vpc_network.dev: Importing from ID "enpm23n3j7mtsq1cenih"...
module.marketing.data.yandex_compute_image.my_image: Reading...
data.yandex_compute_image.my_image: Reading...
module.test-vm[1].data.yandex_compute_image.my_image: Reading...
module.test-vm[0].data.yandex_compute_image.my_image: Reading...
module.analytics.data.yandex_compute_image.my_image: Reading...
module.vpc_dev.yandex_vpc_network.dev: Import prepared!
  Prepared yandex_vpc_network for import
module.vpc_dev.yandex_vpc_network.dev: Refreshing state... [id=enpm23n3j7mtsq1cenih]
module.test-vm[1].data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.marketing.data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.analytics.data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.test-vm[0].data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ yc compute instance list
+----------------------+-----------------------+---------------+---------+----------------+-------------+
|          ID          |         NAME          |    ZONE ID    | STATUS  |  EXTERNAL IP   | INTERNAL IP |
+----------------------+-----------------------+---------------+---------+----------------+-------------+
| epd0koggf60ebt67o9qk | develop-analytics-0   | ru-central1-b | RUNNING | 51.250.99.7    | 10.2.2.26   |
| fhmh340v71s8in1126ke | develop-marketing-0   | ru-central1-a | RUNNING | 84.252.130.166 | 10.1.1.15   |
| fhmkb60utnmqs53vgr1n | develop-marketing-1-0 | ru-central1-a | RUNNING | 89.169.131.8   | 10.0.1.34   |
| fhmq2tdghiadht9gqb09 | develop-marketing-2-0 | ru-central1-a | RUNNING | 89.169.133.108 | 10.0.1.21   |
+----------------------+-----------------------+---------------+---------+----------------+-------------+


sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform import module.test-vm[0].yandex_compute
_instance.vm[0] fhmkb60utnmqs53vgr1n
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=453a942210a8e24b46524f8b39343db42617980913f9ae61d5f82af0301e5f82]
module.analytics.data.yandex_compute_image.my_image: Reading...
data.yandex_compute_image.my_image: Reading...
module.test-vm[0].data.yandex_compute_image.my_image: Reading...
module.test-vm[1].data.yandex_compute_image.my_image: Reading...
module.marketing.data.yandex_compute_image.my_image: Reading...
module.test-vm[1].data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.marketing.data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.test-vm[0].data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.test-vm[0].yandex_compute_instance.vm[0]: Importing from ID "fhmkb60utnmqs53vgr1n"...
module.analytics.data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.test-vm[0].yandex_compute_instance.vm[0]: Import prepared!
  Prepared yandex_compute_instance for import
module.test-vm[0].yandex_compute_instance.vm[0]: Refreshing state... [id=fhmkb60utnmqs53vgr1n]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform import module.test-vm[1].yandex_compute
_instance.vm[0] fhmq2tdghiadht9gqb09
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=453a942210a8e24b46524f8b39343db42617980913f9ae61d5f82af0301e5f82]
data.yandex_compute_image.my_image: Reading...
module.test-vm[0].data.yandex_compute_image.my_image: Reading...
module.test-vm[1].data.yandex_compute_image.my_image: Reading...
module.marketing.data.yandex_compute_image.my_image: Reading...
module.analytics.data.yandex_compute_image.my_image: Reading...
module.test-vm[1].data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.marketing.data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.test-vm[0].data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.test-vm[1].yandex_compute_instance.vm[0]: Importing from ID "fhmq2tdghiadht9gqb09"...
module.analytics.data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.test-vm[1].yandex_compute_instance.vm[0]: Import prepared!
  Prepared yandex_compute_instance for import
module.test-vm[1].yandex_compute_instance.vm[0]: Refreshing state... [id=fhmq2tdghiadht9gqb09]
data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

sypchik@Mirror:/mnt/c/Users/Sypchik/Desktop/home work/terraform/ter-homeworks/04/src$ terraform plan
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=453a942210a8e24b46524f8b39343db42617980913f9ae61d5f82af0301e5f82]
data.yandex_compute_image.my_image: Reading...
module.analytics.data.yandex_compute_image.my_image: Reading...
module.test-vm[1].data.yandex_compute_image.my_image: Reading...
module.test-vm[0].data.yandex_compute_image.my_image: Reading...
module.marketing.data.yandex_compute_image.my_image: Reading...
module.vpc_dev.yandex_vpc_network.dev: Refreshing state... [id=enpm23n3j7mtsq1cenih]
yandex_vpc_network.develop: Refreshing state... [id=enpb5l5umrt5kuoc9knt]
module.analytics.data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.marketing.data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.test-vm[1].data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
module.test-vm[0].data.yandex_compute_image.my_image: Read complete after 1s [id=fd892vjp5gajiqr0g1b3]
yandex_vpc_subnet.develop_b: Refreshing state... [id=e2lmfvkneptmkufvg3bp]
yandex_vpc_subnet.develop_a: Refreshing state... [id=e9bjd3dmjv0ofm8501ju]
module.marketing.yandex_compute_instance.vm[0]: Refreshing state... [id=fhmh340v71s8in1126ke]
module.analytics.yandex_compute_instance.vm[0]: Refreshing state... [id=epd0koggf60ebt67o9qk]
module.test-vm[1].yandex_compute_instance.vm[0]: Refreshing state... [id=fhmq2tdghiadht9gqb09]
module.test-vm[0].yandex_compute_instance.vm[0]: Refreshing state... [id=fhmkb60utnmqs53vgr1n]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # module.test-vm[0].yandex_compute_instance.vm[0] will be updated in-place
  ~ resource "yandex_compute_instance" "vm" {
      + allow_stopping_for_update = true
        id                        = "fhmkb60utnmqs53vgr1n"
        name                      = "develop-marketing-1-0"
        # (14 unchanged attributes hidden)

      ~ network_interface {
          ~ subnet_id          = "e9be1huqmkmlqp567kqj" -> (known after apply)
            # (10 unchanged attributes hidden)
        }

        # (5 unchanged blocks hidden)
    }

  # module.test-vm[1].yandex_compute_instance.vm[0] will be updated in-place
  ~ resource "yandex_compute_instance" "vm" {
      + allow_stopping_for_update = true
        id                        = "fhmq2tdghiadht9gqb09"
        name                      = "develop-marketing-2-0"
        # (14 unchanged attributes hidden)

      ~ network_interface {
          ~ subnet_id          = "e9be1huqmkmlqp567kqj" -> (known after apply)
            # (10 unchanged attributes hidden)
        }

        # (5 unchanged blocks hidden)
    }

  # module.vpc_dev.yandex_vpc_subnet.subnet will be created
  + resource "yandex_vpc_subnet" "subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "dev-ru-central1-a"
      + network_id     = "enpm23n3j7mtsq1cenih"
      + v4_cidr_blocks = [
          + "10.0.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 1 to add, 2 to change, 0 to destroy.

Changes to Outputs:
  + subnet_output  = {
      + created_at     = (known after apply)
      + description    = null
      + dhcp_options   = []
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "dev-ru-central1-a"
      + network_id     = "enpm23n3j7mtsq1cenih"
      + route_table_id = null
      + timeouts       = null
      + v4_cidr_blocks = [
          + "10.0.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

```
