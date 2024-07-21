#!/bin/bash

# Update the package list
sudo apt update

# Install the dependencies for Ansible
sudo apt install -y software-properties-common

# Add the Ansible PPA
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

# Verify the installation
ansible --version
```

# You can save this script in a file (e.g., install-ansible.sh) and then make it executable using the following command:
# chmod +x install-ansible.sh
# bash install-ansible.sh

