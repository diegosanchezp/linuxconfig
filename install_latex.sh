# LaTex installation script 
echo " === You can find text-live installer on \
https://www.tug.org/texlive/acquire-netinstall.html === "

# Check if globals variables exists
if [ -f "globals.sh" ]; then

  echo "=== Including Global variables ==="
  . globals.sh

fi

# If globals variables does not exists or are not set
if [ ! -f "globals.sh" ] ||  [ -z $DLURL ]; then   

  echo "=== Globals.sh not defined or the variables have no value assigned ==="
  echo "Enter a value for the variables"

  # Ask via terminal 
  read -p "Enter http url of Tex Live installer, must be tar.gz: " DLURL
fi

INSTALLER="$(basename $DLURL)"

if [ ! -f $INSTALLER ]; then
  echo "Donwloading Installer"
  wget -v --show-progress --progress=bar:noscroll $DLURL
else
  echo "Installer already donwloaded" 
fi

if [ $? -eq 0 ]; then
  echo "Extracting $INSTALLER"
  if  tar -xvzf $INSTALLER ;then
    echo "Now follow the instructions https://www.tug.org/texlive/quickinstall.html"
    INSTALLDIR=`ls  -A | grep install-tl-[0-9]`
    cd $INSTALLDIR

    echo "Executing installer" 
    perl install-tl -gui text

  else
    echo "Error: Could not extract $INSTALLER"
  fi
else
  echo "Error downloading"
fi
