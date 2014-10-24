#!/bin/bash
#This is the unattended install script
apt-get -y install nodejs zsh ack-grep

#link up node so it's called node
ln -s /usr/bin/nodejs /usr/bin/node

#link up rc files
ln .zshrc $UD
ln .vimrc $UD
ln .bash_aliases $UD
#set up vim swap and backup folders
mkdir $UD/.vimswap 
mkdir $UD/.vimbackup 
mkdir $UD/.vim
mkdir $UD/.vim/colors
#link up colorschemes
ln noctu.vim $UD/.vim/colors/
ln orchid.vim $UD/.vim/colors/

#copy .gitinfo so userland setup script can populate it with email/password
cp .gitconfig $UD

#clone vundle
git clone https://github.com/gmarik/vundle.git $UD/.vim/bundle/vundle

