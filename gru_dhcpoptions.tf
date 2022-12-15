#
# gru_dhcpoptions.tf
#
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_dhcp_options
# https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/DhcpOptions/
#

# DHCP OPTIONS - VCN-HUB
resource "oci_core_dhcp_options" "gru_dhcp-options_vcn-hub" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-hub.id
    display_name = "dhcp-options_vcn-hub"

    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }
}

# DHCP OPTIONS - VCN-A
resource "oci_core_dhcp_options" "gru_dhcp-options_vcn-a" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-a.id
    display_name = "dhcp-options_vcn-a"

    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }
}

# DHCP OPTIONS - VCN-B
resource "oci_core_dhcp_options" "gru_dhcp-options_vcn-b" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-b.id
    display_name = "dhcp-options_vcn-b"

    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }
}

# DHCP OPTIONS - VCN-C
resource "oci_core_dhcp_options" "gru_dhcp-options_vcn-c" {
    provider = oci.gru
    
    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-c.id
    display_name = "dhcp-options_vcn-c"

    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }
}