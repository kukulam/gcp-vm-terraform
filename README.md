# gcp-vm-terraform
Simple repository for creating gcp vm instances with terraform on different environments.

### How to create vm ? 
1. Init or refresh state 
```bash
cd ./environments/dev/europe-central2
terraform init
```
or 
```bash
terraform refresh
```
2. Check state
```bash
terraform plan
```

3. Apply plan
```bash
terraform apply
```

### How to destroy vm ?
```bash
terraform plan -destroy -target `module.gcp_vm.google_compute_instance.gcp_vm_instance`
```

#### Warning
Notice that repository does not use any persistence for storing terraform state. 
When more than one person will be using terraform repository you should provide backend for terraform state.

Example by [providing s3 backend](https://www.terraform.io/language/settings/backends/s3) in ``main.tf``:
```terraform
terraform {
  backend "s3" {
    bucket = ""
    key = ""
    region = ""
  }
}
```