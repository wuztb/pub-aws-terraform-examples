# Create an EC2 instance to host the Cloud9 environment
aws ec2 run-instances \
  --image-id ami-0ac019f4fcb7cb7e6 \
  --instance-type t2.micro \

# Get the ID of the EC2 instance
instance_id=$(aws ec2 describe-instances \
  --query 'Reservations[].Instances[].InstanceId' \
  --output text)

# Create the Cloud9 environment
aws cloud9 create-environment-ec2 \
  --name MyCloud9Environment \
  --instance-type t2.micro \
  --instance-id $instance_id

# Get the environment ID of the Cloud9 environment
environment_id=$(aws cloud9 list-environments \
  --query 'Environments[?Name==`MyCloud9Environment`].Id' \
  --output text)

# Connect to the Cloud9 environment
aws cloud9 create-environment-ssh-connection \
  --environment-id $environment_id

# Install kubectl on the Cloud9 environment
aws cloud9 create-environment-ssh-session \
  --environment-id $environment_id \
  --command 'curl -LO "https://dl.k8s.io/release/`curl -L -s https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl"'

aws cloud9 create-environment-ssh-session \
  --environment-id $environment_id \
  --command 'chmod +x kubectl'

aws cloud9 create-environment-ssh-session \
  --environment-id $environment_id \
  --command 'sudo mv kubectl /usr/local/bin/'
