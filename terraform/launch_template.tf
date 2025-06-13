resource "aws_launch_template" "php_lt" {
  name_prefix   = "php-app-lt-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "main-account" # Optional, if you want SSH access

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  user_data = base64encode(file("${path.module}/user_data.sh"))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "php-app-instance"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
