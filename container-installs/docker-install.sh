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
if (test -f /etc/apt/keyrings/docker.asc )
then
  echo "The Docker GPG key already exists"
else
  echo "The Docker GPG key does not exist. Downloading it"
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
fi

 
# setting permissions 
if (test -d /etc/bin/keyrings/docker.asc)
then
  echo "gpg keyring already configured"
else
  echo "Setting permissions for gpg keyring"
  sudo chmod a+r /etc/apt/keyrings/docker.asc
fi

# Add the repository to Apt sources:
if (stat /etc/apt/sources.list.d/docker.list)
then
   echo 'Repository already exists at /etc/apt/sources.list.d/docker.list'
else
   echo 'Repository not found. Adding repository.'
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

# Check cache for repo
if (apt-cache search docker -ce | grep -q "docker-ce")
then
    echo "Docker repository already exists in the cache."
else
    echo "Updating apt cache."
    sudo apt update
fi

# install docker-ce
if (dpkg -l | grep -q docker-ce)
then
  echo "docker-ce already installed"
else
  echo "Installing docker-ce"
  sudo apt install -y docker-ce
fi

# install docker-ce-cli
if (dpkg -l | grep -q docker-ce-cli)
then
  echo "docker-ce-cli already installed"
else
  echo "Installing docker-ce-cli"
  sudo apt install -y docker-ce-cli
fi

# removing conflicting pkgs
if (dpkg -l | grep containerd)
then
  echo "Removing conflicting containerd package"
  sudo apt remove containerd
fi

# install containerd.io
if (dpkg -l | grep -q containerd.io)
then
  echo "containerd.io already installed"
else
  echo "Installing containerd.io"
  sudo apt install -y containerd.io
fi

# install docker-buildx-plugin
if (dpkg -l | grep -q docker-buildx-plugin)
then
  echo "docker-buildx-plugin already installed"
else
  echo "Installing docker-buildx-plugin"
  sudo apt install -y docker-buildx-plugin
fi

# install docker-compose-plugin
if (dpkg -l | grep -q docker-compose-plugin)
then
  echo "docker-compose-plugin already installed"
else
  echo "Installing docker-compose-plugin"
  sudo apt install -y docker-compose-plugin
fi





