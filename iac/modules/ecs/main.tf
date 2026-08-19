#############################################
# ECS Cluster
#############################################

resource "aws_ecs_cluster" "banking_cluster" {

  name = "${var.project_name}-${var.environment}-cluster"

  setting {

    name = "containerInsights"

    value = "enabled"

  }

  tags = {

    Name = "${var.project_name}-${var.environment}-cluster"

    Environment = var.environment

  }

}

#############################################

# ECS Task Definition

#############################################

resource "aws_ecs_task_definition" "banking_task" {

  family = "${var.project_name}-${var.environment}"

  requires_compatibilities = ["FARGATE"]

  network_mode = "awsvpc"

  cpu = "256"

  memory = "512"

  execution_role_arn = var.execution_role_arn

  task_role_arn = var.task_role_arn

  container_definitions = jsonencode([

    {

      name = "banking-app"

      image = "${var.repository_url}:latest"

      essential = true

      portMappings = [

        {

          containerPort = 5000

          hostPort      = 5000

          protocol      = "tcp"

        }

      ]

      logConfiguration = {

        logDriver = "awslogs"

        options = {

          awslogs-group = var.log_group_name

          awslogs-region = "eu-north-1"

          awslogs-stream-prefix = "ecs"

        }

      }

      environment = [

        {

          name = "ENV"

          value = var.environment

        }

      ]

    }

  ])

}