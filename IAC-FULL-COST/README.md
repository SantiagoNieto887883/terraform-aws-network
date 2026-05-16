<h1>
Terraform aws network
<h1/>

## iniciar
autenticate en AWS con 

aws configure o aws login

## generar llave

ssh-keygen -t rsa -b 2048 -f mykey

chmod 400 mykey

## Crea un bucket s3 para declarar en el backend de terraform (aplica si usas localstack)

```bash
docker exec terraform-localstack-aws-s3-localstack-1 bash -lc "\
awslocal s3 mb s3://tfstate-bucket && \
awslocal s3api put-bucket-versioning \
  --bucket tfstate-bucket \
  --versioning-configuration Status=Enabled"
```

## ejecutar

terraform init

terraform plan -var-file=env/dev.tfvars -out tfplan

## ver plan
terraform show -no-color tfplan > plan.txt

## aplicar plan
terraform apply -var-file=env/dev.tfvars

## destruye
terraform destroy -var-file=env/dev.tfvars

## adicionales

## ver ip de las instancias

Entra a las instancias

ssh -i mykey ec2-user@IP_BASTION
