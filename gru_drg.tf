#
# gru_drg.tf
#
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_drg
# https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/Drg/
#

# DRG
resource "oci_core_drg" "gru_drg" { 
    provider = oci.gru

    compartment_id = var.root_compartment
    display_name = "drg"   
}

# DRG Route Table - rtb-drg_spoke
resource "oci_core_drg_route_table" "rtb-drg_spoke" {  
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id   
    display_name = "rtb-drg_spoke"    
}

resource "oci_core_drg_route_table_route_rule" "rtb-drg_spoke_rules" {
    provider = oci.gru

    drg_route_table_id = oci_core_drg_route_table.rtb-drg_spoke.id
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    next_hop_drg_attachment_id = oci_core_drg_attachment.gru_drg_attch_vcn-hub.id
}

# DRG ATTACHMENT - VCN-HUB
resource "oci_core_drg_attachment" "gru_drg_attch_vcn-hub" {
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id
    display_name = "drg_attch_vcn-hub"

    network_details {
        id = oci_core_vcn.gru_vcn-hub.id
        type = "VCN"        
        route_table_id = oci_core_route_table.rtb_hub.id
    }

    drg_route_table_id = oci_core_drg_route_table.gru_rtb-drg_hub.id
}

# DRG ATTACHMENT - VCN-A
resource "oci_core_drg_attachment" "gru_drg_attch_vcn-a" {
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id
    display_name = "drg_attch_vcn-a"

    network_details {
        id = oci_core_vcn.gru_vcn-a.id
        type = "VCN"      
    }

    drg_route_table_id = oci_core_drg_route_table.rtb-drg_spoke.id
}

# DRG ATTACHMENT - VCN-B
resource "oci_core_drg_attachment" "gru_drg_attch_vcn-b" {
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id
    display_name = "drg_attch_vcn-b"

    network_details {
        id = oci_core_vcn.gru_vcn-b.id
        type = "VCN"        
    }

    drg_route_table_id = oci_core_drg_route_table.rtb-drg_spoke.id
}

# DRG ATTACHMENT - VCN-C
resource "oci_core_drg_attachment" "gru_drg_attch_vcn-c" {
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id
    display_name = "drg_attch_vcn-c"

    network_details {
        id = oci_core_vcn.gru_vcn-c.id
        type = "VCN"    
    }

    drg_route_table_id = oci_core_drg_route_table.rtb-drg_spoke.id
}

# DRG - Import Route Distribution
resource "oci_core_drg_route_distribution" "gru_imp-rtb-dst_hub" {
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id
    distribution_type = "IMPORT"
    display_name = "imp-rtb-dst_hub"
}

resource "oci_core_drg_route_distribution_statement" "gru_stm-1_imp-rtb-dst_hub" {
    provider = oci.gru

    drg_route_distribution_id = oci_core_drg_route_distribution.gru_imp-rtb-dst_hub.id
    
    action = "ACCEPT"

    match_criteria {
        match_type = "DRG_ATTACHMENT_ID"                
        drg_attachment_id = oci_core_drg_attachment.gru_drg_attch_vcn-a.id
    }

    priority = 10
}

resource "oci_core_drg_route_distribution_statement" "gru_stm-2_imp-rtb-dst_hub" {
    provider = oci.gru

    drg_route_distribution_id = oci_core_drg_route_distribution.gru_imp-rtb-dst_hub.id
    
    action = "ACCEPT"

    match_criteria {
        match_type = "DRG_ATTACHMENT_ID"                        
        drg_attachment_id = oci_core_drg_attachment.gru_drg_attch_vcn-b.id
    }

    priority = 20
}

resource "oci_core_drg_route_distribution_statement" "gru_stm-3_imp-rtb-dst_hub" {
    provider = oci.gru

    drg_route_distribution_id = oci_core_drg_route_distribution.gru_imp-rtb-dst_hub.id
    
    action = "ACCEPT"

    match_criteria {
        match_type = "DRG_ATTACHMENT_ID"                        
        drg_attachment_id = oci_core_drg_attachment.gru_drg_attch_vcn-c.id
    }

    priority = 30
}

# DRG Route Table - gru_rtb-drg_hub
resource "oci_core_drg_route_table" "gru_rtb-drg_hub" {
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id   
    display_name = "rtb-drg_hub"    
    import_drg_route_distribution_id = oci_core_drg_route_distribution.gru_imp-rtb-dst_hub.id
}