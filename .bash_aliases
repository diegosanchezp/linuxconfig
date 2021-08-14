alias ls='ls --color=auto --group-directories-first'
alias v=nvim
# Personal aliases
alias yt-mp3='youtube-dl --config-location ~/.config/youtube-dl/yt-mp3.conf'
alias youtube-dl='youtube-dl --config-location ~/.config/youtube-dl/yt-dl.conf'
alias gotoHDD='cd ${HDD}'
alias shoulder='xdg-open ~/Documents/ejercicios-terapia-hombro/ejercicios-calentamiento.jpeg'

# The ciens alias activates the conda enviroment
alias ciens='source ${HDD}/anaconda3/bin/activate'
alias playminecraft='java -jar ${HDD}/Users/diego/Documents/minecraft/TLauncher-2.69.jar'
alias webdl-single='wget -E -H -k -p -e robots=off'
alias webdl-docs='wget -E -H -k -p -np -l 1 -r'
alias todo='nvim $TODO'
alias todo-work='nvim $TODOWORK'

# proyecto-ati-2021
export FLASK_ATI_VENV_DIR='/home/diego/windows/Users/diego/Documents/UCV Semestre VII/AplicacionesTecnologiaInternet/ati-proyect'
alias flask-ati='source "$FLASK_ATI_VENV_DIR/bin/activate"'
alias flask-ati-venv='cd "$FLASK_ATI_VENV_DIR"'

#portal-api
alias papi='source /home/diego/windows/Users/diego/Documents/tpot/monorepo/packages/portal-api/.venv/bin/activate'

# repuestos-commerce
export OSCAR_ENV_DIR='/home/diego/bicimotoccs/oscar-venv'
alias oscar='source ${OSCAR_ENV_DIR}/bin/activate'
alias oscar-dev='repuestos && source ./dev/script.sh'
alias oscar-venv-dir='cd ${OSCAR_ENV_DIR}/lib/python3.9/site-packages/oscar'
alias repuestos='oscar && cd ~/bicimotoccs/repuestos-commerce'
alias django-shell='repuestos && cd project && python manage.py shell'
alias manage='repuestos && python project/manage.py'
manage-help(){
  manage help "$1" | less
}

# This alias is temporary find a better way to do it
alias plantuml='java -jar ~/Coursera/object-oriented-design/plantuml.jar'
alias aws='ssh ubuntu@18.234.160.60 -p 54345'
# wget -E -H -k -p -np -l 1 -r https://tailwindcss.com/docs/
alias vitto='ssh vixx_@190.79.167.149 -p 1999'
