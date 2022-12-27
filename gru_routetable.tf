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

    # SUBNET-1 (VCN-A)
    route_rules {
        destination = "192.168.10.0/26"       
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-1 (VCN-A)"
    }

    # SUBNET-2 (VCN-B)
    route_rules {
        destination = "192.168.20.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-2 (VCN-B)"
    }

    # SUBNET-3 (VCN-C)
    route_rules {
        destination = "192.168.30.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-3 (VCN-C)"
    }      
}

# ROUTE TABLE - rtb_hub (VCN-HUB)
resource "oci_core_route_table" "rtb_hub" {   
    provider = oci.gru

    compartment_id = var.root_compartment
    vcn_id = oci_core_vcn.gru_vcn-hub.id
    display_name = "rtb_hub"

    # SUBNET-1 (VCN-A)
    route_rules {
        destination = "192.168.10.0/26"
        destination_type = "CIDR_BLOCK"   
        network_entity_id = data.oci_core_private_ips.gru_private-ip-id_vnic-1_firewall_subn-h_vcn-hub.private_ips[0]["id"]
    }

    # SUBNET-2 (VCN-B)
    route_rules {
        destination = "192.168.20.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = data.oci_core_private_ips.gru_private-ip-id_vnic-1_firewall_subn-h_vcn-hub.private_ips[0]["id"]
    }

    # SUBNET-3 (VCN-C)
    route_rules {
        destination = "192.168.30.0/26"
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

    # SUBNET-H (VCN-HUB)
    route_rules {
        destination = "10.0.0.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-H (VCN-HUB)"
    }

    # SUBNET-2 (VCN-B)
    route_rules {
        destination = "192.168.20.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-2 (VCN-B)"
    }

    # SUBNET-3 (VCN-C)
    route_rules {
        destination = "192.168.30.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-3 (VCN-C)"
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

    # SUBNET-H (VCN-HUB)
    route_rules {
        destination = "10.0.0.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-H (VCN-HUB)"
    }

    # SUBNET-1 (VCN-A)
    route_rules {
        destination = "192.168.10.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-1 (VCN-A)"
    }   

    # SUBNET-3 (VCN-C)
    route_rules {
        destination = "192.168.30.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-3 (VCN-C)"
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

    # SUBNET-H (VCN-HUB)
    route_rules {        
        destination = "10.0.0.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-H (VCN-HUB)"
    }

    # SUBNET-1 (VCN-A)
    route_rules {
        destination = "192.168.10.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-1 (VCN-A)"
    }

    # SUBNET-2 (VCN-B)
    route_rules {
        destination = "192.168.20.0/26"
        destination_type = "CIDR_BLOCK"
        network_entity_id = oci_core_drg.gru_drg.id
        description = "SUBNET-2 (VCN-B)"
    }      
}