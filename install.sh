#!/bin/bash

# chmod 755 install.sh

# ====== Run updates ======
echo "Install updates (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
		echo Installing upgrades
		sudo apt-get update
		sudo apt-get dist-upgrade
fi

# ====== Package installation ======
declare -a programs=("neovim" 
                     "nethogs"
                     "htop"
            		     "gnome-control-center"
		                 "gnome-tweaks"
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

# Install i3 window manager
echo "Install programs (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
	sudo apt install i3

  # Move i3 configuration 
  cp -r -i -t ~/.config .config/i3 .config/i3status
fi

# Move neovim configuration
cp -r -i -t ~/.config .config/nvim
# === Install another programs, that can't simply be installed with sudo apt install ==== 

# Youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl

sudo chmod a+rx /usr/local/bin/youtube-dl
# Move youtube-dl config
cp -r -i -t ~/.config .config/youtube-dl
