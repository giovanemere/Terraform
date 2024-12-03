# Ejecutar Consola
/c/Users/edisson.zuniga/terraform.exe console

# validate estructure
/c/Users/edisson.zuniga/terraform.exe validate


# Estructura Proyecto
Para terraform su estructur basica archivos es la siguiente

cree los siguientes archivos en la carpeta del proyecto

# Ejecutar variables

```
    var.prueba
    var.numero    
```
# Comandos Maps

```
    # Ejecutar maps
    var.map1
    var.map1["llave"]
    var.map2
    var.map2[3]
    lookup(var.map2, 1, 2)
    keys(var.map2)
```

# Comandos List

```
    #Ejcuatr lista
    var.list1
    var.list2

    #Traer valor fijo
    element(var.list1, 0)

    #Traer rango
    slice(var.list2, 1, 3)
```

# Extract Map and List
```
[for map2 in var.map2 : map2 if map2 != "Tuesday" ]
    [for list2 in var.list2 : list2 if list2 != "15" ]
```

# Search modules

```
registry.terraform.io

#Comandos
terraform init
terraform validate
terraform plan -out sophos
terraform apply sophos
terraform apply
terraform destroy

# Limpiar proyecto
rm -rf .terraform terraform.tfstate

```
