#!/bin/bash
#node and npm for linting (and cause <3 js)
#keychain for ssh-agent management
#zsh cause it's awesome (VIM bindings yay)
#ack cause something needed it and i forget what
#units cause units
#cmake build essential and python dev cause some vim plugin needs it
apt-get -y install nodejs zsh ack-grep npm keychain silversearcher-ag cmake python-dev build-essential units

#it probably makes sense to replace all this stuff with NVM
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

#link up node so it's called node
ln -s /usr/bin/nodejs /usr/bin/node

#install linters and bower/grunt
npm install -g csslint jshint bower grunt-cli

#clean things, this is only useful for re-linking stuff in edge cases
#TODO i should really write a more robust update tool
rm $UD/.zshrc
rm $UD/.zprofile
rm $UD/.vimrc
rm $UD/.bash_aliases
rm $UD/.screenrc
rm $UD/.vim/colors/noctu.vim
rm $UD/.vim/colors/orchid.vim
rm $UD/.vim/.editorconfig
#rm $UD/.gitconfig
#set up vim swap and backup folders
mkdir $UD/.vimswap 
mkdir $UD/.vimbackup 
mkdir $UD/.vim
mkdir $UD/.vim/colors
#link up rc files
cwd=$(pwd)
ln -s $cwd/misc $UD/.misc
ln -s $cwd/rc/.zshrc $UD
ln -s $cwd/rc/.zprofile $UD
ln -s $cwd/rc/.vimrc $UD
ln -s $cwd/rc/.bash_aliases $UD
ln -s $cwd/rc/.screenrc $UD
#link up colorschemes
ln -s $cwd/vim/noctu.vim $UD/.vim/colors/
ln -s $cwd/vim/orchid.vim $UD/.vim/colors/
#link up editorconfig for jsbeautify etc
ln -s $cwd/vim/.editorconfig $UD/.vim/

#copy .gitinfo so userland setup script can populate it with email/password
cp rc/.gitconfig $UD

#clone vundle
git clone https://github.com/gmarik/vundle.git $UD/.vim/bundle/vundle

#install vundle plugins
vim +PluginInstall +qall
