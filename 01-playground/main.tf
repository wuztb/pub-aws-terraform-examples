
module "instance01" {
  source = "./ec2"
  region = "us-east-1"
}

module "instance02" {
  source = "./ec2"
  region = "eu-west-1"
}