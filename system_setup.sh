#!/bin/bash
####### GARBAGE FROM UBUNTU
#node and npm for linting (and cause <3 js)
#keychain for ssh-agent management
#zsh cause it's awesome (VIM bindings yay)
#ack cause something needed it and i forget what
#units cause units
#cmake build essential and python dev cause some vim plugin needs it
#apt-get -y install nodejs zsh ack-grep npm keychain silversearcher-ag cmake python-dev build-essential units

#it probably makes sense to replace all this stuff with NVM
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

#link up node so it's called node
# ln -s /usr/bin/nodejs /usr/bin/node

#install linters and bower/grunt
# npm install -g csslint jshint bower grunt-cli

#########
# this script must be run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

MVRC_DIR=$(pwd)

# update pacman and databases
pacman -Syy --noconfirm
pacman -S pacman --noconfirm

#install reflector from whatever mirror is configured
pacman -S reflector --noconfirm
reflector --country "United States" --protocl https -sort rate --save /etc/pacman.d/mirrorlist

#upgrade distro
pacman -Syyu --noconfirm

#install base-devel group (needed for yay)
pacman -S base-devel

# the assumption here is that MVRC lives in the directory where all my personal
# projects live and random shit i clone but never work on lives in clones

mkdir ../clones
cd ../clones

CLONES_DIR=$(pwd)

#clone yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd $MVRC_DIR

############# YAY ############
# install packages inside package.list with yay, lives in a separate file so
# it can be manually run
./yay_install.sh

#install node
# maybe this should just be trusted to be inside packages.list
yay -S --needed --noconfirm nvm
nvm install node

######### GARBAGE LINKING
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

############################

#copy .gitinfo so userland setup script can populate it with email/password
cp rc/.gitconfig $UD

#clone vundle
git clone https://github.com/gmarik/vundle.git $UD/.vim/bundle/vundle

#install vundle plugins
vim +PluginInstall +qall
