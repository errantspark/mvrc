#!/bin/bash

#chown your shit
#shouldn't need this anymore I think?
#sudo chown -R $USER: ~

echo "Setup SSH and Git\n\nssh..."
#dunno what this does, it's from the github tut
read -p "email > " email
ssh-keygen -t rsa -C $email
#ssh-agent -s
#ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
read -p "copy paste this or use\n\ncat ~/.ssh/id_rsa.pub | xclip\n\npress any key to continue"

read -p "git...\n\ngithub username> " gname

git config --global user.name $gname
git config --global user.email $email
git config --global push.default matching

#change mvrc to ssh based
git remote set-url origin git@github.com:errantspark/mvrc.git
