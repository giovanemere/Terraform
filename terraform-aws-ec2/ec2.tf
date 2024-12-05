variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

locals {
  instance_type = var.environment == "prod" ? "t3.micro" : "t2.micro"
}

resource "aws_ebs_volume" "example" {
  availability_zone = "${var.environment == "dev" ? data.aws_subnet.terraform1.availability_zone : data.aws_subnet.terraform1.availability_zone}"
  
  size = 1
  type = "gp2"
  
}

resource "aws_instance" "web" {
  
  ami = var.linux-ami
  availability_zone = "${var.environment == "dev" ? data.aws_subnet.terraform1.availability_zone : data.aws_subnet.terraform1.availability_zone}"
  instance_type = local.instance_type
  
  user_data = "${file("userdata.sh")}"

  tags = {
    Name = var.tags_name == "" ? null : var.tags_name
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
  
}