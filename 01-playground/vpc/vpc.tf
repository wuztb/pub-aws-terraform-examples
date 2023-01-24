# Configure the AWS provider
provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc-01" {
    cidr_block = "10.0.0.0/20"
    enable_dns_support = true #gives you an internal domain name
    enable_dns_hostnames = true #gives you an internal host name
    tags = {
        Name = "vpc-01"
    }
}

resource "aws_subnet" "subnet-public-01" {
    vpc_id = "${aws_vpc.vpc-01.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true //it makes this a public subnet
    tags = {
        Name = "subnet-public-1"
    }
}

resource "aws_internet_gateway" "igw-01" {
    vpc_id = "${aws_vpc.vpc-01.id}"
    tags = {
        Name = "igw-01"
    }
}

resource "aws_route_table" "rt-public" {
    vpc_id = "${aws_vpc.vpc-01.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.igw-01.id}" 
    }
    
    tags = {
        Name = "rt-public"
    }
}

resource "aws_route_table_association" "rt-public-subnet-01"{
    subnet_id = "${aws_subnet.subnet-public-01.id}"
    route_table_id = "${aws_route_table.rt-public.id}"
}


resource "aws_security_group" "secgroup-01" {
    vpc_id = "${aws_vpc.vpc-01.id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        // This means, all ip address are allowed to ssh ! 
        // Do not do it in the production. 
        // Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }
    //If you do not add this rule, you can not reach the NGIX  
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "secgroup-01"
    }
}