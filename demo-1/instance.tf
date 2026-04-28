resource "aws_instance" "example" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
}

resource "aws_security_group" "sg_security_private_allow_ssh"{
  vpc_id = "${aws_vpc.main.id}"
  name = "allow_ssh"
  egress = {
    to_port = 0
    from_port = 0
    protocol = -1
    cidr_block = ["0.0.0.0/0"]
  }
  ingress = {
    to_port = 22
    from_port = 22
    protocol = -1
    cidr_block = ["0.0.0.0/0]
  }
  tags={
    name = "sg for inward and outward of data"
  }
}