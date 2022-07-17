provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "windows_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group
  key_name               = var.vms_key

  tags = {
    Name = "windows-01"
  }
}
