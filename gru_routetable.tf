#
# gru_routetable.tf
# 
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_route_table
# https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/RouteTable/
#

# ROUTE TABLE - SUBN-H (VCN-HUB)
resource "oci_core_route_table" "gru_rtb_subn-h_vcn-hub" {   
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-hub.id
    display_name = "rtb_subn-h"

    # Service Gateway
    route_rules {
        destination = "all-gru-services-in-oracle-services-network"
        destination_type = "SERVICE_CIDR_BLOCK"        
        network_entity_id = oci_core_service_gateway.gru_sgw_vcn-hub.id        
    }

    # VCN-A
    route_rules {
        destination = oci_core_vcn.gru_vcn-a.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }

    # VCN-B
    route_rules {
        destination = oci_core_vcn.gru_vcn-b.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }

    # VCN-C
    route_rules {
        destination = oci_core_vcn.gru_vcn-c.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }   
}

# ROUTE TABLE - VCN-Hub-Ingress (VCN-HUB)
resource "oci_core_route_table" "VCN-Hub-Ingress" {   
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-hub.id
    display_name = "VCN-Hub-Ingress"

    # VCN-A
    route_rules {
        destination = oci_core_vcn.gru_vcn-a.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"   
        network_entity_id = data.oci_core_private_ips.gru_private-ip-id_vnic-1_firewall_subn-h_vcn-hub.private_ips[0]["id"]
    }

    # VCN-B
    route_rules {
        destination = oci_core_vcn.gru_vcn-b.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = data.oci_core_private_ips.gru_private-ip-id_vnic-1_firewall_subn-h_vcn-hub.private_ips[0]["id"]
    }

    # VCN-C
    route_rules {
        destination = oci_core_vcn.gru_vcn-c.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = data.oci_core_private_ips.gru_private-ip-id_vnic-1_firewall_subn-h_vcn-hub.private_ips[0]["id"]
    }   
}

# ROUTE TABLE - SUBN-1 (VCN-A)
resource "oci_core_route_table" "gru_rtb_subn-1_vcn-a" {   
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-a.id
    display_name = "rtb_subn-1"

    # Service Gateway
    route_rules {
        destination = "all-gru-services-in-oracle-services-network"
        destination_type = "SERVICE_CIDR_BLOCK"        
        network_entity_id = oci_core_service_gateway.gru_sgw_vcn-a.id        
    }    

    # VCN-HUB
    route_rules {
        destination = oci_core_vcn.gru_vcn-hub.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }

    # VCN-B
    route_rules {
        destination = oci_core_vcn.gru_vcn-b.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }

    # VCN-C
    route_rules {
        destination = oci_core_vcn.gru_vcn-c.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }    
}

# ROUTE TABLE - SUBN-2 (VCN-B)
resource "oci_core_route_table" "gru_rtb_subn-2_vcn-b" {   
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-b.id
    display_name = "rtb_subn-2"

    # Service Gateway
    route_rules {
        destination = "all-gru-services-in-oracle-services-network"
        destination_type = "SERVICE_CIDR_BLOCK"        
        network_entity_id = oci_core_service_gateway.gru_sgw_vcn-b.id        
    }

    # VCN-HUB
    route_rules {
        destination = oci_core_vcn.gru_vcn-hub.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }

    # VCN-A
    route_rules {
        destination = oci_core_vcn.gru_vcn-a.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }   

    # VCN-C
    route_rules {
        destination = oci_core_vcn.gru_vcn-c.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }   
}

# ROUTE TABLE - SUBN-3 (VCN-C)
resource "oci_core_route_table" "gru_rtb_subn-3_vcn-c" {   
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-c.id
    display_name = "rtb_subn-3"

    # Service Gateway
    route_rules {
        destination = "all-gru-services-in-oracle-services-network"
        destination_type = "SERVICE_CIDR_BLOCK"        
        network_entity_id = oci_core_service_gateway.gru_sgw_vcn-c.id        
    }

    # VCN-HUB
    route_rules {
        destination = oci_core_vcn.gru_vcn-hub.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }

    # VCN-A
    route_rules {
        destination = oci_core_vcn.gru_vcn-a.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }

    # VCN-B
    route_rules {
        destination = oci_core_vcn.gru_vcn-b.cidr_blocks[0]
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
    }   
}