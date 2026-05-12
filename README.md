<h1>
Terraform aws network
<h1/>

## iniciar
autenticate en AWS con 

aws configure o aws login

## ejecutar

terraform init

terraform plan -var-file=env/dev.tfvars -out tfplan

## ver plan
terraform show -no-color tfplan > plan.txt

## aplicar plan
terraform apply -var-file=env/dev/terraform.tfvars

## destruye
terraform destroy -var-file=env/dev.tfvars

