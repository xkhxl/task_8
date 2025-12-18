resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "akhil-strapi-ecs-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        width = 12
        height = 6
        properties = {
          region = var.aws_region
          title  = "CPU & Memory"
          metrics = [
            ["AWS/ECS", "CPUUtilization", "ClusterName", aws_ecs_cluster.strapi.name, "ServiceName", aws_ecs_service.strapi.name],
            ["AWS/ECS", "MemoryUtilization", "ClusterName", aws_ecs_cluster.strapi.name, "ServiceName", aws_ecs_service.strapi.name]
          ]
        }
      }
    ]
  })
}
