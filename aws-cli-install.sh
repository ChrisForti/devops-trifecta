# Here is a simple bash script that automates the installation of the AWS Command Line Interface (CLI) on a Linux system using pip, which is the Python package manager:

#!/bin/bash

# Update the package list
sudo apt update
if (apt-cache show awscli)
then
  echo "Running awscli's latest"
else
  echo "Updating the latest awscli"
  sudo apt update
fi

# Install Python and pip if not already installed
if ( which python)
then
  echo "python already installed"
else
  echo "Installing python, and pip"
  sudo apt install -y python3 python3-pip

# Install the AWS CLI using pip
if ()
then
  echo " AWS cli already installed"
else
  echo "Installing AWS cli"
  pip3 install awscli --upgrade --user

# Add the AWS CLI executable to the system path
echo "export PATH=\$PATH:~/.local/bin" >> ~/.bashrc
source ~/.bashrc

# Verify the installation
aws --version
```

# You can save this script in a file (e.g., install-aws-cli.sh) and then make it executable using the following command:
# chmod +x install-aws-cli.sh
# bash install-aws-cli.sh
