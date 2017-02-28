function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

function conda-env-file {
  # Create conda environment.yml file and autoenv activation file
  # based on directory name.
  autoenvfilename='.env'
  condaenvfilename='environment.yml'
  foldername=$(basename $PWD)

  if [ ! -f $condaenvfilename ]; then
    printf "name: $foldername\ndependencies:\n- pip\n- python\n- anaconda\n" > $condaenvfilename
    echo "$condaenvfilename created."
  else
    echo "$condaenvfilename already exists."
  fi

  if [ ! -f $autoenvfilename ]; then
    printf "source activate $foldername\n" > $autoenvfilename
    echo "$autoenvfilename created."
  else
    echo "$autoenvfilename already exists."
  fi
}
