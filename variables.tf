variable "proxmox_endpoint" {
  description = "Proxmox API endpoint"
  type        = string
}

variable "proxmox_username" {
  description = "Proxmox username (e.g. root@pam)"
  type        = string
}

variable "proxmox_password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
}


variable "template_per_node" {
  description = "Map of Proxmox node name to template VMID"
  type        = map(number)
  default     = {}
}

variable "vm_password" {
  description = "Password for VM root user (cloud-init)"
  type        = string
  sensitive   = true
}

variable "nodes" {
  description = "List Proxmox nodes for VM placement"
  type        = list(string)
  default     = []
}

variable "worker_count" {
  description = "Jumlah worker VM"
  type        = number
}

variable "worker_cpu" {
  description = "Jumlah CPU cores per worker VM"
  type        = number
  default     = 2
}

variable "worker_memory" {
  description = "Jumlah memory (MB) per worker VM"
  type        = number
  default     = 4096
}