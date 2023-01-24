
module "instance01" {
    source = "./ec2"
    region = "us-east-1"
    name = "Web Server us-east"
}

module "instance02" {
    source = "./ec2"
    region = "us-west-2"
    name = "Web Server us-west"
}