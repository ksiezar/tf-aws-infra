variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_security_group" {
  type    = list(string)
  default = ["sg-0359e36425359a42d"]
}

variable "vpc_id" {
  type    = string
  default = "vpc-03a30cf3ae0d09353"
}

variable "vpc_cidr_block" {
  type    = string
  default = "172.31.0.0/16"
}

variable "ami_id" {
  type    = string
  default = "ami-041306c411c38a789"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
