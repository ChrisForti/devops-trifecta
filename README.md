# Trifecta

This repository will build a virtual machine, and load it with various scripts. That are meant to be a infrastructure starting point. For a multitude of developer operations tools. It is made so that it can be scaled to whatever the developer requires.  
(Currently only the darwin create vm script has been tested)

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
