*Репозиторий создан для выполнени практической работы от SF*

Даный проект Terraform создает инфраструктуру состоящую из данных ресурсов:
1. Сеть
2. Виртуальные машины LEMP и LAMP со своими подсетями в сети пункта 1, используя модуль **create_instance**
3. Создание баланисровщика нагрузки, в него входят:
    1. Целевая группа с ВМ из пункта 2.
    2. Обработчик запросов с публичным IP адресом
    3. Проверки доступности целевых групп по порту 80

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.5.5 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | = 0.100.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.100.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_create_server1"></a> [create\_server1](#module\_create\_server1) | ./modules/create_instance | n/a |
| <a name="module_create_server2"></a> [create\_server2](#module\_create\_server2) | ./modules/create_instance | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_lb_network_load_balancer.lb_sf](https://registry.terraform.io/providers/yandex-cloud/yandex/0.100.0/docs/resources/lb_network_load_balancer) | resource |
| [yandex_lb_target_group.tg_sf](https://registry.terraform.io/providers/yandex-cloud/yandex/0.100.0/docs/resources/lb_target_group) | resource |
| [yandex_vpc_network.main_network](https://registry.terraform.io/providers/yandex-cloud/yandex/0.100.0/docs/resources/vpc_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | Default yandex cloud id in Ya.Cloud | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Default yandex folder id | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Use specific availability zone | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_server1"></a> [external\_ip\_address\_server1](#output\_external\_ip\_address\_server1) | An assigned external IP address if the instance server-lemp |
| <a name="output_external_ip_address_server2"></a> [external\_ip\_address\_server2](#output\_external\_ip\_address\_server2) | An assigned external IP address if the instance server-lemp |
| <a name="output_internal_ip_address_server1"></a> [internal\_ip\_address\_server1](#output\_internal\_ip\_address\_server1) | An internal IP address of the instance server-lemp |
| <a name="output_internal_ip_address_server2"></a> [internal\_ip\_address\_server2](#output\_internal\_ip\_address\_server2) | An internal IP address of the instance server-lemp |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->   