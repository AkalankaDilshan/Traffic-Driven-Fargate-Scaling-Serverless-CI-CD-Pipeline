variable "ecs_cluster_sg_name" {
  description = "cluster security group name"
  type = string
}

variable "vpc_id" {
  description = "production vpc id"
  type = string
}

variable "alb_sg_id" {
  description = "ALB sg id"
  type = string
}