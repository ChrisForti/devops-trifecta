#!/bin/bash


# git should be installed
if ( which git )
then 
  echo "git already installed"
else 
  echo "installing git"
  sudo apt install git -y
fi


# nano should be installed
if ( which nano )
then
  echo "nano already installed"
else
  echo "installing nano"
  sudo apt install nano -y
fi


# snap should be installed
if ( which snap )
then
  echo "snap already installed"
else
  echo "installing snap"
  sudo apt install -y snapd 
fi


# multipass should be installed
if  ( which multipass )
then
  echo "multipass already installed"
else
  echo "installing multipass" 
  sudo snap install multipass
fi

# ssh keys should exist
if [ -f "./id_ed25519" ]
then
  echo "trifecta ssh key exists"
else
  echo "creating ssh keys for trifecta"
  ssh-keygen -f ./id_ed25519 -t ed25519 -N ''
fi

# cloud-init.yaml should exist
if [ -f cloud-init.yaml ] 
then
  echo -e "\n==== Cloud-init.yaml present ====\n"
else
  echo -e "\n==== Creating cloud-init.yaml ====\n"
  cat <<- EOF > cloud-init.yaml
users:
  - default
  - name: $USER
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - $(cat id_ed25519.pub)
EOF
fi

# starting up an ubuntu vm
if ( multipass info trifecta | grep Running )
then 
  echo "trifecta vm is running"
else 
  echo "launching a ubuntu vm named trifecta"
  multipass launch --name trifecta --cloud-init cloud-init.yaml
fi

# copies webserver.sh to VM
scp -i ./id_ed25519 -o StrictHostKeyChecking=no ./webserver-builds/nginx.sh ./virtualization-installs/ansible-install.sh ./virtualization-installs/jenkins-install.sh ./virtualization-installs/aws-cli-install.sh ./containerization-installs/docker-install.sh $USER@$(multipass info trifecta | grep IPv4 | awk '{ print $2 }'):~/

# ssh into trifecta VM
ssh -o StrictHostKeyChecking=no -i ./id_ed25519 "$(whoami | cut -d '\' -f2)@$(multipass info trifecta | grep IPv4 | awk '{ print $2 }')" 

# The commands below utilize multipass exec to manipulate the vm from another terminal. this is just here for notes and testing
# zsh create-vm.sh && multipass exec trifecta -- sudo apt update && multipass exec trifecta -- sudo apt install -y nginx &&  multipass exec trifecta -- curl localhost && multipass info trifecta
