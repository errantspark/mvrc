#This is the unattended install script
apt-get -y install nodejs zsh ack-grep
ln -s /usr/bin/nodejs /usr/bin/node

#this will include setting up zsh dotfiles and setting up vim, cloning fresh plugins
#once i'm done