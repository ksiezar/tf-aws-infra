provider "aws" {
  region = "us-east-1"
}

###### VPC ID ######

resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}

###### Security Group ######

resource "aws_security_group" "sg_instances" {
  name        = "sg_instances"
  description = "Allow Application inbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "sg_instances"
  }
}

###### Security Group Rules Ingress ######

resource "aws_security_group_rule" "app-web-ingress" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.sg-instances.id
}

resource "aws_security_group_rule" "http-web-ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.sg-instances.id
}

resource "aws_security_group_rule" "https-web-ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.sg-instances.id
}

resource "aws_security_group_rule" "ssh-ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.sg-instances.id
}

resource "aws_security_group_rule" "application-ingress" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.sg-instances.id
}

###### Security Group Rules Outbound ######

resource "aws_security_group_rule" "app-outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "All"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-instances.id
}

###### EC2 Instances ######

resource "aws_instance" "rhel_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.vms_key
  security_groups        = [aws_security_group.sg-instances.name]
  tags = {
    Name = "slave-01"
  }
}

