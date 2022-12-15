# OCI - Transit Routing with Firewall

[OCI - Access between multiple networks through a single DRG with a firewall](https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/scenario_g.htm)

- [README (Brazilian Portuguese)](https://github.com/daniel-armbrust/oci-firewall-transit-routing/blob/main/README-pt_br.md)

### Prerequisites
1. [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/oci-get-started/install-cli)

2. Download or clone the repository on your local machine:
```sh
$ git clone https://github.com/daniel-armbrust/oci-firewall-transit-routing.git
```

3. Create the file "terraform.tfvars":
```sh
$ mv terraform.tfvars-example terraform.tfvars
```

4. [Crie uma chave de API.](https://docs.oracle.com/pt-br/iaas/Content/Identity/Tasks/managingcredentials.htm#upload_key)

5. Fill in the "terraform.tfvars" file with their respective values:
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

6. [Generate an SSH key pair to access the instances:](https://docs.oracle.com/en/learn/generate_ssh_keys/index.html)
```sh
$ ssh-keygen -t ed25519 -a 100 -f sshkeys/openssh-key -N ""
```

7. [Run terraform](https://developer.hashicorp.com/terraform/tutorials/oci-get-started):
```sh
$ terraform init
$ terraform plan
$ terraform apply
```

8. Done!

## Contact
Daniel Armbrust - darmbrust@gmail.com