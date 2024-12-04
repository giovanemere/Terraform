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


# recurso compartido de state en bucket s3
terraform validate
terraform import aws_vpc.terraform vpc-0546f3224141adc13


terraform validate
terraform plan -out ec2.plan
terraform apply

terraform validate
terraform plan -out att.plan
terraform apply "att.plan"


terraform plan -out ec2.plan
terraform apply "ec2.plan"


terraform init -upgrade
terraform plan -out mysq.plan

simpli-sdlc\devops\gft-ai-impact-docker-dev\docker-compose.yml


# Otras formas
terraform plan -var "aws_region=us-east-1"
terraform plan -var-file values.tfvars
export TF_VAR_ami=ami-0d26eb3972b7f8c96

```
