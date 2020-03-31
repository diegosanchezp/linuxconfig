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
declare -a programs=("neovim" #text editor
                     "nethogs" #Net top tool grouping bandwidth per process
                     "htop" #process viewer
            		     "gnome-control-center" #configure gnome settings
		                 "gnome-tweaks"
                     "zathura" #pdf reader
                     )

echo "The following programs will be installed"
for p in "${programs[@]}"
do
   echo "$p"
done

echo "Install programs (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
  for p in "${programs[@]}"
  do
     sudo apt install "$p"
  done

  # Move neovim configuration
  cp -r -i -t ~/.config 
  # === Install another programs, that can't simply be installed with sudo apt install ==== 

  # Youtube-dl
  sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl

  sudo chmod a+rx /usr/local/bin/youtube-dl

  # Install ffmpeg, this is needed to convert webm audio files to mp3
  sudo apt install ffmpeg

  # Move youtube-dl, zathura, nvim config
  cp -r -i -t ~/.config .config/youtube-dl .config/zathura .config/nvim

fi

# Install i3 window manager
echo "Install i3 window manager (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
	sudo apt install i3

  # Move i3 configuration 
  cp -r -i -t ~/.config .config/i3 .config/i3status
fi

