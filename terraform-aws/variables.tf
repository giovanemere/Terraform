variable "aws_region" {
    type = string
    description = "AWS Region"
}


variable "linux-ami" {
    type = string
    description = "AWS AMI Ubuntu"
    default = "ami-0866a3c8686eaeeba"
  
}

variable "instancetype" {
    type = string
    description = "AWS Instance type"
    default = "t2.micro"
  
}