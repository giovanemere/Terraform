# Prerequsitos:
Instala aws cli en la computadora bajándola del siguiente enlace 
url: https://aws.amazon.com/cli/

```
aws configure
```
AWS Access Key ID [None]: AKIATNVXXXXXXXXXX
AWS Secret Access Key [None]: Xl7MVAn6a5UMKuZcTl1LXXXXXXXXXXXXXXXX
Default region name [None]: us-east-1
Default output format [None]: json

## Test
```
aws s3 ls 
```
# Estructura Proyecto

Para terraform su estructur basica archivos es la siguiente

cree los siguientes archivos en la carpeta del proyecto

```
touch main.tf
touch outputs.tf
touch README.md
touch terraform.tfvars
touch variables.tf
```

# import modules

NA

# Pasos de importación de modulos

1. Descarga el source del módulo de VPC
2. Crear aun archivo .tf y agrega el modulo referenciando la ruta del modulo

```
module "vpc"
  source = "./modules/terraform-aws-vpc/"
```
## Comandos de terraform

```
terraform validate
terraform init
terraform plan -var-file terraform.tfvars -out ec2.plan
terraform apply "ec2.plan"
terraform destroy
```
# limpiar proyecto
```
rm -rf .terraform .terraform.lock.hcl sophos
```