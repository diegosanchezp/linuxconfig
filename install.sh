#!/bin/bash

# chmod 755 install.sh

# Run updates
echo "Install updates (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
		echo Installing upgrades
		sudo apt-get update
		sudo apt-get
		dist-upgrade
fi

# Package installation

declare -a programs=("neovim" 
                     "nethogs"
                     "htop"
                     )

echo "The following programs will be installed"
for i in "${programs[@]}"
do
   echo "$i"
done

echo "Install programs (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
  for p in "${programs[@]}"
  do
     sudo apt install "$p"
  done
fi

# Install regolith
echo "Install regolith and it's configurations (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
  echo "Installing regolith"
  sudo add-apt-repository ppa:regolith-linux/release
  sudo apt install regolith-desktop
  # Append to .bashrc
  .bashrc >> ~/.bashrc
  echo "Copying regolith configurations"
  # Copy configurations
  cp -r -i .config/i3 .config/Xresources ~/.config/regolith
  cp -r -i .config/youtube-dl ~/.config
fi

#Install another programs
sudo pip install --upgrade youtube_dl
