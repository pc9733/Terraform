provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "example_security_group" {
  name_prefix = "example_sg_"
  vpc_id = "vpc-0d3eb7b1df69b788b"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 8080
    to_port     = 8080
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



resource "aws_instance" "Docker_instance" {
  ami           = "ami-0d47196b4a8868027"
  instance_type = "t2.micro"
  key_name      = "Affirmation"
  root_block_device {
    volume_size = 10
  }
  security_groups = [aws_security_group.example_security_group.name]

  tags = {
    Name = "Docker_Instance"
  }
}

resource "aws_instance" "Ansible_master_instance" {
  ami           = "ami-009b638632aa570e7"
  instance_type = "t2.micro"
  key_name      = "Affirmation"
  root_block_device {
    volume_size = 10
  }
  security_groups = [aws_security_group.example_security_group.name]

  tags = {
    Name = "Ansible_master"
  }
}

resource "aws_instance" "Jenkins" {
  ami           = "ami-04c2c04d335ea1bef"
  instance_type = "t2.micro"
  key_name      = "Affirmation"
  root_block_device {
    volume_size = 10
  }
  security_groups = [aws_security_group.example_security_group.name]

  tags = {
    Name = "Jenkins"
  }
}
