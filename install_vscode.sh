# Visual Studio Code IDE installation script

echo "=== Donwload .deb package-file on \
  https://code.visualstudio.com/download ==="

read -p "Enter path of downloaded .deb package-file: " DEBPACKAGE

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
