#!/bin/bash

# ====== Program execution ====== 
# chmod 755 install.sh


# ====== Run updates ======
echo "Install updates (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
		echo "Installing upgrades"
		sudo apt-get update
		sudo apt-get dist-upgrade
fi

# ====== Package installation ======
declare -a programs=("nethogs" #Net top tool grouping bandwidth per process
                     "htop" #process viewer
                     "vlc" #video-player
            		     "gnome-control-center" #configure gnome settings
		                 "gnome-tweaks" #configure gnome with grafical interface
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
fi

echo "Install youtube-dl and configurations(Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
  . install_youtube-dl.sh
fi

echo "Install nodejs (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
  . install_node.sh
fi

echo "Install neovim (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
  . install_neovim.sh
fi

echo "Install i3 window manager with GNOME (Y/N)"
read INPUT
if [ $INPUT = "Y" ]; then
  . install_i3.sh
fi

