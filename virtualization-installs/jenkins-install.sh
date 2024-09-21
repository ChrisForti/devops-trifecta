#!/bin/bash
# For reference https://www.jenkins.io/doc/book/installing/linux/#debianubuntu

# Update the package list
if (which jenkins)
then
   echo "Jenkins already installed"
else
   echo "Updating pkg list"
   sudo apt update
fi

# Download the Jenkins Debian package
if (test -f /usr/share/keyrings/jenkins-keyring.asc)
then 
   echo "Jenkins Debian pkg exists"
else
  sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \ https://pkg.jenkins.io/debian/jenkins.io-2023.key
  echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \ https://pkg.jenkins.io/debian binary/ | sudo tee \ /etc/apt/sources.list.d/jenkins.list > /dev/null \ sudo apt-get update
fi

# Snap should be installed
if (which snap)
then 
   echo "snap already installed" 
else
   echo "Installing snap"
   sudo apt -y install snapd
fi

# Jenkins should be installed
if (jenkins --version)
then 
   echo "Jenkins installed"
else
   echo "Installing jenkins"
   sudo apt -y install jenkins  
fi

# openjdk should be installed
if (which openjdk)
then
   echo "openjdk already installed"
else
   echo " Installing openjdk"
   sudo snap install openjdk
fi

# Java should be installed
if (which java)
then 
  echo "Java already installed"
else
  echo "installing java"
  sudo apt -y install fontconfig openjdk-17-jre
fi

# Enable Jenkins service to start on system boot
# sudo systemctl enable jenkins

# # Start Jenkins service
# sudo systemctl start jenkins


# We are going to have to probably do a yml file to pass this password in.
# Output the initial admin password
# echo "Initial admin password:"
# sudo cat /var/lib/jenkins/secrets/initialAdminPassword


# You can save this script in a file (e.g., jenkins-install.sh) and then make it executable using the following command:
# chmod +x install-jenkins.sh
# bash jenkins-install



