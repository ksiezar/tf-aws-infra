provider "aws" {
  region = "us-east-1"
}

###### Security Group ######

resource "aws_security_group" "sg_instance_vms" {
  name        = "sg_instance_vms"
  description = "Allow Application inbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "sg_instance_vms"
  }
}

###### Security Group Rules Ingress ######

resource "aws_security_group_rule" "app-web-ingress" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance_vms.id
}

resource "aws_security_group_rule" "http-web-ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance_vms.id
}

resource "aws_security_group_rule" "https-web-ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance_vms.id
}

resource "aws_security_group_rule" "ssh-ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance_vms.id
}

###### Security Group Rules Outbound ######

resource "aws_security_group_rule" "app-outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "All"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_instance_vms.id
}

###### EC2 Instances ######

resource "aws_instance" "rhel_server02" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.vms_key
  security_groups        = [aws_security_group.sg_instance_vms.name]
  tags = {
    Name = "slave-02"
  }
}