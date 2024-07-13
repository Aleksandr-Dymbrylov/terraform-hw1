provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "allow_ssh_http_https" {
  name        = "allow_ssh_http_https"
  description = "Allow SSH, HTTP, and HTTPS inbound traffic"

  ingress {
    description = "SSH"
    from_port   = var.ports[0]
    to_port     = var.ports[0]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = var.ports[1]
    to_port     = var.ports[1]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = var.ports[2]
    to_port     = var.ports[2]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_instance" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.allow_ssh_http_https.name]
  availability_zone = var.availability_zone
}