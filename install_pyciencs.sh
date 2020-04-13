# Python for Scientific Calculus instalation 

# Check if globals variables exists
if [ -f "globals.sh" ]; then

  echo "=== Including Global variables ==="
  . globals.sh

fi

# If globals variables does not exists or are not set
if [ ! -f "globals.sh" ] ||  [ -z $CONDADIR ] && [ -z $CONDAURL ]; then   

  echo "=== Globals.sh not defined or the variables have no value assigned ==="

  # Ask via terminal 
  read -p "Enter URL of conda installer" CONDAURL
  read -p "Enter path where conda is going to be installed" CONDADIR
fi

echo "Miniconda will be installed on $CONDADIR"
cd $CONDADIR

echo "Donwloading miniconda"
wget -v --show-progress --progress=bar:noscroll $CONDAURL

if [ $? -eq 0 ]; then
  echo "Donwloaded finished"
  echo "Remember to add alias in .bash_aliases to activate conda enviroment"
  echo "See question: Should I add Anaconda to the macOS or Linux PATH?"
  echo "https://docs.anaconda.com/anaconda/user-guide/faq/"
else
  echo "Error donwloading miniconda"
fi
