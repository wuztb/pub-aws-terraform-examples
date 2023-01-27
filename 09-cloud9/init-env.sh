# Create the Cloud9 environment
aws cloud9 create-environment-ec2 \
  --name MyCloud9Environment \
  --instance-type t2.micro \

# Get the environment ID of the Cloud9 environment
environment_id=$(aws cloud9 list-environments \
  --query 'Environments[?Name==`MyCloud9Environment`].Id' \
  --output text)

environment_id=$(aws cloud9 list-environments \
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
