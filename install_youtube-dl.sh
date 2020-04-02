#!/bin/bash

if ! [ -x "$(command -v ffmpeg)" ]; then
  #Required to convert webm audio files to mp3
  sudo apt install ffmpeg
fi

echo "Installing youtube-dl"
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

echo "Moving youtube-dl config"
cp -r -i -t ~/.config .config/youtube-dl 
