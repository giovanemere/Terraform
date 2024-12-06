## Console
```
terraform console
/c/Users/edisson.zuniga/terraform.exe console
```
## Variable
Crear archivo main.tf y el contenido es
```
cat <<EOF >>main.tf
variable "prueba" {
    type = string
    default = "Esta es mi primer variable de terraform"
}
EOF

terraform console

### Traer variable
var.prueba
```
## Elements
Crear archivo main.tf y el contenido es
```
cat <<EOF >>main.tf
variable "list1" {
    
    type = list
    default = [0, 1, 2, 3]
}
EOF

terraform console

### Traer elemento

element(var.list1, 0)
0
element(var.list1, 2)
2
element(var.list1, 4)
0
```
## Index
Muestra la posicion
```
cd /c/Users/eizz/test/
terraform console

# Ejemplos basicos
index(["a", "b", "c"], "a")
index(["a", "b", "c"], "b")
index(["a", "b", "c"], "c")
index(["a", "b", "c"], "d")

cat <<EOF >>main.tf
variable "example_list" {
  type    = list(string)
  default = ["a", "b", "c"]
}
EOF

index(var.example_list, "b")
index(var.example_list, "c")

# Basic Example
element_index =  index(var.example_list, "b")

# Handling Non-Existent Elements
element = "d"
element_index = contains(var.example_list, element) ? index(var.example_list, element) : null

# Lists of Objects
variable "object_list" {
  type = list(object({
    id   = string
    name = string
  }))
  default = [
    {id = "1", name = "ObjectA"},
    {id = "2", name = "ObjectB"}
  ]
}

object_to_find = {id = "2", name = "ObjectB"}
object_index = [for object in var.object_list : object.id if object == object_to_find]

# Multiple Indexes
element_indexes = flatten([
  for element in var.example_list : [
    for i, value in var.example_list : i if value == element
  ]
])
```
## Join 
  Organizar  join(delimiter, list)
  ```
  terraform console
  split(", ", "this, and, that")

  join("-", tolist(["a","b","c"]))
  "a-b-c"

  split("/",var.VAR_NAME)

  output “gateway_network_name” {
  value =    split(“/”,azurerm_virtual_network_gateway.azure_vng.ip_configuration[0].subnet_id)[8]
  }

```
## List
``` 
  cat <<EOF >>main.tf
  variable "my_list1" { 
    type    = list(string) 
    default = ["apple", "banana", "cherry"] 
  } 
  variable "my_list2" { 
    type    = list(string) 
    default = ["carro", "avion", "mapa"] 
  } 
  EOF

    terraform console

    var.my_list1
    var.my_list2

    #Traer valor fijo
    element(var.my_list1, 0)
    element(var.my_list1, 1)
    element(var.my_list1, 2)

    #Traer rango
    slice(var.my_list2, 1, 3)

    # Basic
    sorted_list = sort(var.my_list2) 

  cat <<EOF >>main.tf
  variable "cloud_resources" { 
    type    = list(object({ 
      name = string 
      type = string 
    })) 
    default = [ 
      { 
        name = "server-a", 
        type = "compute" 
      }, 
      { 
        name = "database-b", 
        type = "storage" 
      }, 
      { 
        name = "cache-c", 
        type = "memory" 
      } 
    ] 
  } 
  EOF

  terraform console
  sort([for r in var.cloud_resources: r.name]) 
  sorted_resources = sort([for r in var.cloud_resources: r.name]) 

  #Custom Sorting Logic
  cat <<EOF >>main.tf
  variable "numbers_list" { 
    type    = list(number) 
    default = [ 5, 1, 3, 4, 2 ] 
  } 
  EOF
  terraform console
  reverse(sort(var.numbers_list)) 
  desc_sorted_number s = reverse(sort(var.numbers_list)) 
```
## lookup
lookup function lookup(map, key, default)
```
  terraform console
  lookup(tomap({"a"="b","c"="d"}), "a", "not here")
  lookup(tomap({"a"="b","c"="d"}), "x", "not here")

  cat <<EOF >>main.tf
  variable "ami_collection" {
      type = map(string)


      default = {
        "ubuntu" = "ami-00ae935ce6c2aa534"
        "amazon_linux" = "ami-00ae935ce6c2aa534"
        "rhel_sql" = "ami-0fd0947c3f88732f8"
        "windows_server_2019" = "ami-00ae935ce6c2aa534"
        "windows_server_2022" = "ami-0f96fbe09adbebdc9"
      }
  }
  EOF
  lookup(var.ami_collection, "ubuntu", "ami-0de899d345371c9aa")
```
## lower
```
  terraform console
  lower("SOPHOS")
  # url
  # https://nedinthecloud.com/2018/08/14/terraform-fotd-lower/
```
## maps
```
  # Basic
    var.map1
    var.map1["llave"]
    var.map2
    var.map2[3]
    lookup(var.map2, 1, 2)
    keys(var.map2)

  # https://www.env0.com/blog/terraform-map-variable-a-complete-guide-with-practical-examples#:~:text=For%20example%2C%20you%20can%20use%20a%20map%20to,prod%20%3D%20%E2%80%98m5.large%E2%80%99%2C%20all%20within%20a%20single%20variable.

  # map(string)
  cat <<EOF >>main.tf
  variable "region_map" {
    type = map(string)
    default = {
      "us-east-1" = "ami-0c55b159cbfafe1f0"
      "us-west-1" = "ami-0bdb828fd58c52235"
    }
  }
  EOF
  terraform console
  var.region_map["us-east-1"]

  # map(object({ ... }))
  cat <<EOF >>main.tf
  variable "instance_config_map" {
    type = map(object({
      instance_type = string
      ami = string
      ebs = bool
    }))
    default = {
      "us-east-1" = {
        instance_type = "t2.micro"
        ami = "ami-0c55b159cbfafe1f0"
        ebs_optimized = true
      }
      "us-west-1" = {
        instance_type = "t3.medium"
        ami = "ami-0bdb828fd58c52235"
        ebs_optimized = true
      }
    }
  }
  EOF
  terraform console
  var.instance_config_map["us-east-1"].ebs_optimized

  # map(map(string))
  cat <<EOF >>main.tf
  variable "nested_map" {
    type = map(map(string))
    default = {
      "production" = {
        "us-east-1" = "ami-0c55b159cbfafe1f0"
        "us-west-1" = "ami-0bdb828fd58c52235"
      }
      "staging" = {
        "us-east-1" = "ami-0a12345678abcd123"
        "us-west-1" = "ami-0b98765432efgh987"
      }
    }
  }
  EOF
  terraform console
  var.nested_map[“production”][“us-east-1”]

  # map(number)
  # map(bool)
  # map(list)
  # map(map(string))
  # map(set)
  # map(tuple([ ... ]))
```
## merge
  maps merge(map1, map2, ...)
  https://spacelift.io/blog/terraform-merge-function

  ```
  merge(tomap({"a"="b","c"="d"}), tomap({"e"="f","g"="h"}))
  merge(tomap({"a"="b","c"="d"}), tomap({"a"="b","e"="f","g"="h"}))

  cat <<EOF >>main.tf
  locals {
    map1 = {
      luke  = "jedi"
      yoda  = "jedi"
      darth = "sith"
    },
    map2 = {
      quigon     = "jedi"
      palpantine = "sith"
      hansolo    = "chancer"
    }
  }
  EOF
  terraform console
  merge(local.map1, local.map2)
  merged_map = merge(local.map1, local.map2)

  cat <<EOF >>main.tf
  locals {
    list1 = [
      { key = "luke", value = "jedi" },
      { key = "yoda", value = "jedi" }
    ]

    list2 = [
      { key = "darth", value = "sith" },
      { key = "palpatine", value = "sith" }
    ]

    merged_list = merge({ for elem in concat(local.list1, local.list2) : elem.key => elem })
  }
  EOF
  terraform console
  ```

