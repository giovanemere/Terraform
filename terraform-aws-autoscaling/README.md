# Prerequsitos:

Instala aws cli en la computadora bajándola del siguiente enlace
url: https://aws.amazon.com/cli/

```
aws configure
```

| Name                          | Description              |
| ------------------------------- | ------------------- | 
| AWS Access Key ID [None]:     | AKIATNVXXXXXXXXXX | 
| AWS Secret Access Key [None]: | Xl7MVAn6a5UMKuZcTl1LX  |
| Default region name [None]: | us-east-1  |
| Default output format [None]  | json |

### Test

Listar buckets de aws

```
aws s3 ls
```
# Pasos de importación de modulos

1. Descarga el source del módulo
modules/terraform-aws-autoscaling/

2. Crear aun archivo main.tf y agrega el modulo referenciando la ruta del modulo

```
module "asg" {
  source  = "./modules/terraform-aws-autoscaling/"

  # Autoscaling group
  name = "test-curso-asg"

  vpc_zone_identifier       = ["subnet-07cd9e678aeb07a44", "subnet-0971405389acc36df"]

  image_id          = "ami-0866a3c8686eaeeba"
  instance_type     = "t3.micro"

  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}
```
# Estructura de Archivos

Para terraform su estructur basica archivos es la siguiente
cree los siguientes archivos en la carpeta del proyecto

```
touch main.tf
touch outputs.tf
touch README.md
touch terraform.tfvars
touch variables.tf
```

#### Comando Basicos

```
terraform init
terraform validate
terraform plan -out autoscaling.plan
terraform apply "autoscaling.plan"
terraform destroy
```

