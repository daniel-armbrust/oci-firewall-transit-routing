#
# gru_security.tf
#
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list
# https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/SecurityList/ 
#

# SECURITY LIST - SUBN-H (VCN-HUB)
resource "oci_core_security_list" "gru_secl-1_subn-h_vcn-hub" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-hub.id
    display_name = "secl-1_subn-h"

    egress_security_rules {
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol = "all"
        stateless = false
    }

    ingress_security_rules {
        source = "0.0.0.0/0"
        protocol = "all"
        source_type = "CIDR_BLOCK"
        stateless = false
    }
}

# SECURITY LIST - SUBN-1 (VCN-A)
resource "oci_core_security_list" "gru_secl-1_subn-1_vcn-a" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-a.id
    display_name = "secl-1_subn-1"

    egress_security_rules {
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol = "all"
        stateless = false
    }

    ingress_security_rules {
        source = "0.0.0.0/0"
        protocol = "all"
        source_type = "CIDR_BLOCK"
        stateless = false
    }
}

# SECURITY LIST - SUBN-2 (VCN-B)
resource "oci_core_security_list" "gru_secl-1_subn-2_vcn-b" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-b.id
    display_name = "secl-1_subn-2"

    egress_security_rules {
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol = "all"
        stateless = false
    }

    ingress_security_rules {
        source = "0.0.0.0/0"
        protocol = "all"
        source_type = "CIDR_BLOCK"
        stateless = false
    }
}

# SECURITY LIST - SUBN-3 (VCN-C)
resource "oci_core_security_list" "gru_secl-1_subn-3_vcn-c" {
    provider = oci.gru
    
    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-c.id
    display_name = "secl-1_subn-3"

    egress_security_rules {
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
        protocol = "all"
        stateless = false
    }

    ingress_security_rules {
        source = "0.0.0.0/0"
        protocol = "all"
        source_type = "CIDR_BLOCK"
        stateless = false
    }
}