## Replace
  replace replace(string, substring, replacement)
  https://build5nines.com/using-terraform-string-replace-function-for-regex-string-replacement/#:~:text=Here%E2%80%99s%20a%20simple%20example%20of%20performing%20a%20simple,%3D%20replace%28local.example_string%2C%20%22world%22%2C%20%22Terraform%22%29%20%23%20Outputs%3A%20%22Hello%2C%20Terraform%21%22
  
  ```
  replace("hola sophos", "o", "0")

  output "regex-replace-number" {
      value = "${replace("hello world 123", "/[0-9]/", "X")}"
  }
  # Output: "hello world XXX"


  output "regex-replace-remove-html-tags" {
    value = replace("<p>Hello, <b>world</b>!</p>", "/<[^>]+>/", "")
  }
  # Outputs: "Hello, world!"

  output "regex-replace-normalize-phone-number" {
    value = replace("+1 (555) 123-4567", "/[^\\d]/", "")
  }
  # Outputs: "15551234567"

  ```
## split
split(separator, string)
```
split("-", "a-b-c")

```
## substr
  substr(string, offset, length)
  ```
  substr("sophos1", -1, 1)
  substr("sophos", 1, 3)

  cat <<EOF >>main.tf
  variable "example_string" {
    description = "A string from which to extract a substring"
    default     = "Terraform"
  }

  locals {
    extracted_substring = substr(var.example_string, 0, 4)
  }

  output "substring_output" {
    value = local.extracted_substring
  }
  EOF
  terraform apply
  ```


# Funciones

## For maps
```
[for map2 in var.map2 : map2 if map2 != "Tuesday" ]
    [for list2 in var.list2 : list2 if list2 != "15" ]
```

## slice
```
slice(var.list2, 1, 3)
```

## Generar list
```
tolist(["a","b","c"])
```

## Generar mapa
```
tomap({"a"="b","c"="d"})
```
## cambiar mayusculas a minusculas
```
upper("sophos")
```
## Cortar de acuerdo simbolo
```
split(":", "asdf:sdgf:gfd")
```

## Tiempo
```
timestamp()
```

## Search modules
registry.terraform.io

# Comandos
```
terraform init
terraform validate
terraform plan -out sophos
terraform apply sophos
terraform apply
terraform destroy

# Limpiar proyecto
rm -rf .terraform terraform.tfstate
```