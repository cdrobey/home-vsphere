module "test_virtual_machines" {
  source               = "./modules/vm"
  datacenter           = "${var.vsphere_datacenter}"
  datastore            = "${var.vsphere_datastore}"
  network              = "${var.vsphere_network}"
  resource_pool        = "${var.vsphere_resource_pool}"

  dns_servers          = "${var.vm_dns}"
  domain_name          = "${var.vm_domain}"
  ipv4_gateway         = "${var.vm_gateway}"
  linked_clone         = "${var.vm_linked_clone}"

  template_name        = "${var.test_template}"
  template_os_family   = "${var.test_template_os_family}"
  vm_count             = "${var.test_count}"
  vm_name_prefix       = "${var.test_name_prefix}"
  num_cpus             = "${var.test_num_cpus}"
  memory               = "${var.test_memory}"
  ipv4_network_address = "${var.test_ipv4_network_address}"
  ipv4_address_start   = "${var.test_ipv4_address_start}"



}
