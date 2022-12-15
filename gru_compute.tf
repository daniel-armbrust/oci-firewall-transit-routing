#
# gru_compute.tf
#
# https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance
# https://docs.oracle.com/en-us/iaas/api/#/en/iaas/20160918/Instance/
#

# SPOKE-A
resource "oci_core_instance" "gru_spoke-a_subn-1_vcn-a" {
    provider = oci.gru

    compartment_id = var.root_compartment
    availability_domain = local.ads.gru_ad1_name        
    display_name = "spoke-a"

    shape = "VM.Standard.E3.Flex" 

    shape_config { 
        baseline_ocpu_utilization = "BASELINE_1_1"
        memory_in_gbs = 2
        ocpus = 1
    }

    create_vnic_details {
        display_name = "gru_vnic-1_spoke-a_subn-1_vcn-a"
        hostname_label = "spoke-a"
        private_ip = "192.168.10.26"        
        subnet_id = oci_core_subnet.gru_subn-1_vcn-a.id
        skip_source_dest_check = false
        assign_public_ip = false
    }

    source_details {
        source_id = local.compute_image_id.gru.ol8
        source_type = "image"
        boot_volume_size_in_gbs = 100
    }    

    agent_config {
        plugins_config {
            desired_state = "ENABLED"
            name = "Bastion"
        }
    }
    
    metadata = {
        ssh_authorized_keys = file("./sshkeys/openssh-key.pub")
        user_data = base64encode(file("./scripts/ol8-init.sh"))
    }
}

# SPOKE-C
resource "oci_core_instance" "gru_spoke-c_subn-3_vcn-c" {
    provider = oci.gru

    compartment_id = var.root_compartment
    availability_domain = local.ads.gru_ad1_name        
    display_name = "spoke-c"

    shape = "VM.Standard.E3.Flex" 

    shape_config { 
        baseline_ocpu_utilization = "BASELINE_1_1"
        memory_in_gbs = 2
        ocpus = 1
    }

    create_vnic_details {
        display_name = "gru_vnic-1_spoke-c_subn-3_vcn-c"
        hostname_label = "spoke-c"
        private_ip = "192.168.30.42"        
        subnet_id = oci_core_subnet.gru_subn-3_vcn-c.id
        skip_source_dest_check = false
        assign_public_ip = false
    }

    source_details {
        source_id = local.compute_image_id.gru.ol8
        source_type = "image"
        boot_volume_size_in_gbs = 100
    }    

    agent_config {
        plugins_config {
            desired_state = "ENABLED"
            name = "Bastion"
        }
    }
    
    metadata = {
        ssh_authorized_keys = file("./sshkeys/openssh-key.pub")
        user_data = base64encode(file("./scripts/ol8-init.sh"))
    }
}