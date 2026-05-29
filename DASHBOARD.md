# RKE2 Worker Autoscaler Dashboard

Dashboard untuk scaling RKE2 worker nodes melalui UI, mengintegrasikan dengan Terraform.

## Prasyarat

- Terraform sudah terinstall dan di-`terraform init`
- Python 3.8+
- Proxmox access credentials sudah benar di `terraform.tfvars`

## Installasi

```bash
pip install -r requirements.txt
```

## Menjalankan Dashboard

```bash
python app.py
```

Dashboard akan tersedia di `http://localhost:5000`

## Fitur

- **+/- buttons**: Tambah/kurang worker count (max 10)
- **Status display**: Show current config vs deployed VMs
- **Apply Changes**: Eksekusi `terraform apply` dengan konfirmasi auto-approve
- **Live log**: Tampilkan output Terraform secara real-time

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/status` | Get current worker count & deployed status |
| GET | `/api/worker-count` | Get configured worker count |
| POST | `/api/worker-count` | Set worker count (`{"worker_count": N}`) |
| POST | `/api/terraform/plan` | Run `terraform plan` |
| POST | `/api/terraform/apply` | Run `terraform apply -auto-approve` |

## Catatan

- Worker count di-read langsung dari `terraform.tfvars`
- Apply menggunakan `-auto-approve` (perhatikan implikasi security)
- Maximum workers dibatasi 10 untuk safety
- Interval polling status: 10 detik