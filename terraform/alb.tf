resource "aws_lb" "php_alb" {
  name               = "php-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id]
}

resource "aws_lb_target_group" "php_tg" {
  name     = "php-app-tg"
  port     = 8080 # 🔧 Change if your app uses other port behind ALB
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    port                = "8080"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "php_listener" {
  load_balancer_arn = aws_lb.php_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.php_tg.arn
  }
}