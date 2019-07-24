module "puppet_virtual_machines" {
  source               = "./modules/vm"
  datacenter           = "${var.vsphere_datacenter}"
  datastore            = "${var.vsphere_datastore}"
  network              = "${var.vsphere_network}"
  resource_pool        = "${var.vsphere_resource_pool}"

  dns_servers          = "${var.vm_dns}"
  domain_name          = "${var.vm_domain}"
  ipv4_gateway         = "${var.vm_gateway}"
  linked_clone         = "${var.vm_linked_clone}"
  admin_user           = "${var.vm_admin_user}"
  admin_password       = "${var.vm_admin_password}"

  template_name        = "${var.puppet_template}"
  template_os_family   = "${var.puppet_template_os_family}"
  vm_count             = "${var.puppet_count}"
  vm_name_prefix       = "${var.puppet_name_prefix}"
  num_cpus             = "${var.puppet_num_cpus}"
  memory               = "${var.puppet_memory}"
  ipv4_network_address = "${var.puppet_ipv4_network_address}"
  ipv4_address_start   = "${var.puppet_ipv4_address_start}"
}
module "docker_virtual_machines" {
  source               = "./modules/vm"
  datacenter           = "${var.vsphere_datacenter}"
  datastore            = "${var.vsphere_datastore}"
  network              = "${var.vsphere_network}"
  resource_pool        = "${var.vsphere_resource_pool}"

  dns_servers          = "${var.vm_dns}"
  domain_name          = "${var.vm_domain}"
  ipv4_gateway         = "${var.vm_gateway}"
  linked_clone         = "${var.vm_linked_clone}"
  admin_user           = "${var.vm_admin_user}"
  admin_password       = "${var.vm_admin_password}"

  template_name        = "${var.docker_template}"
  template_os_family   = "${var.docker_template_os_family}"
  vm_count             = "${var.docker_count}"
  vm_name_prefix       = "${var.docker_name_prefix}"
  num_cpus             = "${var.docker_num_cpus}"
  memory               = "${var.docker_memory}"
  ipv4_network_address = "${var.docker_ipv4_network_address}"
  ipv4_address_start   = "${var.docker_ipv4_address_start}"
}

module "nginx_virtual_machines" {
  source               = "./modules/vm"
  datacenter           = "${var.vsphere_datacenter}"
  datastore            = "${var.vsphere_datastore}"
  network              = "${var.vsphere_network}"
  resource_pool        = "${var.vsphere_resource_pool}"

  dns_servers          = "${var.vm_dns}"
  domain_name          = "${var.vm_domain}"
  ipv4_gateway         = "${var.vm_gateway}"
  linked_clone         = "${var.vm_linked_clone}"
  admin_user           = "${var.vm_admin_user}"
  admin_password       = "${var.vm_admin_password}"

  template_name        = "${var.nginx_template}"
  template_os_family   = "${var.nginx_template_os_family}"
  vm_count             = "${var.nginx_count}"
  vm_name_prefix       = "${var.nginx_name_prefix}"
  num_cpus             = "${var.nginx_num_cpus}"
  memory               = "${var.nginx_memory}"
  ipv4_network_address = "${var.nginx_ipv4_network_address}"
  ipv4_address_start   = "${var.nginx_ipv4_address_start}"
}

module "tig_virtual_machines" {
  source               = "./modules/vm"
  datacenter           = "${var.vsphere_datacenter}"
  datastore            = "${var.vsphere_datastore}"
  network              = "${var.vsphere_network}"
  resource_pool        = "${var.vsphere_resource_pool}"

  dns_servers          = "${var.vm_dns}"
  domain_name          = "${var.vm_domain}"
  ipv4_gateway         = "${var.vm_gateway}"
  linked_clone         = "${var.vm_linked_clone}"
  admin_user           = "${var.vm_admin_user}"
  admin_password       = "${var.vm_admin_password}"

  template_name        = "${var.tig_template}"
  template_os_family   = "${var.tig_template_os_family}"
  vm_count             = "${var.tig_count}"
  vm_name_prefix       = "${var.tig_name_prefix}"
  num_cpus             = "${var.tig_num_cpus}"
  memory               = "${var.tig_memory}"
  ipv4_network_address = "${var.tig_ipv4_network_address}"
  ipv4_address_start   = "${var.tig_ipv4_address_start}"
}

module "jumpw_virtual_machines" {
  source               = "./modules/vm"
  datacenter           = "${var.vsphere_datacenter}"
  datastore            = "${var.vsphere_datastore}"
  network              = "${var.vsphere_network}"
  resource_pool        = "${var.vsphere_resource_pool}"

  dns_servers          = "${var.vm_dns}"
  domain_name          = "${var.vm_domain}"
  ipv4_gateway         = "${var.vm_gateway}"
  linked_clone         = "${var.vm_linked_clone}"
  admin_user           = "${var.vm_admin_user}"
  admin_password       = "${var.vm_admin_password}"

  template_name        = "${var.jumpw_template}"
  template_os_family   = "${var.jumpw_template_os_family}"
  vm_count             = "${var.jumpw_count}"
  vm_name_prefix       = "${var.jumpw_name_prefix}"
  num_cpus             = "${var.jumpw_num_cpus}"
  memory               = "${var.jumpw_memory}"
  ipv4_network_address = "${var.jumpw_ipv4_network_address}"
  ipv4_address_start   = "${var.jumpw_ipv4_address_start}"
}