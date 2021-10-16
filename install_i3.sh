CURRENT_DIR=`pwd`
if ! [ -x "$(command -v git)" ]; then
  sudo apt install git
fi

echo "Installing i3"
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt install i3-gaps-wm

echo "Configuring i3 with gnome"
sudo apt install gnome-session-flashback

git clone https://github.com/i3-gnome/i3-gnome.git
cd i3-gnome
sudo make install

cd $CURRENT_DIR

echo "==== Remember to stow your files, so configuration can be applied !!! ===="
