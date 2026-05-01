<h1>
Terraform aws network
<h1/>

## iniciar
autenticate en AWS con 

aws configure o aws login

## ejecutar

terraform init

terraform plan -var-file=env/dev/terraform.tfvars

terraform apply -var-file=env/dev/terraform.tfvars
