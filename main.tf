# Provider
provider "vsphere" {
  user                 = local.cluster_config.user
  password             = local.cluster_config.password
  vsphere_server       = local.cluster_config.vsphere_server
  allow_unverified_ssl = local.cluster_config.allow_unverified_ssl
}

data "vsphere_datacenter" "datacenter" {
  name = local.cluster_config.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = local.cluster_config.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = local.cluster_config.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = local.cluster_config.vsphere_compute_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = local.cluster_config.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  num_cpus         = lookup(local.cpu_units_list, var.instance_type)
  memory           = lookup(local.mems_list, var.instance_type)
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "unicloud"
        domain    = "8.8.8.8"
      }
      network_interface {
        ipv4_address = var.vm_ip
        ipv4_netmask = 22
      }
      ipv4_gateway = "10.30.1.1"
    }
  }
  disk {
    label = "disk0"
    size  = var.vm_disk_size
  }
}
