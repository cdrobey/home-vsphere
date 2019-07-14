#===============================================================================
# Global vsphere/vcenter parameters
#===============================================================================

variable "vsphere_server" {
  description = "ESXI host FQDN or IP"
}
variable "vsphere_user" {
  description = "vSphere user name"
}
variable "vsphere_password" {
  description = "vSphere password"
}
variable "vsphere_unverified_ssl" {
  description = "Is the vCenter using a self signed certificate (true/false)"
}
variable "vsphere_datacenter" {
  description = "vSphere datacenter"
}
variable "vsphere_cluster" {
  description = "vSphere cluster"
  default     = ""
}
variable "vsphere_resource_pool" {
  description = "vSphere resource pool"
}

variable "vsphere_host" {
  description = "vSphere Host"
}
variable "vsphere_datastore" {
  description = "Datastore used for the vSphere virtual machines"
}
variable "vsphere_network" {
  description = "Network used for the vSphere virtual machines"
}


#===============================================================================
# Global virtual machines parameters
#===============================================================================
variable "vm_template" {
  description = "Template used to create the vSphere virtual machines (linked clone)"
}

variable "vm_linked_clone" {
  description = "Use linked clone for Clone Build"
}

variable "vm_domain" {
  description = "Domain applied by the VMware template customizations"
}
variable "vm_netmask" {
  description = "Netmask applied by the VMware template customizations"
}
variable "vm_gateway" {
  description = "Gateway applied by the VMware template customizations"
}
variable "vm_dns" {
  description = "DNS Server applied by the VMware template customizations"
}


# The count to create of TIG virtual machines #
variable "test_count"  {}

# The prefix to add to the TIG virtual machines #
variable "test_name_prefix" {}

# The number of vCPU allocated to the TIG virtual machines #
variable "test_num_cpus" {}

# The amount of RAM allocated to the TIG virtual machines #
variable "test_memory" {}

# The IP Address to the TIG virtual machines #
variable "test_ipv4_address_start" {}

variable "test_ipv4_network_address" {}

# The vSphere template the virtual machine are based on #
variable "test_template" {}

variable "test_template_os_family" {}

