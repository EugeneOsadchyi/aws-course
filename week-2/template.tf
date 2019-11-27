provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_security_group" "allow_ssh" {
  name        = "Allow SSH"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow SSH"
  }
}

resource "aws_launch_template" "my_launch_template" {
  image_id      = var.image_id
  instance_type = var.instance_type

  security_group_names = [aws_security_group.allow_ssh.name]
}

resource "aws_autoscaling_group" "my_autoscaling_group" {
  min_size = 2
  max_size = 2

  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "2"
  }
}
