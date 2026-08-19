output "cluster_name" {

  value = aws_ecs_cluster.banking_cluster.name

}

output "cluster_arn" {

  value = aws_ecs_cluster.banking_cluster.arn

}

output "task_definition_arn" {

  description = "ARN of the ECS Task Definition"
  value = aws_ecs_task_definition.banking_task.arn

}
