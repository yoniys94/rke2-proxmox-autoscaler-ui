# RKE2 Proxmox Worker Autoscaling 🚀

Infrastructure as Code (IaC) project to automatically scale RKE2 Kubernetes worker nodes on Proxmox using Terraform.

## ✨ Features
- ⚡ Automated provisioning of RKE2 worker nodes
- 📈 Horizontal scaling based on demand
- 🏗️ Proxmox VM lifecycle management
- 🔁 Idempotent and reproducible infrastructure
- 🔐 Ready for production environments

## 🧰 Tech Stack
- Terraform
- RKE2 (Rancher Kubernetes Engine 2)
- Proxmox VE

## 📦 Use Cases
- Dynamic Kubernetes cluster scaling
- Cost-efficient resource management
- Hybrid / on-prem Kubernetes infrastructure

## 🚀 Getting Started

### 1. Initialize Terraform
```bash

terraform init

```

### 2. Configure Scaling
```bash
	2.1. edit file > terraform.tfvars
	2.2. Set jumlah worker
			worker_count = 2
		 Keterangan:
			0 → destroy semua VM worker
			1 → deploy 1 worker
			2 → deploy 2 worker
			3+ → jumlah worker sesuai kebutuhan
```

### 3. Apply Configuration
```bash

	terraform apply

	```