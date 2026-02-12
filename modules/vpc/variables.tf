variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for the public subnet"
}

variable "private_subnet_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for the private subnet"
}

variable "availability_zone" {
  type        = list(string)
  description = "List of availability zones"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}