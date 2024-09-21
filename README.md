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
