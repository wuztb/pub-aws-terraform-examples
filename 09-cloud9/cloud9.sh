#!/bin/bash
# run Terraform to launch Cloud9 environment and attach the IAM instance profile. 

# install terraform
echo "Installing Terraform"
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# Run Terraform
terraform init
terraform apply -auto-approve

echo "Cloud9 is ready, use the URL below to access it"
terraform output cloud9_ide