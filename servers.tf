#module "servers" {
#  for_each = var.components
#  source = "./module"
#
#  components_name = each.value["name"]
#  env             = var.env
#  instance_type   = each.value["instance-type"]
#  password        = lookup(each.value, "password", "null")
#}

resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}