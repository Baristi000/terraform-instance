# editable config
variable "vm_name" {
  description = "Virtual machine name."
  type        = string
}

variable "vm_ip" {
  description = "Virtual machine ip address."
  type        = string
  default     = "10.30.1.25"
}

variable "vm_disk_size" {
  description = "Virtual machine disk size (Gb)."
  type        = number
  default     = 20
}

variable "instance_type" {
  description = "Virtual machine instance type."
  type        = string
  default     = "t2.small"
}

# unable to edit config
# sensitive config
locals {
  cluster_config = {
    user                    = "administrator@vcenter.local",
    password                = "Aqswde123@@",
    vsphere_server          = "10.35.1.35",
    allow_unverified_ssl    = true,
    vsphere_datacenter      = "Datacenter",
    vsphere_datastore       = "12. SSD-Raid1",
    vsphere_network         = "VM Network",
    vsphere_compute_cluster = "Cluster.HCM",
    template                = "template-k8s-v2"
  }
}

# config template
locals {
  cpu_units_list = {
    "t2.small"   = 1,
    "t2.medium"  = 2,
    "t2.large"   = 2,
    "t2.xlarge"  = 4,
    "t2.2xlarge" = 8,
    "a1.metal"   = 16,
    "c3.xlarge"  = 4,
    "c1.xlarge"  = 8
  }
  mems_list      = {
    "t2.small"   = 2048,
    "t2.medium"  = 4096,
    "t2.large"   = 8192,
    "t2.xlarge"  = 16384,
    "t2.2xlarge" = 32768,
    "a1.metal"   = 32768,
    "c3.xlarge"  = 7680,
    "c1.xlarge"  = 7168
  }
}
