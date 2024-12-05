resource "aws_vpc" "terraform" {
    cidr_block = "10.0.0.0/16"
}

data "aws_subnet" "terraform1" {
    id = "subnet-07cd9e678aeb07a44"
}

data "aws_subnet" "terraform2" {
    id = "subnet-00d327135f620c82d"
}