#
# gru_vcn.tf
#
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_vcn
# https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/Vcn/
#

# VCN-HUB
resource "oci_core_vcn" "gru_vcn-hub" {    
    provider = oci.gru

    compartment_id = var.root_compartment
    cidr_blocks = ["10.0.0.0/24"]
    display_name = "vcn-hub"
    dns_label = "gruvcnhub"    
}

# VCN-A
resource "oci_core_vcn" "gru_vcn-a" {    
    provider = oci.gru

    compartment_id = var.root_compartment
    cidr_blocks = ["192.168.10.0/24"]
    display_name = "vcn-a"
    dns_label = "gruvcna"    
}

# VCN-B
resource "oci_core_vcn" "gru_vcn-b" {    
    provider = oci.gru

    compartment_id = var.root_compartment
    cidr_blocks = ["192.168.20.0/24"]
    display_name = "vcn-b"
    dns_label = "gruvcnb"    
}

# VCN-C
resource "oci_core_vcn" "gru_vcn-c" {    
    provider = oci.gru

    compartment_id = var.root_compartment
    cidr_blocks = ["192.168.30.0/24"]
    display_name = "vcn-c"
    dns_label = "gruvcnc"    
}