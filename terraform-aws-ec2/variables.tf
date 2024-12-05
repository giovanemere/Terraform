variable "aws_region" {
    type = string
    description = "AWS Region"
}

variable "linux-ami" {
    type = string
    description = "AWS AMI Ubuntu"
    default = "ami-0866a3c8686eaeeba"
  
}

variable "tags_name" {
  description = "The new keyname"
  default = "ID_EC2_DS"
}