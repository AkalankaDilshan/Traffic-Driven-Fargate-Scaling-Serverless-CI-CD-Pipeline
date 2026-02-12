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