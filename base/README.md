# Prerequsitos:

Instala aws cli en la computadora bajándola del siguiente enlace
url: https://aws.amazon.com/cli/

```
aws configure
```

| col1                          | col2              |
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
terraform plan -out ec2.plan
terraform apply "att.plan"
terraform destroy
```

