provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "windows_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = var.aws_region
  vpc_security_group_ids = var.vpc_security_group

  tags = {
    Name = "windows-main"
  }
}
