resource "aws_cloud9_environment_ec2" "cloud9" {
  name          = "example-env"
  instance_type = "t2.small"
  # how to do the line below to install kubectl?
  # setup-cloud9-script = "setup-cloud9.sh"
}

output "cloud9_url" {
  value = "https://${var.region}.console.aws.amazon.com/cloud9/ide/${aws_cloud9_environment_ec2.example.id}"
}