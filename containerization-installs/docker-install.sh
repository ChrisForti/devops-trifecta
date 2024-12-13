# Update
if (which docker)
then
  echo "Running dockers latest"
else
  echo "Updating the latest docker"
  sudo apt update
fi

# Installing ca-certificates
if (test -d ca-certificates)
then
  echo "ca-certificates already installed"
else
  echo "Installing ca-certificates"
  sudo apt install -y ca-certificates
fi

# Installing curl
if (which curl)
then
  echo "curl already installed"
else
  echo "Installing curl"
  sudo apt install -y curl 
fi

# Creating a keyrings directory 
if (test -d /etc/bin/keyrings)
then
  echo "keyrings directory already exist"
else
  echo "Creating keyrings"
  sudo install -m 0755 -d /etc/apt/keyrings
fi

# Check if the keyrings directory exists & if not, create it
if [ -f /etc/apt/keyrings/docker.asc ]
then
  echo "The Docker GPG key already exists"
else
  echo "The Docker GPG key does not exist. Downloading it"
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
fi

# Check if the Docker GPG key exists & if not, install it
if [ -f /etc/apt/keyrings/docker.asc ]
then
  echo "The Docker GPG key already exists"
else
  echo "The Docker GPG key does not exist. Downloading it"
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
fi
 
# setting permissions 
if (-r /etc/apt/keyrings/docker.asc)
then
  echo "gpg keyring already configured"
else
  echo "Setting permissions for gpg keyring"
  sudo chmod a+r /etc/apt/keyrings/docker.asc
fi

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# install docker-ce
if (apt-cache show docker-ce)
then
  echo "docker-ce already installed"
else
  sudo apt install -y docker-ce
fi

# install docker-ce-cli
if (apt-cache show docker-ce-cli)
then
  echo "docker-ce already installed"
else
  sudo apt install -y docker-ce-cli
fi

# install containerd.io
if (apt-cache show containerd.io)
then
  echo "containerd.io already installed"
else
  sudo apt install -y containerd.io
fi

# install docker-buildx-plugin
if (apt-cache show docker-buildx-plugin)
then
  echo "docker-buildx-plugin already installed"
else
  sudo apt install -y docker-buildx-plugin
fi

# install docker-compose-plugin
if (apt-cache show docker-compose-plugin)
then
  echo "docker-compose-plugin already installed"
else
  sudo apt install -y docker-compose-plugin
fi

# Then install docker's latest
# if (which docker)
# then
#   echo "Docker already installed"
# else
#   echo "Installing docker"
#   sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# fi
