resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ebs_volume" "web_volume" {
  availability_zone = var.availability_zone
  size             = var.ebs_volume_size
}

resource "aws_volume_attachment" "web" {
  device_name = "/dev/sdf"
  instance_id = aws_instance.example.id
  volume_id   = aws_ebs_volume.example.id
}
