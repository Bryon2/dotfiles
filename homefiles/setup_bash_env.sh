#!/bin/bash

DOTFILES_DIR=~/dotfiles/homefiles
BACKUP_DIR=~/dotfiles_backup

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Backup existing .bashrc
if [ -f ~/.bashrc ]; then
    mv ~/.bashrc $BACKUP_DIR/bashrc_backup_$(date +%F_%T)
fi

# Symlink new .bashrc
ln -s $DOTFILES_DIR/.bash_aliases ~/.bash_aliases

# Append source command if not already present
if ! grep -q "source ~/.bash_aliases" ~/.bashrc; then
    echo "source ~/.bash_aliases" >> ~/.bashrc
fi

echo "Setup complete. Run 'source ~/.bashrc' or restart your terminal to apply changes."

#CREDIT: chatGPT: promt Create a script (setup_bash_env.sh) to:
#Move existing .bashrc
#Create a symbolic link from dotfiles/homefiles/.bash_aliases to ~/.bash_aliases
#Append source ~/.bash_aliases to .bashrc
#Notify users to reload their shell
