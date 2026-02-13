resource "aws_ecr_repository" "app_repo" {
  name = var.ecr_repo_name

  image_tag_mutability = "MUTABLE_WITH_EXCLUSION"

  image_tag_mutability_exclusion_filter {
    filter_type = "WILDCARD"
    filter      = "v*"
  }
  ## this mean we can overwrite latest,dev, or whatever tags but can't v* tags like v1.0.0 v1.3.0 likewhise

  encryption_configuration {
    encryption_type = var.encryption_type
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Enviroment = "Production"
  }
}