# pub-aws-terraform-examples
AWS Cloud Shell
git clone https://github.com/wuztb/pub-aws-terraform-examples.git
cd pub-aws-terraform-examples/09-cloud9
chmod +x cloud9.sh
./cloud9.sh

# Deprecated install terraform on a playground environment. Use now shell script to install terraform and cloud9
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
mkdir ~/bin
ln -s ~/.tfenv/bin/* ~/bin/
tfenv install
tfenv use
terraform --version
