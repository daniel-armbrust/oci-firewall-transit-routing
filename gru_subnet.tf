#
# gru_subnet.tf
#
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet
# https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/Subnet/
#

# SUBNET-H (VCN-HUB)
resource "oci_core_subnet" "gru_subn-h_vcn-hub" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-hub.id
    dhcp_options_id = oci_core_dhcp_options.gru_dhcp-options_vcn-hub.id
    route_table_id = oci_core_route_table.gru_rtb_subn-h_vcn-hub.id
    security_list_ids = [oci_core_security_list.gru_secl-1_subn-h_vcn-hub.id]

    display_name = "subn-h"
    dns_label = "subnh"
    cidr_block = "10.0.0.0/26"
    prohibit_public_ip_on_vnic = true
}

# SUBNET-1 (VCN-A)
resource "oci_core_subnet" "gru_subn-1_vcn-a" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-a.id
    dhcp_options_id = oci_core_dhcp_options.gru_dhcp-options_vcn-a.id
    route_table_id = oci_core_route_table.gru_rtb_subn-1_vcn-a.id
    security_list_ids = [oci_core_security_list.gru_secl-1_subn-1_vcn-a.id]

    display_name = "subn-1"
    dns_label = "subn1"
    cidr_block = "192.168.10.0/26"
    prohibit_public_ip_on_vnic = true
}

# SUBNET-2 (VCN-B)
resource "oci_core_subnet" "gru_subn-2_vcn-b" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-b.id
    dhcp_options_id = oci_core_dhcp_options.gru_dhcp-options_vcn-b.id
    route_table_id = oci_core_route_table.gru_rtb_subn-2_vcn-b.id
    security_list_ids = [oci_core_security_list.gru_secl-1_subn-2_vcn-b.id]

    display_name = "subn-2"
    dns_label = "subn2"
    cidr_block = "192.168.20.0/26"
    prohibit_public_ip_on_vnic = true
}

# SUBNET-3 (VCN-C)
resource "oci_core_subnet" "gru_subn-3_vcn-c" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-c.id
    dhcp_options_id = oci_core_dhcp_options.gru_dhcp-options_vcn-c.id
    route_table_id = oci_core_route_table.gru_rtb_subn-3_vcn-c.id
    security_list_ids = [oci_core_security_list.gru_secl-1_subn-3_vcn-c.id]

    display_name = "subn-3"
    dns_label = "subn3"
    cidr_block = "192.168.30.0/26"
    prohibit_public_ip_on_vnic = true
}