# Trifecta

This repository is designed to build a virtual machine and equip it with a variety of scripts, serving as a foundational infrastructure setup for various developer operations tools. It is structured to be scalable, accommodating different developer needs and environments. Currently, only the VM creation script for Darwin (macOS) has been tested.

1. from your mac run:
   `darwin-create-vm`
2. this script will palce you into the vm's shell
   `ls` will give you a list of completed install scripts.
   (more will be added as they are finished and tested)
3. from your **trifecta** shell run:

4. **container-installs**

- docker
  `bash docker-install.sh`

5. **webserver-installs**

- webserver
  `bash nginx.sh`

6. **virtualization-installs**

- jenkins
  `bash jenkins-install.sh`
  **(more will be added when completed)**
