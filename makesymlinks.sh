#!/bin/bash
############################
# makesymlinks.sh

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Copied from https://github.com/michaeljsmalley/dotfiles
############################

########## Variables

dir=~/repos/dotfiles                                  # dotfiles directory
olddir=~/repos/dotfiles/dotfiles_old                  # old dotfiles backup directory
files="bash_aliases bash_functions vimrc bashrc vim"  # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file $olddir
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done

#configure vim color scheme
#if [ ! -d "~/.vim" ]; then
#  mkdir ~/.vim
#  if [ ! -d "~/.vim/colors"]; then
#    mkdir ~/.vim/colors
#  fi
#fi
#mv ./colors/* ~/.vim/colors