variable "aws_region" {
  default = "us-east-1"
}

variable "image_uri" {
  description = "ECR image URI"
  type        = string
}

variable "execution_role_arn" {
  description = "Existing ECS execution role ARN"
  type        = string
}

variable "subnets" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}