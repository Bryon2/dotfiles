#!/bin/bash

# 1. Check if running as root
if [[ "$EUID" -ne 0 ]]; then
  echo "This script must be run as root. Try again with 'sudo'."
  exit 1
fi

# 2. Check if apt is available
if ! command -v apt &> /dev/null; then
  echo "This script requires the APT package manager. 'apt' was not found."
  exit 1
fi

# 3. Prompt user to select software
echo "Choose software to install:"
echo "1) Singularity"
echo "2) Ansible"
echo "3) Anaconda"
echo "4) CUDA"
read -p "Enter the number (1-4): " CHOICE

case $CHOICE in
  1)
    SOFTWARE="singularity-container"
    TEST_CMD="singularity --version"
    ;;
  2)
    SOFTWARE="ansible"
    TEST_CMD="ansible --version"
    ;;
  3)
    SOFTWARE="anaconda"
    TEST_CMD="anaconda --version"
    ;;
  4)
    SOFTWARE="nvidia-cuda-toolkit"
    TEST_CMD="nvcc --version"
    ;;
  *)
    echo "Invalid selection. Exiting."
    exit 1
    ;;
esac

INSTALL_CMD="sudo apt install -y $SOFTWARE"

# 4. Prompt user about what will be installed
echo "This script will install: $SOFTWARE (using apt)"
read -p "Proceed with installation? (y/n): " CONFIRM

if [[ "$CONFIRM" != "y" ]]; then
  echo "Installation canceled by user."
  exit 1
fi

# 5. Check if the command name is already available
if command -v $(echo $TEST_CMD | awk '{print $1}') &> /dev/null; then
  echo "Conflict detected: '$(echo $TEST_CMD | awk '{print $1}')' is already installed."
  echo "To avoid unexpected behavior, the script will now exit."
  exit 1
fi

# 6. Update package list and install silently
echo "Updating package list..."
apt update -y &> /dev/null

echo "Installing $SOFTWARE..."
$INSTALL_CMD &> /dev/null

# 7. Confirm installation
if command -v $(echo $TEST_CMD | awk '{print $1}') &> /dev/null; then
  echo "Installation complete!"
  echo "Try it by running: $TEST_CMD"
else
  echo ":( Something went wrong. '$SOFTWARE' was not found after installation."
fi
