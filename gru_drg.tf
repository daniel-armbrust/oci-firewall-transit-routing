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
    display_name = "gru_drg"   
}


# DRG Route Table - RT-Spoke
resource "oci_core_drg_route_table" "RT-Spoke" {  
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id   
    display_name = "RT-Spoke"    
}

resource "oci_core_drg_route_table_route_rule" "RT-Spoke_Rules" {
    provider = oci.gru

    drg_route_table_id = oci_core_drg_route_table.RT-Spoke.id
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
        route_table_id = oci_core_route_table.VCN-Hub-Ingress.id
    }

    drg_route_table_id = oci_core_drg_route_table.RT-Hub.id
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

    drg_route_table_id = oci_core_drg_route_table.RT-Spoke.id
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

    drg_route_table_id = oci_core_drg_route_table.RT-Spoke.id
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

    drg_route_table_id = oci_core_drg_route_table.RT-Spoke.id
}

# DRG - Import Route Distribution
resource "oci_core_drg_route_distribution" "Import-Hub" {
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id
    distribution_type = "IMPORT"
    display_name = "Import-Hub"
}

resource "oci_core_drg_route_distribution_statement" "Import-Hub_Statement-1" {
    provider = oci.gru

    drg_route_distribution_id = oci_core_drg_route_distribution.Import-Hub.id
    
    action = "ACCEPT"

    match_criteria {
        match_type = "DRG_ATTACHMENT_ID"                
        drg_attachment_id = oci_core_drg_attachment.gru_drg_attch_vcn-a.id
    }

    priority = 10
}

resource "oci_core_drg_route_distribution_statement" "Import-Hub_Statement-2" {
    provider = oci.gru

    drg_route_distribution_id = oci_core_drg_route_distribution.Import-Hub.id
    
    action = "ACCEPT"

    match_criteria {
        match_type = "DRG_ATTACHMENT_ID"                        
        drg_attachment_id = oci_core_drg_attachment.gru_drg_attch_vcn-b.id
    }

    priority = 20
}

resource "oci_core_drg_route_distribution_statement" "Import-Hub_Statement-3" {
    provider = oci.gru

    drg_route_distribution_id = oci_core_drg_route_distribution.Import-Hub.id
    
    action = "ACCEPT"

    match_criteria {
        match_type = "DRG_ATTACHMENT_ID"                        
        drg_attachment_id = oci_core_drg_attachment.gru_drg_attch_vcn-c.id
    }

    priority = 30
}

# DRG Route Table - RT-Hub
resource "oci_core_drg_route_table" "RT-Hub" {
    provider = oci.gru

    drg_id = oci_core_drg.gru_drg.id   
    display_name = "RT-Hub"    
    import_drg_route_distribution_id = oci_core_drg_route_distribution.Import-Hub.id
}