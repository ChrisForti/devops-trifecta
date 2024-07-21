# Here is a simple bash script that automates the installation of Jenkins on a Linux system using wget to download the Jenkins package and then installing it using the package manager:

#!/bin/bash

# Update the package list
sudo apt update

# Install Java if not already installed
sudo apt install -y default-jre

# Download the Jenkins Debian package
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

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



