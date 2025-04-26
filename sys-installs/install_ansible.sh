#!/bin/bash

SOFTWARE="ansible"
INSTALL_CMD="sudo apt install -y $SOFTWARE"
TEST_CMD="ansible --version"

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

# 3. Prompt user about what will be installed
echo "This script will install: $SOFTWARE (using apt)"
read -p "Proceed with installation? (y/n): " CONFIRM

if [[ "$CONFIRM" != "y" ]]; then
  echo "Installation canceled by user."
  exit 1
fi

# 4. Check if the command name is already taken
if command -v "$SOFTWARE" &> /dev/null; then
  echo "Conflict detected: '$SOFTWARE' is already a command on this system."
  echo "To avoid unexpected behavior, the script will now exit."
  exit 1
fi

# 5. Update package list and install silently
echo "Updating package list..."
apt update -y &> /dev/null

echo "Installing $SOFTWARE..."
$INSTALL_CMD &> /dev/null

# 6. Confirm installation
if command -v "$SOFTWARE" &> /dev/null; then
  echo "Installation complete!"
  echo "Try it by running: $TEST_CMD"
else
  echo ":( Something went wrong. '$SOFTWARE' was not found after installation."
fi
