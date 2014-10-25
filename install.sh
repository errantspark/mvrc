#!/bin/bash
#This is the unattended install script
apt-get -y install nodejs zsh ack-grep npm

#link up node so it's called node
ln -s /usr/bin/nodejs /usr/bin/node

npm install -g csslint jshint

rm $UD/.zshrc
rm $UD/.vimrc
rm $UD/.bash_aliases
rm $UD/.screenrc
rm $UD/.vim/colors/noctu.vim
rm $UD/.vim/colors/orchid.vim
#rm $UD/.gitconfig
#link up rc files
ln rc/.zshrc $UD
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

