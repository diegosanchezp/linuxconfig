# Install dependecies
if ! [ -x "$(command -v curl)" ]; then
  sudo apt install curl
fi
echo "Installing neovim"
sudo apt install neovim
echo "Install vim-plug (Vim plugin manager)"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Install YouCompleteMe (A code-completion engine for Vim) dependencies" 
# Install development tools, CMake, and Python headers (Ubuntu 16.04 and later)
sudo apt install build-essential cmake python3-dev

echo "Install flake8 for flake8 neovim pluging"
sudo apt install python3-pip
pip3 install flake8
