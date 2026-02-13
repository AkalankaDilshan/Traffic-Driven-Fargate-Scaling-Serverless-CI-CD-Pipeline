output "bucket_name" {
  value = aws_s3_bucket.ecr_pipeline_artifacts_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.ecr_pipeline_artifacts_bucket.arn
}
 output "bucket_id" {
   value = aws_s3_bucket.ecr_pipeline_artifacts_bucket.id
 }

 