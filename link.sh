ln -s /usr/bin/nodejs /usr/bin/node
eval ln .zshrc ~$USERN
eval ln .vimrc ~$USERN

#copy .gitinfo so userland setup script can populate it with email/password
eval cp .gitconfig ~$USERN
