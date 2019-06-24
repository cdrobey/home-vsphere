data "vsphere_datacenter" "datacenter" {
  name = "${var.vsphere_datacenter}"
}
data "vsphere_compute_cluster" "cluster" {
  name          = "${var.vsphere_cluster}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}
data "vsphere_host" "host" {
  name          = "${var.vsphere_host}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}
data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}
data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}
data "vsphere_virtual_machine" "template" {
  name          = "${var.vm_template}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}
data "vsphere_resource_pool" "resource_pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

