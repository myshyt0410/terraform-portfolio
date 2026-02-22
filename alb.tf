# ALB本体
resource "aws_lb" "main" {
  name               = "terraform-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [
    aws_subnet.public-1a.id,
    aws_subnet.public-1c.id
  ]

  tags = {
    Name = "terraform-alb"
  }
}

# Target Group
resource "aws_lb_target_group" "main" {
  name     = "terraform-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

# Listener
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "web_1a" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_instance.ec2_1a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web_1c" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_instance.ec2_1c.id
  port             = 80
}