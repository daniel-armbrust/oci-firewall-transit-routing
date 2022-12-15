#
# gru_gateways.tf
#
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_service_gateway
# 
#

# SERVICE GATEWAY - VCN-HUB
resource "oci_core_service_gateway" "gru_sgw_vcn-hub" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-hub.id
    display_name = "sgw_vcn-hub"

    services {     
        service_id = local.gru_all_oci_services
    }
}

# SERVICE GATEWAY - VCN-A
resource "oci_core_service_gateway" "gru_sgw_vcn-a" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-a.id
    display_name = "sgw_vcn-a"

    services {     
        service_id = local.gru_all_oci_services
    }
}

# SERVICE GATEWAY - VCN-B
resource "oci_core_service_gateway" "gru_sgw_vcn-b" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-b.id
    display_name = "sgw_vcn-b"

    services {     
        service_id = local.gru_all_oci_services
    }
}

# SERVICE GATEWAY - VCN-C
resource "oci_core_service_gateway" "gru_sgw_vcn-c" {
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-c.id
    display_name = "sgw_vcn-c"

    services {     
        service_id = local.gru_all_oci_services
    }
}

# NAT GATEWAY - VCN-HUB
resource "oci_core_nat_gateway" "gru_ngw_vcn-hub" {    
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-hub.id
    display_name = "ngw_vcn-hub"
    block_traffic = false
}

# NAT GATEWAY - VCN-A
resource "oci_core_nat_gateway" "gru_ngw_vcn-a" {    
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-a.id
    display_name = "ngw_vcn-a"
    block_traffic = false
}