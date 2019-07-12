#===============================================================================
# Puppet virtual machines parameters
#===============================================================================
resource "vsphere_virtual_machine" "puppet" {
  count            = "${var.puppet_count}"
  name             = "${format ("%s%02d", var.puppet_name_prefix, count.index+1)}"
  resource_pool_id = "${data.vsphere_resource_pool.resource_pool.id}"

  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus         = "${var.puppet_cpu}"
  memory           = "${var.puppet_ram}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  enable_disk_uuid = "true"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }
  disk {
    label            = "${format ("%s%02d", var.puppet_name_prefix, count.index+1)}.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    linked_clone  = "${var.vm_linked_clone}"

    customize {
      timeout = "20"
      linux_options {
        host_name = "${format ("%s%02d", var.puppet_name_prefix, count.index+1)}"
        domain    = "${var.vm_domain}"
      }
      network_interface {
        ipv4_address = "${var.puppet_ipv4}"
        ipv4_netmask = "${var.vm_netmask}"
      }
      ipv4_gateway    = "${var.vm_gateway}"
      dns_server_list = ["${var.vm_dns}"]
    }
  }
}

#===============================================================================
# Docker virtual machines build
#===============================================================================
resource "vsphere_virtual_machine" "docker" {
  count            = "${var.docker_count}"
  name             = "${format ("%s%02d", var.docker_name_prefix, count.index+1)}"
  resource_pool_id = "${data.vsphere_resource_pool.resource_pool.id}"

  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus         = "${var.docker_cpu}"
  memory           = "${var.docker_ram}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  enable_disk_uuid = "true"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }
  disk {
    label            = "${format ("%s%02d", var.docker_name_prefix, count.index+1)}.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    linked_clone  = "${var.vm_linked_clone}"

    customize {
      timeout = "20"
      linux_options {
        host_name = "${format ("%s%02d", var.docker_name_prefix, count.index+1)}"
        domain    = "${var.vm_domain}"
      }
      network_interface {
        ipv4_address = "${var.docker_ipv4}"
        ipv4_netmask = "${var.vm_netmask}"
      }
      ipv4_gateway    = "${var.vm_gateway}"
      dns_server_list = ["${var.vm_dns}"]
    }
  }
}



#===============================================================================
# NGINXX virtual machines build
#===============================================================================
resource "vsphere_virtual_machine" "nginx" {
  count            = "${var.nginx_count}"
  name             = "${format ("%s%02d", var.nginx_name_prefix, count.index+1)}"
  resource_pool_id = "${data.vsphere_resource_pool.resource_pool.id}"

  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus         = "${var.nginx_cpu}"
  memory           = "${var.nginx_ram}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  enable_disk_uuid = "true"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }
  disk {
    label            = "${format ("%s%02d", var.nginx_name_prefix, count.index+1)}.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    linked_clone  = "${var.vm_linked_clone}"

    customize {
      timeout = "20"
      linux_options {
        host_name = "${format ("%s%02d", var.nginx_name_prefix, count.index+1)}"
        domain    = "${var.vm_domain}"
      }
      network_interface {        
        ipv4_address = "${var.nginx_ipv4}"
        ipv4_netmask = "${var.vm_netmask}"
      }
      ipv4_gateway    = "${var.vm_gateway}"
      dns_server_list = ["${var.vm_dns}"]
    }
  }
}



#===============================================================================
# TIG virtual machines build
#===============================================================================
resource "vsphere_virtual_machine" "tig" {
  count            = "${var.tig_count}"
  name             = "${format ("%s%02d", var.tig_name_prefix, count.index+1)}"
  resource_pool_id = "${data.vsphere_resource_pool.resource_pool.id}"

  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus         = "${var.tig_cpu}"
  memory           = "${var.tig_ram}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  enable_disk_uuid = "true"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }
  disk {
    label            = "${format ("%s%02d", var.tig_name_prefix, count.index+1)}.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    linked_clone  = "${var.vm_linked_clone}"

    customize {
      timeout = "20"
      linux_options {
        host_name = "${format ("%s%02d", var.tig_name_prefix, count.index+1)}"
        domain    = "${var.vm_domain}"
      }
      network_interface {
        ipv4_address = "${var.tig_ipv4}"
        ipv4_netmask = "${var.vm_netmask}"
      }
      ipv4_gateway    = "${var.vm_gateway}"
      dns_server_list = ["${var.vm_dns}"]
    }
  }
}