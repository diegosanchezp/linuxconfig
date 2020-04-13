# Diego's configuration and programs installation files for Ubuntu

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
