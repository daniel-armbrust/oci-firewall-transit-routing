#
# gru_firewall.tf
#

# FIREWALL
resource "oci_core_instance" "gru_firewall_subn-h_vcn-hub" {
    provider = oci.gru

    compartment_id = var.root_compartment
    availability_domain = local.ads.gru_ad1_name        
    display_name = "firewall"

    shape = "VM.Standard.E3.Flex" 

    shape_config { 
        baseline_ocpu_utilization = "BASELINE_1_1"
        memory_in_gbs = 2
        ocpus = 1
    }

    create_vnic_details {
        display_name = "vnic-1"
        hostname_label = "firewall"
        private_ip = "10.0.0.10"        
        subnet_id = oci_core_subnet.gru_subn-h_vcn-hub.id
        skip_source_dest_check = true
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
        ssh_authorized_keys = file("./sshkeys/openssh-pub.key")
        user_data = base64encode(file("./scripts/firewall-init.sh"))
    }
}

data "oci_core_vnic_attachments" "gru_firewall_vnics" {
  provider = oci.gru

  compartment_id = var.root_compartment
  instance_id = oci_core_instance.gru_firewall_subn-h_vcn-hub.id
}

data "oci_core_vnic" "gru_vnic-1_firewall_subn-h_vcn-hub" {
    provider = oci.gru

    vnic_id = data.oci_core_vnic_attachments.gru_firewall_vnics.vnic_attachments[0]["vnic_id"]
}

data "oci_core_private_ips" "gru_private-ip-id_vnic-1_firewall_subn-h_vcn-hub" {
    provider = oci.gru

    vnic_id = data.oci_core_vnic.gru_vnic-1_firewall_subn-h_vcn-hub.id
}