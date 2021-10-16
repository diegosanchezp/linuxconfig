# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export HDD='/home/diego/windows'

export PATH=/home/diego/windows/.npm-global/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

# set LaTex env variables
export MANPATH=/home/diego/windows/textlive/2019/texmf-dist/doc/man:$MANPATH
export INFOPATH=/home/diego/windows/textlive/2019/texmf-dist/doc/info:$INFOPATH
export PATH=/home/diego/windows/textlive/2019/bin/x86_64-linux:$PATH

# Nodejs Resolving EACCES permissions errors when installing packages globally
export PATH=/home/diego/windows/.npm-global/bin:$PATH

# Node version manager
export N_PREFIX=$HOME/n
export PATH=$N_PREFIX/bin:$PATH

# Preserving npm
export N_PRESERVE_NPM=1

# Personal use variables

#Add thunderbird to path
export PATH=${HDD}/Users/diego/Documents/LinuxPrograms/thunderbird:$PATH

# To change the browser do it in 
# gnome-control-center -> Details -> Default Applications
export BROWSER=$(xdg-settings get default-web-browser | cut -d'.' -f 1)

export TERMINAL=gnome-terminal
export TODO=${HDD}/Users/diego/Documents/orgmode/todos.org
export TODOWORK=${HDD}/Users/diego/Documents/bicimotoccs/notas.org

export SUDO_EDITOR=nvim

# === PYTHON ===
export PIPENV_VENV_IN_PROJECT=1
