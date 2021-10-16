#!/bin/bash

if ! [ -x "$(command -v ffmpeg)" ]; then
  #Required to convert webm audio files to mp3
  sudo apt install ffmpeg
fi

echo "Installing youtube-dl"
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

echo "==== Remember to stow your files, so configuration can be applied !!! ===="
