resource "aws_security_group" "ecs_cluster_sg" {
  name = var.ecs_cluster_sg_name
  description = "allow only ALB sg request"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [ var.alb_sg_id ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ecs_cluster_sg_name
  }


}