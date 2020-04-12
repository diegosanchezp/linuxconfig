# Python for Scientific Calculus instalation 

# Check if globals variables exists
if [ -f "globals.sh" ]; then

  # Include global variables 
  . globals.sh

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
else
  echo "File globals.sh does not exist"
fi
