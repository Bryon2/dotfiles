# Bryon's Dotfiles

Within this repo, there are 3 dotfiles
* [vim-config](./vim-config)
* [sys-installs](./sys-installs)
* [homefiles](./homefiles)

----
### vim-config
The propose of [vim-config](./vim-config) is to give customization to your vim application

### sys-installs 
This folder contains a script to install software using the apt package manager on Debian-based systems. The script ensures proper system permissions, checks for command conflicts, and installs software non-interactively to streamline system setup.

### homefiles 
This folder contains bash customization files for aliases and functions:
- hgrep = 'history | grep'
- ll = 'ls -lah'
- gs = 'git status'
- gp = 'git pull'
- gpu = 'git push'
- venv = 'source venv/bin/activate'
- update = 'sudo apt update && sudo apt upgrade -y'
