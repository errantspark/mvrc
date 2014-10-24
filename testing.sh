read -p "github username> " gname
read -p "guthub email>    " gemail

git config --global user.name $gname
git config --global user.email $gemail

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo lol
fi