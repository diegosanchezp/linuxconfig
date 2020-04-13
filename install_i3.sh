CURRENT_DIR=`pwd`
if ! [ -x "$(command -v git)" ]; then
  sudo apt install git
fi

echo "Installing i3"
sudo apt install i3

echo "Configuring i3 with gnome"
git clone https://github.com/i3-gnome/i3-gnome.git
cd i3-gnome
sudo make install

cd CURRENT_DIR

echo "Move i3 configuration" 
cp -r -i -t ~/.config .config/i3 .config/i3status
