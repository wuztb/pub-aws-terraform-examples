



sudo curl --silent --location -o /usr/local/bin/kubectl \
   https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.5/2022-01-21/bin/linux/amd64/kubectl

sudo chmod +x /usr/local/bin/kubectl


curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash