# Configure the AWS provider
provider "aws" {
  region = var.region
}

variable "amis" {
  default = { 
     "us-east-1" = {
        "ami" = "ami-0b5eea76982371e91"
      },
      # Oregon for cloud guru playground
     "us-west-2" = {
        "ami" = "ami-0ceecbb0f30a902a6"
      },
      # Ireland for isengard
      "eu-west-1" = {
        "ami" = "ami-0fe0b2cf0e1f25c8a"
      }
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
    ami           = var.amis[var.region].ami
    instance_type = "t2.micro"
    tags = {
        Name = var.name
    }
}