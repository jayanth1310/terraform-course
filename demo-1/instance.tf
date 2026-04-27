resource "aws_instance" "example" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
}
resource "aws_instance" "data_boundary" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "ami-09389419837")
  instance_type = var.instance_type["other_instance"]
  tag = {
    "name" = "data instance"
  } 
}

resource "aws_instance" "data"{
  subnet_id = module.vpc.vpc_id

}

resource "aws_instance" "web"{
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type.example
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_groups_ids = [aws_security_group.allow_ssh.id]
  key_name = aws_key_pair.orawe_key.key_name
  user_data = templatefile("${path.module}/templates/web.tpl",{
    "region" = var.aws_region
  })
  tags = {
    Name = "example"
  }
}
resource "aws_key_pair" "orawe_key"{
  key_name = "demo-orawekey"
  public_key = "ssh-rsa AAKDFlkoisdlkajlkJ8798769jhdfkhsdkjasjhdkhasJhkjhkjkjHKJhh"
}

provisioner "remote-exec"{
  inline = [
    "sudo apt update",
    "sudo apt-get -y install nginx"
  ]
}