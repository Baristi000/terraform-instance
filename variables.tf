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

variable "cpu_units_list" {
  description = "Number of virtual cpu."
  type = map(number)
  default = {
    "t2.small"   = 1
    "t2.medium"  = 2
  }
}

variable "mems_list" {
  description = "Memory capacity."
  type = map(number)
  default = {
    "t2.small"   = 2048
    "t2.medium"  = 4096
  }
}

variable "user" {
  description = "Vcenter server username."
  type        = string
  default     = "administrator@vcenter.local"
}

variable "password" {
  description = "Vcenter server password."
  type        = string
  default     = "Aqswde123@@"
}

variable "vsphere_server" {
  description = "Vcenter server ip."
  type        = string
  default     = "10.35.1.35"
}

variable "allow_unverified_ssl" {
  description = "Vcenter server cert : true if using https, false if using http."
  type        = bool
  default     = true
}

variable "vsphere_datacenter" {
  description = "Vcenter datacenter name."
  type        = string
  default     = "Datacenter"
}


variable "vsphere_datastore" {
  description = "Vcenter datastore name."
  type        = string
  default     = "RAID5_HDD"
}

variable "vsphere_network" {
  description = "Vcenter network name."
  type        = string
  default     = "VM Network"
}

variable "vsphere_compute_cluster" {
  description = "Vcenter cluster name."
  type        = string
  default     = "Cluster.HCM"
}

variable "template" {
  description = "Vcenter template name."
  type        = string
  default     = "Ubuntu-20.04"
}
