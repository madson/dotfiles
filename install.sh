#!/bin/bash

cd ~

if [ ! -d ~/.dotfiles ]; then
  git clone git@github.com:madson/dotfiles.git .dotfiles || exit 1
fi

if [ ! -d ~/.dotfiles ]; then
  echo "You need to clone dotfiles repository"
  exit 1
fi

if [ -f ~/.bash_profile ]
then
	echo "Backing up your ~/.bash_profile file into ~/.bash_profile_original"
	cp ~/.bash_profile ~/.bash_profile_original

	echo "Changing .bash_profile..."
	cat ~/.dotfiles/bash_init >> ~/.bash_profile
fi

echo "Creating links..."
for file in $(ls ~/.dotfiles/bash_inc*)
do
  ln -s $file ~/.$file
done

cd -

echo "Done."

