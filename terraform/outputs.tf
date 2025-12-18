output "ecs_cluster_name" {
  value = aws_ecs_cluster.strapi.name
}

output "ecs_service_name" {
  value = aws_ecs_service.strapi.name
}

output "alb_dns_name" {
  value = aws_lb.strapi.dns_name
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.strapi.name
}
