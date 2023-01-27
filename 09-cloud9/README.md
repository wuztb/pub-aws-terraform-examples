https://github.com/aws-samples/aft-workshop-sample/tree/aft-cloud9

https://controltower.aws-management.tools/automation/aft_setup/

At the moment still only cloud9.sh with terraform working.
1) chmod +x cloud9sh
2) ./cloud9.sh
3) Open Cloud9 manually and run the setup-cloud9sh commands


aws --version
aws sts get-caller-identity
kubectl version
aws eks update-kubeconfig --region us-east-1 --name education-eks-2Ub2zOiH

 ==== Archive ===== 
aws eks --region region update-kubeconfig --name cluster_name


aws cloud9 list-environments does not include Environments[name]
environment_id=$(aws cloud9 list-environments \
  --query 'Environments[?Name==`MyCloud9Environment`].Id' \
  --output text)


Create cloud 9 enviornment create enviornment plus instance no need to create the instane first
  # Create an EC2 instance to host the Cloud9 environment
aws ec2 run-instances \
  --image-id ami-0ac019f4fcb7cb7e6 \
  --instance-type t2.micro \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cloud9}]'

# Get the ID of the EC2 instance
instance_id=$(aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=cloud9" \
  --query 'Reservations[].Instances[].InstanceId' \
  --output text)



  # https://www.eksworkshop.com/020_prerequisites/k8stools/

# increase diskspace did not work
pip3 install --user --upgrade boto3
export instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
python -c "import boto3
import os
from botocore.exceptions import ClientError 
ec2 = boto3.client('ec2')
volume_info = ec2.describe_volumes(
    Filters=[
        {
            'Name': 'attachment.instance-id',
            'Values': [
                os.getenv('instance_id')
            ]
        }
    ]
)
volume_id = volume_info['Volumes'][0]['VolumeId']
try:
    resize = ec2.modify_volume(    
            VolumeId=volume_id,    
            Size=30
    )
    print(resize)
except ClientError as e:
    if e.response['Error']['Code'] == 'InvalidParameterValue':
        print('ERROR MESSAGE: {}'.format(e))"
if [ $? -eq 0 ]; then
    sudo reboot
fi
