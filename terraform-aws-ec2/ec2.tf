resource "aws_ebs_volume" "example" {
  availability_zone = "${var.aws_region}a"
  
  size = 1
  type = "gp2"
  
}

resource "aws_instance" "web" {
  ami = var.linux-ami
  availability_zone = "${var.aws_region}a"
  instance_type = var.instancetype
  user_data = "${file("userdata.sh")}"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
  
}