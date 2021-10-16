# Diego's configuration and programs installation files for Ubuntu fresh install

## What it does?

Install the folowing programs  and its configuration files saved on the
.config folder through bash scripts.

* **i3** window manger
* **neovim** text editor its plugings
* **VsCode** IDE and its extensions
* **youtube-dl** 
* **Zathura** pdf reader
* **VLC** video player
* **LaTex**  for writing documents
* And probably more that are listed in the `install.sh` script

## Installation
### Dotfiles

```sh
# Simulate first
stow -nvt ~ */

# Then install
stow -vt ~ */
```
Update dotfiles

```sh
# Simulate first
stow --adopt -nvt ~ */

# Then update
stow --adopt -vt ~ */
```

### Programs
1. Clone the repository
2. **set global variables** in the file  `globals.sh` for continuos installation, otherwise the program will stop at some point asking you that data.
3. Run shell script **install.sh**
 
```
chmod 755 install.sh
./install.sh
```

## After Neovim installation
I use vim-plug for managing plugings and coc for autocompletion. After the
installation run the following command `

`:PlugInstall` for Installing plugings

`:CocInstall` for Installation Coc packages

----
## Individual program installation
Run one of the other `*.sh` file but not `install.sh`.

## Easier i3 integration with gnome

Install regolith linux

## Troubleshooting

### Disable Nouveau nvidia driver 
https://askubuntu.com/questions/841876/how-to-disable-nouveau-kernel-driver

### Fix No Sound (Dummy Output) Issue In Ubuntu With SND HDA Intel 
https://www.linuxuprising.com/2018/06/fix-no-sound-dummy-output-issue-in.html

## Gnome terminal keybindings
See current-gnome-terminal-key-bindings.png
![Gnome-terminal-keybindings](https://github.com/diegosanchezp/linuxconfig/blob/master/current-gnome-terminal-key-bindings.png)

### Disable super+l keybindings
Gnome steals the super+l keybinding, disable it.

See [issue #184](https://github.com/regolith-linux/regolith-desktop/issues/184)

![disableLockScreen](https://github.com/diegosanchezp/linuxconfig/blob/master/disableLockScreen.png)

### Snap auto fetches updates on startup

Solution: Disable the snap daemon
[How to stop snapd from auto-updating?](https://askubuntu.com/questions/1045542/how-to-stop-snapd-from-auto-updating)

## Wifi is slow
Solution: Disable Wi-Fi power management

[Ubuntu 20.04 Network Performance Extremely Slow](https://askubuntu.com/questions/1230525/ubuntu-20-04-network-performance-extremely-slow)
