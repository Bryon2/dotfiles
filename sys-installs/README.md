# Task 3 
### Package installs
1. Package: `Singularity, Ansible, Anaconda, CUDA`

This folder contains a script designed to assist users with safely installing software using the `apt` package manager on Debian-based systems. The script ensures proper system permissions, checks for command conflicts, and installs software non-interactively to streamline system setup.

## What the Script Does

- **Permission Check:** Verifies the script is run with root privileges (EUID=0). If not, it exits and instructs the user to use `sudo`.
- **Package Manager Check:** Confirms `apt` is available on the system. If not, it exits with an appropriate message.
- **User Confirmation:** Prompts the user with a summary of what will be installed and requires `y/n` input to proceed.
- **Command Conflict Check:** Checks if a command with the same name already exists in the system to prevent overwriting or unintended behavior.
- **Silent Installation:** Uses `sudo apt install -y` to install the selected software without further prompts.
- **Post-Install Message:** Informs the user that the installation is complete and suggests a command to verify or use the software.

## Usage

1. Clone or download this folder to your local system.
2. Make the script executable:
   ```bash
   chmod +x install_ansible.sh

This script was writen with the help of ChatGPT with the prompt:
```
I need a script that installs Ansible that also:
- Check if running as root (EUID=0); exit with a message if not.
- Ensure apt package manager is available; exit with a message if not.
- Inform the user of the software to be installed; prompt for y/n to proceed or exit.
- Check if the software name/command already exists to avoid conflicts; exit if a conflict is found.
- Silently install the software using sudo apt install -y.
- Notify the user when installation is complete and provide a sample command to run it.
```

