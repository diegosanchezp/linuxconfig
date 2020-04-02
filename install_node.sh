#!/bin/bash
# Check if globals variables exists
if [ -f "globals.sh" ]; then

  # Include global variables 
  . globals.sh

  if ! [ -x "$(command -v curl)" ]; then
    sudo apt install curl
  fi
  #https://github.com/nodesource/distributions/blob/master/README.md#deb

  echo "Installing nodejs"
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  sudo apt-get install -y nodejs

  # To Compile and install native addons from npm you may also need to
  # install build tools

  sudo apt-get install -y build-essential

  # create a directory for global installations: 
  mkdir -v $NODEPATH

  # Configure npm to use the new directory path:
  npm config set prefix $NODEPATH

  # Add this this on .profile [it should not be added before the next line]
  echo "export PATH=$NODEPATH/bin:$PATH" >> .profile

  # update system variables
  source ~/.profile

  echo "Installing pnpm package manager" 
  # https://pnpm.js.org/en/installation
  npx pnpm add -g pnpm

  echo "Upgrading pnpm"
  pnpm add -g pnpm

  echo "Install n [node version manager]"
  pnpm install -g n

else
  echo "Error: File globals.sh does not exists" 
fi
