variable "ecr_repo_name" {
  description = "ECR repository name"
  type = string
}

variable "encryption_type" {
  description = "repo encryption type"
  type = string  # "AES256" "KMS" "KMS_DSSE"
}