#!/bin/bash

# Update the package list
if (which awscli)
then
  echo "Running awscli's latest"
else
  echo "Updating the latest awscli"
  sudo apt update
fi

# Install Python and pip if not already installed
if (test -d awscliv2.zip)
then
  echo "awscli already installed"
else
  echo "downloading zip installer"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

fi

# A tool to unzip should be installed
if (which unzip)
then
   echo "Unzip already installed"
else
   echo "Installing unzip"
   sudo apt install unzip -y
fi

# Install the AWS CLI using pip
if (aws --version)
then
  echo " AWS cli already installed"
else
  echo "Unzipping installer"
  unzip awscliv2.zip
fi

# Add the AWS CLI executable to the system path
if (aws --version) 
then
    echo "Aws-cli is installed"
else
   echo "Installing aws-cli"
   sudo ./aws/install --bin-dir /usr/local/bin/aws --install-dir /usr/local/aws-cli/v2/current/bin/aws --update
fi

# Verify the installation
aws --version
```

# You can save this script in a file (e.g., install-aws-cli.sh) and then make it executable using the following command:
# chmod +x install-aws-cli.sh
# bash install-aws-cli.sh
