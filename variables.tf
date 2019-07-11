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

#===============================================================================
# Puppet virtual machines parameters
#===============================================================================

variable "puppet_cpu" {
  description = "Number of vCPU for the Kubernetes master virtual machines"
}

variable "puppet_ram" {
  description = "Amount of RAM for the Kubernetes master virtual machines (example: 2048)"
}

variable "puppet_count" {
  description = "Qty of VM Created from template"
}
variable "puppet_name_prefix" {
  description = "Hostname applied by the VMware template customizations"
}
variable "puppet_ipv4" {
  description = "Hostname applied by the VMware template customizations"
}


#===============================================================================
# Docker virtual machines parameters
#===============================================================================
variable "docker_cpu" {
  description = "Number of vCPU for the Kubernetes master virtual machines"
}

variable "docker_ram" {
  description = "Amount of RAM for the Kubernetes master virtual machines (example: 2048)"
}

variable "docker_count" {
  description = "Qty of VM Created from template"
}
variable "docker_name_prefix" {
  description = "Hostname applied by the VMware template customizations"
}
variable "docker_ipv4" {
  description = "Hostname applied by the VMware template customizations"
}

#===============================================================================
# NGINX virtual machines parameters
#===============================================================================
variable "nginx_cpu" {
  description = "Number of vCPU for the Kubernetes master virtual machines"
}

variable "nginx_ram" {
  description = "Amount of RAM for the Kubernetes master virtual machines (example: 2048)"
}

variable "nginx_count" {
  description = "Qty of VM Created from template"
}
variable "nginx_name_prefix" {
  description = "Hostname applied by the VMware template customizations"
}
variable "nginx_ipv4" {
  description = "Hostname applied by the VMware template customizations"
}

#===============================================================================
# TIG virtual machines parameters
#===============================================================================
variable "tig_cpu" {
  description = "Number of vCPU for the Kubernetes master virtual machines"
}

variable "tig_ram" {
  description = "Amount of RAM for the Kubernetes master virtual machines (example: 2048)"
}

variable "tig_count" {
  description = "Qty of VM Created from template"
}
variable "tig_name_prefix" {
  description = "Hostname applied by the VMware template customizations"
}
variable "tig_ipv4" {
  description = "Hostname applied by the VMware template customizations"
}