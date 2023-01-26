# pub-aws-terraform-examples

# install terraform on a playground environment
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
mkdir ~/bin
ln -s ~/.tfenv/bin/* ~/bin/
tfenv install
tfenv use
terraform --version
