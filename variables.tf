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

variable "vm_template" {
  description = "Template used to create the vSphere virtual machines (linked clone)"
}

variable "vm_ips" {
  type        = "map"
  description = "IPs used for the nodes"
}

variable "vm_cpu" {
  description = "Number of vCPU for the Kubernetes master virtual machines"
}

variable "vm_ram" {
  description = "Amount of RAM for the Kubernetes master virtual machines (example: 2048)"
}

variable "vm_linked_clone" {
  description = "Use linked clone for Clone Build"
}

variable "vm_name_prefix" {
  description = "Hostname applied by the VMware template customizations"
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
