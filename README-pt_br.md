# OCI - Firewall Transit Routing

[OCI - Access between multiple networks through a single DRG with a firewall](https://docs.oracle.com/pt-br/iaas/Content/Network/Tasks/scenario_g.htm)

- [README (English)](https://github.com/daniel-armbrust/oci-firewall-transit-routing/blob/main/README.md)

## Pré-requisitos
1. [Instalar o Terraform](https://developer.hashicorp.com/terraform/tutorials/oci-get-started/install-cli)
2. Baixe ou clone o repositório em sua máquina local:
```sh
$ git clone https://github.com/daniel-armbrust/oci-firewall-transit-routing.git
```
3. Configure o arquivo "terraform.tfvars":
```sh
$ mv terraform.tfvars-example terraform.tfvars
```
4. [Crie uma chave de API.](https://docs.oracle.com/pt-br/iaas/Content/Identity/Tasks/managingcredentials.htm#upload_key)
5. Preencha o arquivo "terraform.tfvars" com seus respectivos valores.
6. Execute o Terraform:
```sh
$ terraform init
$ terraform plan
$ terraform apply
```
7. Pronto!