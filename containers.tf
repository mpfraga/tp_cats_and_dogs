
resource "aws_ecs_cluster" "animals_ecs_cluster" {
  name               = "animals_ecs_cluster"
  capacity_providers = ["FARGATE"]
}

resource "aws_ecs_task_definition" "cats_ecs_td" {
  family                   = "cats_ecs_td"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 4096
  network_mode             = "awsvpc"
  execution_role_arn       = "arn:aws:iam::026763445027:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name      = "cats_app"
      image     = var.docker_image_cats
      cpu       = 512
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]

    }
  ])
}


resource "aws_ecs_service" "cats_ecs_service" {
  name            = "cats_ecs_service"
  cluster         = aws_ecs_cluster.animals_ecs_cluster.id
  task_definition = aws_ecs_task_definition.cats_ecs_td.arn
  launch_type     = "FARGATE"
  desired_count   = 3
  network_configuration {
    subnets          = [aws_subnet.animals_subnet_a.id, aws_subnet.animals_subnet_b.id]
    security_groups  = [aws_security_group.animals_ecss_sg.id]
    assign_public_ip = true
  }


  load_balancer {
    target_group_arn = aws_lb_target_group.cats_alb_tg.arn
    container_name   = "cats_app"
    container_port   = 80
  }
  depends_on = [aws_lb.cats_alb]
}

resource "aws_ecs_task_definition" "dogs_ecs_td" {
  family                   = "dogs_ecs_td"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 4096
  network_mode             = "awsvpc"
  execution_role_arn       = "arn:aws:iam::026763445027:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name      = "dogs_app"
      image     = var.docker_image_dogs
      cpu       = 512
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]

    }
  ])
}


resource "aws_ecs_service" "dogs_ecs_service" {
  name            = "dogs_ecs_service"
  cluster         = aws_ecs_cluster.animals_ecs_cluster.id
  task_definition = aws_ecs_task_definition.dogs_ecs_td.arn
  launch_type     = "FARGATE"
  desired_count   = 3
  network_configuration {
    subnets          = [aws_subnet.animals_subnet_a.id, aws_subnet.animals_subnet_b.id]
    security_groups  = [aws_security_group.animals_ecss_sg.id]
    assign_public_ip = true
  }


  load_balancer {
    target_group_arn = aws_lb_target_group.dogs_alb_tg.arn
    container_name   = "dogs_app"
    container_port   = 80
  }
  depends_on = [aws_lb.dogs_alb]
}