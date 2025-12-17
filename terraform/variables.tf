variable "aws_region" {
  default = "ap-south-1"
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

variable "admin_jwt_secret" {
  type = string
}

variable "jwt_secret" {
  type = string
}

variable "app_keys" {
  type = string
}

variable "api_token_salt" {
  type = string
}

variable "transfer_token_salt" {
  type = string
}

variable "encryption_key" {
  type = string
}