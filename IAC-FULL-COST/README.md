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
aws s3 mb s3://tfstate-bucket --endpoint-url $AWS_ENDPOINT_URL && \
aws s3api --endpoint-url $AWS_ENDPOINT_URL put-bucket-versioning \
  --bucket tfstate-bucket \
  --versioning-configuration Status=Enabled
```

## Desplegar infraestrucura

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

# configura la key

eval $(ssh-agent -s)

ssh-add mykey

# Verificar que realmente quedó cargada

ssh-add -L


# Entra a las instancias

Bastion

ssh -A -i mykey ec2-user@BASTION_PUBLIC_IP

# verifica que la llave quedo en el bastion

ssh-add -L

ingresa a private

ssh ec2-user@ip_private