# Ejecutar Consola
/c/Users/edisson.zuniga/terraform.exe console

# validate estructure
/c/Users/edisson.zuniga/terraform.exe validate

# Ejecutar variables
    var.prueba
    var.numero

# Comandos Maps

    # Ejecutar maps
    var.map1
    var.map1["llave"]
    var.map2
    var.map2[3]
    lookup(var.map2, 1, 2)
    keys(var.map2)

# Comandos List

    #Ejcuatr lista
    var.list1
    var.list2

    #Traer valor fijo
    element(var.list1, 0)

    #Traer rango
    slice(var.list2, 1, 3)

# Extract Map and List
    [for map2 in var.map2 : map2 if map2 != "Tuesday" ]
    [for list2 in var.list2 : list2 if list2 != "15" ]

# Search modules
registry.terraform.io

#Comandos
terraform init
terraform validate
terraform plan -out sophos
terraform apply sophos
terraform apply
terraform destroy

# Comandos desarollo
terraform validate
terraform init
terraform plan -var-file terraform.tfvars -out sophos
terraform apply "sophos"
terraform destroy

# Otras formas
terraform plan -var "aws_region=us-east-1"
terraform plan -var-file values.tfvars
export TF_VAR_ami=ami-0d26eb3972b7f8c96


# Limpiar proyecto
rm -rf .terraform terraform.tfstate

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

# Comandos desarollo gft-ai-impact
terraform init
terraform validate
terraform plan -out docker.plan
terraform apply "docker.plan"

cd "/c/Users/eizz/OneDrive - GFT Technologies SE/Sophos_Data/Repositorio/simpli-sdlc/devops/gft-ai-impact-docker-dev"
docker-compose -f docker-compose.yml run --rm terraform init


docker-compose -f docker-compose.yml run --rm terraform init

# to format terraform code run
docker-compose -f deploy/docker-compose.yml run --rm terraform fmt

# validate terraform code for any errors
docker-compose -f docker-compose.yml run --rm terraform validate

# plan changes
docker-compose -f deploy/docker-compose.yml run --rm terraform plan

# apply changes
docker-compose -f deploy/docker-compose.yml run --rm terraform apply

# apply changes
docker-compose -f deploy/docker-compose.yml run --rm terraform destroy

# list all available workspaces
docker-compose -f deploy/docker-compose.yml run --rm terraform workspace list

# create a new worskpace called dev
docker-compose -f deploy/docker-compose.yml run --rm terraform workspace new dev
