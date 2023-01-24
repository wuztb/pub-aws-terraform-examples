module "vpc01" {
    source = "./vpc"
    region = "us-east-1"
}

module "instance01" {
    source = "./ec2"
    region = "us-east-1"
    name = "Web Server us-east"
    subnet_id = module.vpc01.subnet-public-01.id
    vpc_security_group_ids = [module.vpc01.secgroup-01.id]
}

module "vpc02" {
    source = "./vpc"
    region = "us-west-2"
}

module "instance02" {
    source = "./ec2"
    region = "us-west-2"
    name = "Web Server us-west"
    subnet_id = module.vpc02.subnet-public-01.id
    vpc_security_group_ids = [module.vpc02.secgroup-01.id]
}