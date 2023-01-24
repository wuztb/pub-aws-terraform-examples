variable "region" {
  type        = string
  description = "The region"
}

variable "name" {
  type        = string
  description = "The name"
}

variable "subnet_id" {
  type        = string
  description = "The subnet id"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "The security group ids"
}