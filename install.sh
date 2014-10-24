#!/bin/bach
#This is the unattended install script
apt-get -y install nodejs zsh ack-grep

#link up node so it's called node
ln -s /usr/bin/nodejs /usr/bin/node

#link up rc files
ln .zshrc $UD
ln .vimrc $UD
#set up vim swap and backup folders
mkdir $UD/.vimswap 
mkdir $UD/.vimbackup 
#link up colorschemes
ln noctu.vim $UD/.vim/colors/
ln orchid.vim $UD/.vim/colors/

#copy .gitinfo so userland setup script can populate it with email/password
eval cp .gitconfig ~$UD

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

