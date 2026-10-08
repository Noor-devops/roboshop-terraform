resource "aws_lb" "backend_alb" {
  name               = "${local.common_name}-backend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids # Must be at least two private subnets

  enable_deletion_protection = true

  tags = merge(
    {
      Name = "${local.common_name}-backend-alb"
    },
    local.common_tags
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

   default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html" # Options: text/plain, text/css, text/html, application/javascript, application/json
      message_body = "<h1> Hi, Iam from Http backend ALB</h1>"
      status_code  = "200"        # Any valid HTTP response code (2XX, 4XX, 5XX)
    }
  }
}

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.nirfaws.online" # *.backend-alb-dev.nirfaws.online
  type    = "A"

  alias {
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
  allow_overwrite = true
}
