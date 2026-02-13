data "aws_kms_alias" "s3kmskey" {
  name = "alias/myKmsKey"
}

resource "aws_codepipeline" "codepipeline" {
  name = var.pipeline_name
  role_arn = var.codepipeline_iam_role_arn

  artifact_store {
    location = var.codepipeline_bucket
    type = "S3"

    encryption_key {
    id = data.aws_kms_alias.s3kmskey.arn 
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