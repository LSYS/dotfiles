#!/bin/bash
# Install wslutils
sudo apt install gnupg2 apt-transport-https -y
wget -O - https://pkg.wslutiliti.es/public.key | sudo tee -a /etc/apt/trusted.gpg.d/wslu.asc

# Debian 10
echo "deb https://pkg.wslutiliti.es/debian buster main" | sudo tee -a /etc/apt/sources.list
# Debian 11
echo "deb https://pkg.wslutiliti.es/debian bullseye main" | sudo tee -a /etc/apt/sources.list

sudo apt update
sudo apt install wslu -y


# List of apps to install
apps=(
  # utilities
  build-essential
  procps
  curl
  file
  unzip
  wget
  pv
  bsdmainutils
  graphviz
  # cli
  tree
  exa
  shellcheck
  # dev
  make
  git
  graphviz
  texlive-full
  # knownfailure
  invalidpackagename
)

# List of apps that fail to install
failed=()

# Loop through the list of apps
for app in "${apps[@]}"; do
  # Check if the app is already installed
  if dpkg -s "$app" >/dev/null 2>&1; then
    echo "$app is already installed"
  else
    # Install the app using apt-get
    echo "Installing $app..."
    if sudo apt-get install -y "$app"; then
      echo "$app installed successfully"
    else
      echo "$app failed to install"
      failed+=("$app")
    fi
  fi
done

# Print list of failed apps
echo "-----------------------------------------------------------------------"
if [ ${#failed[@]} -gt 0 ]; then
  echo "The following apps failed to install:"
  printf '%s\n' "${failed[@]}"
  echo "Consider using brew to install these packages"
fi


