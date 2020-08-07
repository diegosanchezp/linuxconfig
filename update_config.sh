# Make an update when yo change the ~/.config files
cp ~/.bash_aliases ~/.profile .

cp -r ~/.config/i3/ \
      ~/.config/youtube-dl/ \
      -t .config

cp ~/.config/Code/User/settings.json .config/Code/User

cp ~/.config/transmission/settings.json .config/transmission
cp ~/.config/transmission/shutdown.sh .config/transmission



