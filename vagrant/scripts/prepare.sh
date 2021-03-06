#!/usr/bin/env bash

APTITUDE_FLAGS="--no-gui -y"
CURRENT_USER=$USER
DEVELOPMENT_DIRECTORY="$HOME/development"
FISH_SHELL_CONFIG_DIR="$HOME/.config/fish"
FISH_SHELL_CONFIG_DIR_FUNCTIONS="$FISH_SHELL_CONFIG_DIR/functions"

flag_a=

while getopts a: flag; do
  case $flag in
    a)
      flag_a="$OPTARG"
    ;;
  esac
done

# Get new/upgradable packages.
sudo aptitude $APTITUDE_FLAGS update

# We'll most likely need this later.
sudo aptitude $APTITUDE_FLAGS install build-essential

# Install NFS for the synced folders.
sudo aptitude $APTITUDE_FLAGS install nfs-common nfs-kernel-server portmap

# Get the "python-software-properties" package for the "apt-add-repository" command.
sudo aptitude $APTITUDE_FLAGS install python-software-properties

# Install "mosh" and "fish" shell.
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo add-apt-repository -y ppa:keithw/mosh
sudo aptitude $APTITUDE_FLAGS update
sudo aptitude $APTITUDE_FLAGS install fish mosh

# Yep, I did all that for this ;p .
if [ $flag_a = "fish" ]; then
  # Set up some default settings for "fish" shell.
  mkdir -p $FISH_SHELL_CONFIG_DIR
  cd $FISH_SHELL_CONFIG_DIR
  cp "/vagrant/templates$FISH_SHELL_CONFIG_DIR/config.fish" ./
  cd -

  # Set up a prompt for "fish" shell.
  mkdir -p $FISH_SHELL_CONFIG_DIR_FUNCTIONS
  cd $FISH_SHELL_CONFIG_DIR_FUNCTIONS
  cp "/vagrant/templates$FISH_SHELL_CONFIG_DIR_FUNCTIONS/fish_prompt.fish" ./
  cp "/vagrant/templates$FISH_SHELL_CONFIG_DIR_FUNCTIONS/gemdir.fish" ./
  cp "/vagrant/templates$FISH_SHELL_CONFIG_DIR_FUNCTIONS/rvm.fish" ./
  cd -

  # Set "fish" shell as the default shell.
  sudo chsh -s $(which fish) $CURRENT_USER
fi

mkdir -p $DEVELOPMENT_DIRECTORY/backend
mkdir -p $DEVELOPMENT_DIRECTORY/frontend