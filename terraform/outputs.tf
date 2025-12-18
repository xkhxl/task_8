output "ecs_cluster_name" {
  value = aws_ecs_cluster.strapi.name
}

output "ecs_service_name" {
  value = aws_ecs_service.strapi.name
}

output "ecs_task_definition" {
  value = aws_ecs_task_definition.strapi.arn
}

output "container_image" {
  value = var.image_uri
}
