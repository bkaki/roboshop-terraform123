data "aws_ami" "centos" {
  most_recent = true
  owners = ["973714476881"]
  name_regex   = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "allow-all" {
  default = "allow-all"
}
variable "components" {
  default  = {
    frontend = {
      name = "frontend"
      instance_type = "t3.small"
    }
    catalogue = {
     name = "catalogue"
     instance_type = "t3.micro"
  }
    mongodb = {
      name = "mongodb"
      instance_type = "t3.small"
    }
    user = {
      name = "user"
      instance_type = "t3.micro"
    }
      redis = {
        name = "redis"
        instance_type = "t3.small"
    }
      cart = {
        name = "cart"
        instance_type = "t3.micro"
    }
      mysql = {
        name = "mysql"
        instance_type = "t3.small"
    }
        shipping = {
           name = "shipping"
           instance_type = "t3.medium"
   }
      rabbitmq = {
       name = "rabbitmq"
       instance_type = "t3.small"
   }
        payment = {
            name = "payment"
            instance_type = "t3.small"
   }
  }
 }

  resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]

  tags = {
    Name = each.value["name"]
  }
}

##resource "aws_route53_record" "frontend" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "frontend-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.frontend.private_ip]
#}
#
#resource "aws_instance" "catalogue" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type =var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = {
#    Name = "catalogue"
#  }
#}
#
#resource "aws_route53_record" "catalogue" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "catalogue-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.catalogue.private_ip]
#}
#
#resource "aws_instance" "mongodb" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type =var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = {
#    Name = "mongodb"
#  }
#}
#resource "aws_route53_record" "mongodb" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "mongodb-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mongodb.private_ip]
#}
#resource "aws_instance" "user" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type =var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = {
#    Name = "user"
#  }
#}
#resource "aws_route53_record" "user" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "user-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.user.private_ip]
#}
#resource "aws_instance" "cart" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type =var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = {
#    Name = "cart"
#  }
#}
#resource "aws_route53_record" "cart" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "cart-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.cart.private_ip]
#}
#resource "aws_instance" "mysql" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type =var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = {
#    Name = "mysql"
#  }
#}
#resource "aws_route53_record" "mysql" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "mysql-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mysql.private_ip]
#}
#resource "aws_instance" "redis" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type =var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = {
#    Name = "redis"
#  }
#}
#
#resource "aws_route53_record" "redis" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "redis-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.redis.private_ip]
#}
#
#resource "aws_instance" "shipping" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type =var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = {
#    Name = "shipping"
#  }
#}
#resource "aws_route53_record" "shipping" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "shipping-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.shipping.private_ip]
#}
#resource "aws_instance" "rabbitmq" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type =var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = {
#    Name = "rabbitmq"
#  }
#}
#resource "aws_route53_record" "rabbitmq" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "rabbitmq-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.rabbitmq.private_ip]
#}
#resource "aws_instance" "payment" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type =var.instance_type
#  vpc_security_group_ids = [ data.aws_security_group.allow-all.id ]
#  tags = {
#    Name = "payment"
#  }
#}
#resource "aws_route53_record" "payment" {
#  zone_id = "Z01900082F7LR70JYHJFY"
#  name    = "payment-dev.bhaskar77.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.payment.private_ip]
#}
#
#
#
