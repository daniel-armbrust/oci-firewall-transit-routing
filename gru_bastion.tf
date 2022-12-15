#
# gru_bastion.tf
#
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/bastion_bastion
# https://docs.oracle.com/en-us/iaas/api/#/en/bastion/20210331/Bastion/
#

# BASTION - SUBN-H (VCN-HUB)
resource "oci_bastion_bastion" "gru_bastion_subn-h_vcn-hub" {
    provider = oci.gru

    compartment_id = var.root_compartment
    name = "BastionSubnhVcnHub"
    bastion_type = "standard"
    client_cidr_block_allow_list = [local.my_public_ip]
    target_subnet_id = oci_core_subnet.gru_subn-h_vcn-hub.id

    lifecycle {
        prevent_destroy = true
    }
}