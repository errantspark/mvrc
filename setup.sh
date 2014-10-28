#!/bin/bash

#chown your shit
sudo chown -R $USER: ~

echo "Setup SSH"
#dunno what this does, it's from the github tut
read -p "email> " semail
ssh-keygen -t rsa -C $semail
#ssh-agent -s
#ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
read -p "press any key to continue"

read -p "github username> " gname
read -p "guthub email>    " gemail

git config --global user.name $gname
git config --global user.email $gemail
git config --global push.default matching

#change mvrc to ssh based
git remote set-url origin git@github.com:errantspark/mvrc.git
