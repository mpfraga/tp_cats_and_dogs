resource "aws_lb" "cats_alb" {
  name               = "cats-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.animals_albs_sg.id]
  subnets            = [aws_subnet.animals_subnet_a.id, aws_subnet.animals_subnet_b.id]

  enable_deletion_protection = false

  tags = {
    Name      = "Cats_Application_LB"
    Terraform = "True"
  }
}

resource "aws_lb_target_group" "cats_alb_tg" {
  name        = "cats-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.animals_vpc.id
  target_type = "ip"
  depends_on  = [aws_lb.cats_alb]

}


resource "aws_lb_listener" "cats_lb_l" {
  load_balancer_arn = aws_lb.cats_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cats_alb_tg.arn
  }
}

resource "aws_lb" "dogs_alb" {
  name               = "dogs-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.animals_albs_sg.id]
  subnets            = [aws_subnet.animals_subnet_a.id, aws_subnet.animals_subnet_b.id]

  enable_deletion_protection = false

  tags = {
    Name      = "Dogs_Application_LB"
    Terraform = "True"
  }
}

resource "aws_lb_target_group" "dogs_alb_tg" {
  name        = "dogs-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.animals_vpc.id
  target_type = "ip"
  depends_on  = [aws_lb.dogs_alb]

}


resource "aws_lb_listener" "dogs_lb_l" {
  load_balancer_arn = aws_lb.dogs_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dogs_alb_tg.arn
  }
}