variable "bucket_prefix" {
  description = "s3 bucket name"
  type = string
}

variable "environment" {
  description = "project env name"
  type = string
  default = "production"
}