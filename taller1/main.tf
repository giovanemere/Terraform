# Definir variables
variable "prueba" {
    type = string
    default = "Esta es mi primer variable de terraform"
}

#Mapa
variable "map1" {
    type = map(string)
    default = {
        llave = "valor"
    }
}

# Lista
variable "list1" {
    
    type = list
    default = [0, 1, 2, 3]
}

# taller 3
    variable "map2" {
        type = map(string)
        default = {
            1 = "Monday",
            2 = "Tuesday",
            3 = "Monday"
        }
    }

    # Lista
    variable "list2" {
        type = list
        default = ["a", 15, true]
    }

    # Definir variables tipo numero
    variable "numero" {
        type = number
        default = "5000000"
    }