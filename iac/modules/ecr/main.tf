resource "aws_ecr_repository" "banking_app" {

 name = "${var.project_name}-${var.environment}-app"  

 image_tag_mutability = "IMMUTABLE"

 image_scanning_configuration {
   
   scan_on_push = true

 }

 encryption_configuration {
   
   encryption_type = "AES256"

 }

 tags = {
   
   Name = "${var.project_name}-${var.environment}-ecr" 

 }

}

resource "aws_ecr_lifecycle_policy" "banking_app" {

  repository = aws_ecr_repository.banking_app.name

  policy = jsonencode({

    rules = [

      {

        rulePriority = 1

        description = "Keep last 10 images"

        selection = {
            
            tagStatus = "any"

            countType = "imageCountMoreThan"

            countNumber = 10

        }

        action = {

            type = "expire"

        }

      }  
    ]
  })
}

data "aws_iam_policy_document" "ecs_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# resource "aws_iam_role" "ecr_execution_role" {
#   name               = "devops1988-dev-ecr-execution-role"
#   assume_role_policy = data.aws_iam_policy_document.ecs_assume_role.json

#   tags = {
#     Name = "devops1988-dev-ecr-execution-role"
#   }
# }


resource "aws_iam_role" "ecr_execution_role" {
  name               = "${var.project_name}-${var.environment}-role" 

  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role.json
  
  tags = {
    Name = "${var.project_name}-${var.environment}-roles"
  }
}

