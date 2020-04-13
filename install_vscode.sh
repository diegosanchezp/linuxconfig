# Visual Studio Code IDE installation script

echo "=== Donwload .deb package-file on \
  https://code.visualstudio.com/download ==="

# Check if globals variables exists
if [ -f "globals.sh" ]; then

  echo "=== Including Global variables ==="
  . globals.sh

fi

# If globals variables does not exists or are not set
if [ ! -f "globals.sh" ] ||  [ -z $DEBPACKAGE]; then   

  echo "=== Globals.sh not defined or the variables have no value assigned ==="
  echo "Enter a value for the variables"

  # Ask via terminal 
  read -p "Enter path of downloaded .deb package-file: " DEBPACKAGE
fi

if [ -e $DEBPACKAGE ]; then
  if dpkg --install $DEBPACKAGE; then
    declare -a programs=("Angular.ng-template"
                         "ardenivanov.svelte-intellisense" 
                         "vscodevim.vim" 
                         "jamesbirtles.svelte-vscode"
                        )
    
    echo "=== Installing extensions ==="

    for p in "${programs[@]}"
    do
      code --install-extension $p
    done

    echo "=== Moving vscode config files ==="
    cp -r -i -t ~/.config .config/Code/User

  fi
else
  echo ".deb file not found"
fi
