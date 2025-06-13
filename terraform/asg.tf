resource "aws_autoscaling_group" "php_asg" {
  name                 = "php-asg"
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = [
    aws_subnet.public_subnet.id,
    aws_subnet.public_subnet_2.id
  ]

  launch_template {
    id      = aws_launch_template.php_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.php_tg.arn]
  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "php-app-instance"
    propagate_at_launch = true
  }

  depends_on = [
    aws_launch_template.php_lt,
    aws_security_group.ec2_sg,
    aws_lb_target_group.php_tg
  ]
}
