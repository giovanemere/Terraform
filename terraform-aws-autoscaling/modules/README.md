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
Carpetas de los modules del proyecto
```
modules/terraform-aws-vpc/
modules/terraform-aws-rds/
modules/terraform-aws-iam/
```
# import modules

| module | url terraform | url code |
| ------ | ------  |  ------ |
| autoscaling  | [autoscaling](https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/latest) | [Source Code](https://github.com/terraform-aws-modules/terraform-aws-autoscaling.gitt) |

# Pasos de importación de modulos

1. Descarga el source del módulo
modules/terraform-aws-autoscaling/

2. Crear aun archivo .tf y agrega el modulo referenciando la ruta del modulo

```
module "vpc"
  source = "./modules/terraform-aws-autoscaling/"

vpc_zone_identifier       = ["subnet-0176959827507afb1", "subnet-0176959827507afb1"]

network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = ["sg-023a9bb0f9bd8f043"]
    },
    {
      delete_on_termination = true
      description           = "eth1"
      device_index          = 1
      security_groups       = ["sg-023a9bb0f9bd8f043"]
    }
  ]

  placement = {
    availability_zone = "us-east-1a"
  }

```
## Comandos de terraform
```
terraform init
terraform validate
terraform plan -out autoscaling.plan
terraform apply "autoscaling.plan"
terraform destroy
```