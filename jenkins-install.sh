# Here is a simple bash script that automates the installation of Jenkins on a Linux system using wget to download the Jenkins package and then installing it using the package manager:

#!/bin/bash

# Update the package list
if (which jenkins)
then
   echo "Jenkins already installed"
else
   echo "installing jenkins"
   sudo apt update
fi

if (which curl)
then 
   echo "curl is already installed"
else
   echo "Installing curl"
   sudo apt install curl -y
fi

# Install Java if not already installed
if (which java)
then 
  echo "Java already installed"
else
  echo "installing java"
  sudo apt install -y default-jre
fi

# Download the Jenkins Debian package
if (which jenkins)
then 
   echo " Jenkins installed"
else
   echo "Java install was unsuccesful, moving on to the jenkins install"
   wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add - sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
fi

# Update the package list again
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins service to start on system boot
sudo systemctl enable jenkins

# Output the initial admin password
echo "Initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

# You can save this script in a file (e.g., jenkins-install.sh) and then make it executable using the following command:
# chmod +x install-jenkins.sh
# bash jenkins-install



