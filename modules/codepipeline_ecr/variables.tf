variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

# variable "image_tag" {
#   description = "Docker image tag (optional, defaults to 'latest')"
#   type        = string
#   default     = "latest"
# }

# variable "dockerfile_path" {
#   description = "Path to Dockerfile (optional)"
#   type        = string
#   default     = "Dockerfile"
# }

variable "aws_region" {
  description = "AWS region for ECR"
  type        = string
}

variable "pipeline_name" {
  description = "code pipeline name"
  type = string
}

variable "codepipeline_iam_role_arn" {
  description = "iam role arn"
  type = string
}

variable "codepipeline_bucket" {
  description = "source artifact bucket"
  type = string
}

variable "codestarconnections_connection_arn" {
  description = "github connector arn"
  type = string
}

variable "repository_id" {
  description = "Full repository ID in format owner/repository-name"
  type        = string
  #default     = "mycompany/my-application"  # Replace with your actual repo
}