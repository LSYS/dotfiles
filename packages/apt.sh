#!/bin/bash

# List of apps to install
apps=(
  app1
  app2
  app3
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
if [ ${#failed[@]} -gt 0 ]; then
  echo "The following apps failed to install:"
  printf '%s\n' "${failed[@]}"
fi
