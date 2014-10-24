echo "Setup SSH"
#dunno what this does, it's from the github tut
read -p "email> " semail
ssh-keygen -t rsa -C $semail
ssh-agent -s
ssh-add ~/.ssh/id_rsa