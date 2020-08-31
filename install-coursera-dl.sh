if [ ! -x "$(command -v pip3)" ]; then
  sudo apt-get install python3 python3-pip
fi

pip3 install coursera-dl
