#!/bin/bash
#node and npm for linting (and cause <3 js)
#keychain for ssh-agent management
#zsh cause it's awesome (VIM bindings yay)
#ack cause something needed it and i forget what
apt-get -y install nodejs zsh ack-grep npm keychain

#link up node so it's called node
ln -s /usr/bin/nodejs /usr/bin/node

#install linters and bower/grunt
npm install -g csslint jshint bower grunt-cli

#clean things, this is only useful for re-linking stuff in edge cases
#TODO i should really write a more robust update tool
rm $UD/.zshrc
rm $UD/.vimrc
rm $UD/.bash_aliases
rm $UD/.screenrc
rm $UD/.vim/colors/noctu.vim
rm $UD/.vim/colors/orchid.vim
#rm $UD/.gitconfig
#link up rc files
ln rc/.zshrc $UD
ln rc/.zprofile $UD
ln rc/.vimrc $UD
ln rc/.bash_aliases $UD
ln rc/.screenrc $UD
#set up vim swap and backup folders
mkdir $UD/.vimswap 
mkdir $UD/.vimbackup 
mkdir $UD/.vim
mkdir $UD/.vim/colors
#link up colorschemes
ln vim/noctu.vim $UD/.vim/colors/
ln vim/orchid.vim $UD/.vim/colors/

#copy .gitinfo so userland setup script can populate it with email/password
cp rc/.gitconfig $UD

#clone vundle
git clone https://github.com/gmarik/vundle.git $UD/.vim/bundle/vundle

