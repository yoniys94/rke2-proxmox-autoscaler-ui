# Terraform variables
# IMPORTANT: Sensitive values should be set via TF_VAR_* environment variables
# or through the dashboard setup wizard

#scale up/scale down tinggal sesuaikan (jika diisi 0 maka akan dimatikan semua worker)
worker_count = 0

# resource per worker VM
worker_cpu = 2
worker_memory = 4096