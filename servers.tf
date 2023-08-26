resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}
output "aws_instance" {
    value = aws_instance.frontend.public_ip
  }

 data "aws_ami" "centos" {
    owners      = ["973714476881"]
    most_recent = true
    name_regex  = "Centos-8-DevOps-Practice"
 }


output "ami" {
value = data.aws_ami.centos.image_id
 }



#resource "aws_instance" "frontend" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "frontend"
#  }
#resource "aws_instance" "frontend" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "frontend"
#  }
#resource "aws_instance" "frontend" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "frontend"
#  }
#resource "aws_instance" "frontend" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "frontend"
#  }
#resource "aws_instance" "frontend" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "frontend"
#  }
#resource "aws_instance" "frontend" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "frontend"
#  }
#resource "aws_instance" "frontend" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "frontend"
#  }
#resource "aws_instance" "frontend" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "frontend"
#  }
#resource "aws_instance" "frontend" {
#  ami           = "ami-03265a0778a880afb"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "frontend"
#  }





