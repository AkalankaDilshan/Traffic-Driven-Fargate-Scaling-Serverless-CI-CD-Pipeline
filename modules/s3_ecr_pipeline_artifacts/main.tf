resource "random_string" "bucket_suffix" {
  length = 6
  special = false
  upper = false
  numeric = false
}

resource "aws_s3_bucket" "ecr_pipeline_artifacts_bucket" {
  bucket = "${var.bucket_prefix}-${random_string.bucket_suffix.result}"
  tags = {
    Name        = var.bucket_prefix
    Environment = var.environment
  }
}

# Disable public access blocking for the bucket policy to work
resource "aws_s3_bucket_public_access_block" "ecr_bucket" {
  bucket = aws_s3_bucket.ecr_pipeline_artifacts_bucket.id

  block_public_acls       = true
  block_public_policy     = true  
  ignore_public_acls      = true
  restrict_public_buckets = true  
}
