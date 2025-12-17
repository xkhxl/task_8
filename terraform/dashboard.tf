resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
  dashboard_name = "akhil-strapi-ecs-dashboard"

  dashboard_body = jsonencode({
    widgets = [

      # -------------------------------
      # Widget 1: CPU & Memory
      # -------------------------------
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          region = var.aws_region
          title  = "ECS CPU & Memory Utilization"
          stat   = "Average"
          period = 60

          metrics = [
            [
              "AWS/ECS",
              "CPUUtilization",
              "ClusterName",
              aws_ecs_cluster.strapi.name,
              "ServiceName",
              aws_ecs_service.strapi.name
            ],
            [
              "AWS/ECS",
              "MemoryUtilization",
              "ClusterName",
              aws_ecs_cluster.strapi.name,
              "ServiceName",
              aws_ecs_service.strapi.name
            ]
          ]

          annotations = {
            horizontal = []
          }
        }
      },

      # -------------------------------
      # Widget 2: Running Task Count
      # -------------------------------
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          region = var.aws_region
          title  = "Running Task Count"
          stat   = "Average"
          period = 60

          metrics = [
            [
              "AWS/ECS",
              "RunningTaskCount",
              "ClusterName",
              aws_ecs_cluster.strapi.name,
              "ServiceName",
              aws_ecs_service.strapi.name
            ]
          ]

          annotations = {
            horizontal = []
          }
        }
      },

      # -------------------------------
      # Widget 3: Network In / Out
      # -------------------------------
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 24
        height = 6

        properties = {
          region = var.aws_region
          title  = "Network In / Out"
          stat   = "Average"
          period = 60

          metrics = [
            [
              "AWS/ECS",
              "NetworkRxBytes",
              "ClusterName",
              aws_ecs_cluster.strapi.name,
              "ServiceName",
              aws_ecs_service.strapi.name
            ],
            [
              "AWS/ECS",
              "NetworkTxBytes",
              "ClusterName",
              aws_ecs_cluster.strapi.name,
              "ServiceName",
              aws_ecs_service.strapi.name
            ]
          ]

          annotations = {
            horizontal = []
          }
        }
      }
    ]
  })
}
