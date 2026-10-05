# MongoDB allowing connections from catalogue on port 27017
resource "aws_security_group_rule" "mongodb-catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.catalogue_sg_id
  security_group_id = local.mongodb_sg_id
}
# MongoDB allowing connections from user on port 27017
resource "aws_security_group_rule" "mongodb-user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id = local.mongodb_sg_id
}
# MongoDB allowing connections from bastion on port 22
resource "aws_security_group_rule" "mongodb-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mongodb_sg_id
}
# Redis allowing connections from user on port 6379
resource "aws_security_group_rule" "redis-user" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id = local.redis_sg_id
}
# Redis allowing connections from cart on port 6379
resource "aws_security_group_rule" "redis-cart" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id = local.cart_sg_id
  security_group_id = local.redis_sg_id
}
# Redis allowing connections from bastion on port 22
resource "aws_security_group_rule" "redis-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.redis_sg_id
}
# MySQL allowing connections from shipping on port 3306
resource "aws_security_group_rule" "mysql-shipping" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = local.shipping_sg_id
  security_group_id = local.mysql_sg_id
}
# MySQL allowing connections from bastion on port 22
resource "aws_security_group_rule" "mysql-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mysql_sg_id
}
# RabbitMQ allowing connections from payment on port 5672
resource "aws_security_group_rule" "rabbitmq-payment" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  source_security_group_id = local.payment_sg_id
  security_group_id = local.rabbitmq_sg_id
}
# RabbitMQ allowing connections from bastion on port 22
resource "aws_security_group_rule" "rabbitmq-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.rabbitmq_sg_id
}
# Catalogue allowing connections from backend ALB on port 8080
resource "aws_security_group_rule" "catalogue-backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.catalogue_sg_id
}
# Catalogue allowing connections from bastion on port 22
resource "aws_security_group_rule" "catalogue-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.catalogue_sg_id
}
# user allowing connections from backend ALB on port 8080
resource "aws_security_group_rule" "user-backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.user_sg_id
}
# User allowing connections from bastion on port 22
resource "aws_security_group_rule" "user-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.user_sg_id
}
# Cart allowing connections from backend ALB on port 8080
resource "aws_security_group_rule" "cart-backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.cart_sg_id
}
# Cart allowing connections from bastion on port 22
resource "aws_security_group_rule" "cart-bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.cart_sg_id
}
# Shipping allowing connections from backend ALB on port 8080
resource "aws_security_group_rule" "shipping_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.shipping_sg_id
}
# Shipping allowing connections from bastion on port 22
resource "aws_security_group_rule" "shipping_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.shipping_sg_id
}
# Payment allowing connections from backend ALB on port 8080
resource "aws_security_group_rule" "payment_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.payment_sg_id
}
# Payment allowing connections from bastion on port 22
resource "aws_security_group_rule" "payment_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.payment_sg_id
}
# Backend ALB allowing connections from frontend on port 80
resource "aws_security_group_rule" "backend_alb_frontend" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.frontend_sg_id
  security_group_id = local.backend_alb_sg_id
}
# Backend ALB allowing connections from bastion on port 80
resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.backend_alb_sg_id
}
# Backend ALB allowing connections from VPN on port 80
resource "aws_security_group_rule" "backend_alb_vpn" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.vpn_sg_id
  security_group_id = local.backend_alb_sg_id
}
# Backend ALB allowing connections from catalogue on port 80
resource "aws_security_group_rule" "backend_alb_catalogue" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.catalogue_sg_id
  security_group_id = local.backend_alb_sg_id
}
# Backend ALB allowing connections from user on port 80
resource "aws_security_group_rule" "backend_alb_user" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.user_sg_id
  security_group_id = local.backend_alb_sg_id
}
# Backend ALB allowing connections from cart on port 80
resource "aws_security_group_rule" "backend_alb_cart" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.cart_sg_id
  security_group_id = local.backend_alb_sg_id
}
# Backend ALB allowing connections from shipping on port 80
resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.shipping_sg_id
  security_group_id = local.backend_alb_sg_id
}
# Backend ALB allowing connections from payment on port 80
resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.payment_sg_id
  security_group_id = local.backend_alb_sg_id
}

# Frontend ALB allowing connections from frontend on port 80
resource "aws_security_group_rule" "frontend_frontend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.frontend_alb_sg_id
  security_group_id = local.frontend_sg_id
}
# Frontend ALB allowing connections from bastion on port 80
resource "aws_security_group_rule" "frontend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.frontend_sg_id
}
# Frontend ALB allowing connections from https on port 443
resource "aws_security_group_rule" "frontend_alb_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.frontend_alb_sg_id
}
# Frontend ALB allowing connections from http on port 80
resource "aws_security_group_rule" "frontend_alb_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.frontend_alb_sg_id
}

# Bastion allowing connections from my public IP on port 22
resource "aws_security_group_rule" "bastion_my_public_ip" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  security_group_id = local.bastion_sg_id
} 