


 resource "aws_instance" "instance" {
   for_each               = var.components
   ami                    = data.aws_ami.centos.image_id
   instance_type          = each.value["instance_type"]
   vpc_security_group_ids = [data.aws_security_group.allow-all.id]

   tags = {
     Name = each.value["name"]
   }
 }


resource "aws_route53_record" "frontend" {
  for_each = var.components
zone_id = "Z043469221HSK6L1Q1E1V"
 name    = "${each.value["name"]}-dev.bhaskar77.online"
 type    = "A"
 ttl     = 30
 records = [aws_instance.instance[each.value["name"]].private_ip]


}
#
#output "frontend" {
#  value = aws_instance.frontend.public_ip
#}
#
#resource "aws_instance" "catalogue" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = "var.instance_type"
#
#  tags = {
#    Name = "catalogue"
#  }
#}
#
#resource "aws_route53_record" "catalogue" {
#  zone_id = "Z043469221HSK6L1Q1E1V"
#  name    = "catalogue-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.catalogue.private_ip]
#}
#
#
#resource "aws_instance" "MongoDB" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = "var.instance_type"
#
#  tags = {
#    Name = "MongoDB"
#  }
#}
#
#resource "aws_route53_record" "MongoDB" {
#  zone_id = "Z043469221HSK6L1Q1E1V"
#  name    = "MongoDB-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.MongoDB.private_ip]
#}
#
#
#resource "aws_instance" "redis" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = "var.instance_type"
#
#  tags = {
#    Name = "redis"
#  }
#}
#
#resource "aws_route53_record" "redis" {
#  zone_id = "Z043469221HSK6L1Q1E1V"
#  name    = "redis-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.redis.private_ip]
#}
#
#
#resource "aws_instance" "user" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = "var.instance_type"
#
#  tags = {
#    Name = "user"
#  }
#}
#
#resource "aws_route53_record" "user" {
#  zone_id = "Z043469221HSK6L1Q1E1V"
#  name    = "user-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.user.private_ip]
#}
#
#
#resource "aws_instance" "cart" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = "var.instance_type"
#
#  tags = {
#    Name = "cart"
#  }
#}
#
#resource "aws_route53_record" "cart" {
#  zone_id = "Z043469221HSK6L1Q1E1V"
#  name    = "cart-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.cart.private_ip]
#}
#
#
#resource "aws_instance" "mysql" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = "var.instance_type"
#
#  tags = {
#    Name = "mysql"
#  }
#}
#
#resource "aws_route53_record" "mysql" {
#  zone_id = "Z043469221HSK6L1Q1E1V"
#  name    = "mysql-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mysql.private_ip]
#}
#
#
#resource "aws_instance" "shipping" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "shipping"
#  }
#}
#
#resource "aws_route53_record" "shipping" {
#  zone_id = "Z043469221HSK6L1Q1E1V"
#  name    = "shipping-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.shipping.private_ip]
#}
#
#resource "aws_instance" "rabbitmq" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "rabbitmq"
#  }
#}
#
#resource "aws_route53_record" "rabbitmq" {
#  zone_id = "Z043469221HSK6L1Q1E1V"
#  name    = "rabbitmq-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.rabbitmq.private_ip]
#}
#
#resource "aws_instance" "payment" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "payment"
#  }
#}
#
#resource "aws_route53_record" "payment" {
#  zone_id = "Z043469221HSK6L1Q1E1V"
#  name    = "payment-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.payment.private_ip]
#}
