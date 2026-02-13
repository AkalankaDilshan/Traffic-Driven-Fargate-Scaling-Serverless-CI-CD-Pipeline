provider "aws" {
  region = var.region
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = "Production-vpc"
  cidr_block          = "192.168.0.0/16"
  availability_zone   = var.availability_zones
  public_subnet_cidr  = ["192.168.1.0/24", "192.168.2.0/24"]
  private_subnet_cidr = ["192.168.3.0/24", "192.168.4.0/24"]
}

module "github_connector" {
  source = "./modules/codestarconnections_connection"
}

module "artifact_s3_bucket" {
  source        = "./modules/s3_ecr_pipeline_artifacts"
  bucket_prefix = "ecr-pipeline-artifacts-bucket"
}
module "codepipeline_iam_role" {
  source                            = "./modules/iam_codepipeline_role"
  iam_role_name                     = "codepipeline-role"
  codestarconnections_arn           = module.github_connector.codestarconnections_connection_arn
  codepipeline_artifacts_bucket_arn = module.artifact_s3_bucket.bucket_arn
  depends_on                        = [module.artifact_s3_bucket, module.github_connector]
}

module "ecr_repository" {
  source        = "./modules/ecr_repository"
  ecr_repo_name = "zero-scaling-project-repo"
}

module "ecr_codepipeline" {
  source                             = "./modules/codepipeline_ecr"
  pipeline_name                      = "ECR-cicd-pipeline"
  aws_region                         = var.region
  codepipeline_iam_role_arn          = module.codepipeline_iam_role.iam_role_arn
  codestarconnections_connection_arn = module.github_connector.codestarconnections_connection_arn
  codepipeline_bucket                = module.artifact_s3_bucket.bucket_name
  ecr_repository_name                = module.ecr_repository.ecr_repo_name
  repository_id                      = "AkalankaDilshan/react_containerizing_cicd_project"
  depends_on                         = [module.artifact_s3_bucket, module.codepipeline_iam_role, module.ecr_repository, module.github_connector]
}