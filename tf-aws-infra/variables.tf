variable "vpc_security_group" {
  type    = list(string)
  default = ["sg-0359e36425359a42d"]
}

variable "vpc_id" {
  type    = string
  default = "vpc-03a30cf3ae0d09353"
}

variable "ami_id" {
  type    = string
  default = "ami-06640050dc3f556bb"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vms_key" {
  type    = string
  default = "kat-pem"
}
