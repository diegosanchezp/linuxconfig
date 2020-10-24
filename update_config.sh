# Make an update when yo change the ~/.config files
cp ~/.bash_aliases ~/.profile .

#i3, youtube-dl
cp -r ~/.config/i3/ \
      ~/.config/youtube-dl/ \
      -t .config

# neovim
cp ~/.config/nvim/init.vim \
   ~/.config/nvim/coc-settings.json \
   -t .config/nvim

# Visual Studio Code (deprecated)
# cp ~/.config/Code/User/settings.json .config/Code/User

# transmission
cp ~/.config/transmission/settings.json .config/transmission
cp ~/.config/transmission/shutdown.sh .config/transmission

# regolith linux 
cp -r ~/.config/regolith .config/

# compton
cp ~/.config/compton.conf .config/
