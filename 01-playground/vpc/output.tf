output subnet-public-id {
  value = aws_subnet.subnet-public-01.id
}

output secgroup-id {
  value = aws_security_group.secgroup-01.id
}

