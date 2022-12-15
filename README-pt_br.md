# OCI - Firewall Transit Routing

[OCI - Access between multiple networks through a single DRG with a firewall](https://docs.oracle.com/pt-br/iaas/Content/Network/Tasks/scenario_g.htm)

- [README (English)](https://github.com/daniel-armbrust/oci-firewall-transit-routing/blob/main/README.md)

## Pré-requisitos
1. [Instalar o Terraform](https://developer.hashicorp.com/terraform/tutorials/oci-get-started/install-cli)

2. Baixe ou clone o repositório em sua máquina local:
```sh
$ git clone https://github.com/daniel-armbrust/oci-firewall-transit-routing.git
```
3. Crie o arquivo "terraform.tfvars":
```sh
$ mv terraform.tfvars-example terraform.tfvars
```

4. [Crie uma chave de API.](https://docs.oracle.com/pt-br/iaas/Content/Identity/Tasks/managingcredentials.htm#upload_key)

5. Preencha o arquivo "terraform.tfvars" com seus respectivos valores:
```sh
$ cat terraform.tfvars
#
# terraform.tfvars
#

# Identity and access parameters
api_private_key_path = "/dir1/dir2/api-priv.key"
api_fingerprint = "dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd:dd"
tenancy_id = "ocid1.tenancy.oc1..dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"
user_id = "ocid1.user.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
root_compartment = "ocid1.compartment.oc1..ccccccccccccccccccccccccccccccccccccccccccccccccc"
```

6. [Gere um par de chaves SSH para acesso as instâncias:](https://docs.oracle.com/en/learn/generate_ssh_keys/index.html)
```sh
$ ssh-keygen -t ed25519 -a 100 -f sshkeys/openssh-key -N ""
```

7. [Execute o Terraform](https://developer.hashicorp.com/terraform/tutorials/oci-get-started):
```sh
$ terraform init
$ terraform plan
$ terraform apply
```

8. Pronto!