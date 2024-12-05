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

### ec2.tf
```
availability_zone = "${var.aws_region}a"
ami = var.linux-ami
availability_zone = "${var.aws_region}a"
instance_type = var.instancetype
user_data = "${file("userdata.sh")}"
volume_id = aws_ebs_volume.example.id
instance_id = aws_instance.web.id
```
### variables.tf
```
variable "aws_region" {
    type = string
    description = "AWS Region"
}


variable "linux-ami" {
    type = string
    description = "AWS AMI Ubuntu"
    default = "ami-0866a3c8686eaeeba"
  
}

variable "instancetype" {
    type = string
    description = "AWS Instance type"
    default = "t2.micro"
  
}
```
### terraform.tfvars
```
aws_region = "us-east-1"
```
## Comandos de terraform

```
terraform init
terraform validate
terraform plan -var-file terraform.tfvars -out ec2.plan
terraform apply "ec2.plan"
terraform destroy
```
# limpiar proyecto
```
rm -rf .terraform .terraform.lock.hcl sophos
```