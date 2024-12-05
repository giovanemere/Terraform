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
modules/terraform-aws-elb/
```
# import modules

| module | url terraform | url code |
| ------ | ------  |  ------ |
| elb | [elb](https://registry.terraform.io/modules/terraform-aws-modules/elb/aws/latest) | [Source Code](https://github.com/terraform-aws-modules/terraform-aws-elb.git) |

# Pasos de importación de modulos

1. Descarga el source del módulo
modules/terraform-aws-autoscaling/

2. Crear aun archivo .tf y agrega el modulo referenciando la ruta del modulo

### modules
```
module "elb_http" {
  source  = "terraform-aws-modules/elb/aws"

  name = "elb-example"

  subnets         = ["subnet-12345678", "subnet-87654321"]
  security_groups = ["sg-12345678"]
  internal        = false

  listener = [
    {
      ssl_certificate_id = "arn:aws:acm:eu-west-1:235367859451:certificate/6c270328-2cd5-4b2d-8dfd-ae8d0004ad31"
    }
  ]

  access_logs = {
    bucket = "my-access-logs-bucket"
  }

  // ELB attachments
  number_of_instances = 2
  instances           = ["i-06ff41a77dfb5349d", "i-4906ff41a77dfb53d"]

}
```
### resource
```
resource "aws_elb" "bar" {
  name               = "foobar-terraform-elb"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

  access_logs {
    bucket        = "foo"
    bucket_prefix = "bar"
    interval      = 60
  }

  instances                   = [aws_instance.foo.id]
}
```

## Comandos de terraform elb
```
terraform init
terraform validate
terraform plan -out elb.plan
terraform apply "elb.plan"
terraform destroy
```

## Comandos de terraform main
```
terraform init
terraform validate
terraform plan -out elb_main.plan
terraform apply "elb_main.plan"
terraform destroy
```

### Clean project
```
rm -rf .terraform elb.plan
```