variable "iam_role_name" {
  description = "name for iam role"
  type = string
}

variable "codepipeline_artifacts_bucket_arn" {
  description = "s3 artifacts bucket arn"
  type = string
}

# aws_codestarconnections_connection.example.arn
# meken thamai Github ek connect wenne
variable "codestarconnections_arn" {
  description = "aws_codestarconnections_connection arn"
  type = string
}