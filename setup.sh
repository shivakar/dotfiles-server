#!/usr/bin/env bash

if [ "${PWD}" != "$HOME/bin" ]; then
    echo "PWD != $HOME/bin"
    echo "Please run the setup script from $HOME/bin"
    echo "Exiting..."
    exit
fi

if [ "$(uname)" == "Linux" ]; then
    echo -n "Run setup on a Linux machine? (yes/NO): "
else
    echo "Unknown OS - $(uname). Exiting..."
    exit 1
fi

REDHAT_RELEASE=$(cat /etc/redhat-release 2>1)
if [[ "$REDHAT_RELEASE" != "CentOS"* ]] && [[ "$REDHAT_RELEASE" != "Red Hat"* ]]; then
    echo "Unknown OS - Only CentOS/RHEL based systems are currently supported"
    exit 1
fi

echo "Starting setup..."
source scripts/functions.sh
source scripts/setup.linux.sh

# Setup symlinks to dotfiles
ln -sf ~/bin/bash/bashrc ~/.bashrc
ln -sf ~/bin/bash/bash_profile ~/.bash_profile
ln -sf ~/bin/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/bin/vim/vimrc ~/.vimrc
