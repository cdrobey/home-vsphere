resource "vsphere_virtual_machine" "virtual_machine" {
  count            = "${length(var.vm_ips)}"
  name             = "${var.vm_name_prefix}${count.index}"
  resource_pool_id = "${data.vsphere_resource_pool.resource_pool.id}"

  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus         = "${var.vm_cpu}"
  memory           = "${var.vm_ram}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  enable_disk_uuid = "true"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }
  disk {
    label            = "${var.vm_name_prefix}${count.index}.vmdk"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    linked_clone  = "${var.vm_linked_clone}"

    customize {
      timeout = "20"
      linux_options {
        host_name = "${var.vm_name_prefix}${count.index}"
        domain    = "${var.vm_domain}"
      }
      network_interface {
        ipv4_address = "${lookup(var.vm_ips, count.index)}"
        ipv4_netmask = "${var.vm_netmask}"
      }
      ipv4_gateway    = "${var.vm_gateway}"
      dns_server_list = ["${var.vm_dns}"]
    }
  }
}