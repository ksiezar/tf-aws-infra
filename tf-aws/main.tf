provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "windows" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}"

  tags {
    Name = "${var.name}"
  }
}
