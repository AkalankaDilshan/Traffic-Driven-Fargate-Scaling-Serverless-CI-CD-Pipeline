resource "aws_kms_key" "s3_key" {
  description             = "KMS key for CodePipeline S3 bucket"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

# Create alias for the key
resource "aws_kms_alias" "s3_key_alias" {
  name          = "alias/myKmsKey"
  target_key_id = aws_kms_key.s3_key.key_id
}

# Then reference it in your data source
data "aws_kms_alias" "s3kmskey" {
  name = aws_kms_alias.s3_key_alias.name
  depends_on = [aws_kms_alias.s3_key_alias]
}

resource "aws_codepipeline" "codepipeline" {
  name = var.pipeline_name
  role_arn = var.codepipeline_iam_role_arn

  artifact_store {
    location = var.codepipeline_bucket
    type = "S3"

    encryption_key {
    id = data.aws_kms_alias.s3kmskey.target_key_arn 
    type = "KMS"
   }
  }
 
 stage {
   name = "Source"

   action {
     name = "Source"
     category = "Source"
     owner = "AWS"
     provider = "CodeStarSourceConnection"
     version = "1"
     output_artifacts = ["source_output"]

     configuration = {
      ConnectionArn = var.codestarconnections_connection_arn
      FullRepositoryId = var.repository_id # Format: "owner/repo-name"
      BranchName = "main"
     }
   }
 }

 stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "ECR"
      input_artifacts  = ["source_output"]
      version          = "1"

      configuration = {
        RepositoryName = var.ecr_repository_name
        #ImageTag       = var.image_tag # optional
        #DockerfilePath = var.dockerfile_path # optional, defaults to "Dockerfile" in root
        Region         = var.aws_region
      }
    }
  }
  
}