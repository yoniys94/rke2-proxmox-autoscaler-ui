locals {
  workers = {
    for i in range(var.worker_count) :
    format("worker-%02d", i + 1) => {
      index = i
      node  = var.nodes[i % length(var.nodes)]
      ip    = cidrhost("172.16.40.0/27", 18 + i)
    }
  }
}

resource "proxmox_virtual_environment_vm" "worker" {
  for_each = local.workers

   vm_id = 710 + each.value.index

## berfungsi agar vm worker existing tidak ikut ke modify/restart
# jika ingin update resource seperti cpu, memory bisa disable pada lifecycle
lifecycle {
  ignore_changes = [
    node_name,
    initialization,
    network_device,
    boot_order,
    cpu,
    memory,
  ]
}

  name      = format("rke2-%s", each.key)
  node_name = each.value.node


   clone {
  vm_id = var.template_per_node[each.value.node]
  full    = true
}

  cpu {
    cores = var.worker_cpu
    type  = "host"
  }

  memory {
    dedicated = var.worker_memory
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  boot_order = ["scsi0", "ide2", "net0"]

  initialization {
    datastore_id = "local-lvm"
    ip_config {
      ipv4 {
        address = "${each.value.ip}/27"
        gateway = "172.16.40.1"
      }
    }

    user_account {
      username = "root"
      password = var.vm_password
    }
  }

  started = true
}
