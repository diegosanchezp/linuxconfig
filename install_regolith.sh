sudo add-apt-repository ppa:regolith-linux/release

sudo apt install regolith-desktop
echo "==== Installing i3 bar status indicators ==== "

sudo apt install i3xrocks-net-traffic i3xrocks-cpu-usage i3xrocks-time i3xrocks-battery i3xrocks-memory

echo "==== Disable compositor, when the compositor is enabled there are lagspikes meaning that is not compatible with graphics card === "

sudo apt install regolith-compositor-none

echo "==== Installing compton for terminal transparency ===="
sudo apt install compton

echo "==== Remember to stow your files, so configuration can be applied !!! ===="
