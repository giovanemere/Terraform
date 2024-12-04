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

| module | url terraform                                                                            | url code                                                                   |
| ------ | ---------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| vpc    | [terraform vpc](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest) | [Source Code](https://github.com/terraform-aws-modules/terraform-aws-rds.git) |
| aim    | [terraform iam](https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest) | [Source Code](https://github.com/terraform-aws-modules/terraform-aws-iam.git) |
| rds    | [terraform]([https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest])   | [Source Code](https://github.com/terraform-aws-modules/terraform-aws-rds.git) |

# Pasos de importación de modulos

1. Descarga el source del módulo de VPC
2. Crear aun archivo .tf y agrega el modulo referenciando la ruta del modulo

```
module "vpc" {
  source = "./modules/terraform-aws-vpc/"
```
Comandos de terraform

```
terraform validate
terraform init
terraform plan -var-file terraform.tfvars -out sophos
terraform apply "sophos"
terraform destroy

```