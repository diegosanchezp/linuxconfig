# Google Chrome Web Browser installation script

echo " === Donwload .deb package-file on https://www.google.com/chrome === "
read -p "Enter path of downloaded .deb package-file: " DEBPACKAGE

if [ -e $DEBPACKAGE ]; then
  dpkg --install $DEBPACKAGE
else
  echo ".deb file not found"
fi

