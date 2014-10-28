cwd=$(pwd)

rm ~/.zshrc
rm ~/.zprofile
rm ~/.vimrc
rm ~/.bash_aliases
rm ~/.screenrc
rm ~/.vim/colors/noctu.vim
rm ~/.vim/colors/orchid.vim

ln -s $cwd/rc/.zshrc ~
ln -s $cwd/rc/.zprofile ~
ln -s $cwd/rc/.vimrc ~
ln -s $cwd/rc/.bash_aliases ~
ln -s $cwd/rc/.screenrc ~

ln -s $cwd/vim/noctu.vim ~/.vim/colors/
ln -s $cwd/vim/orchid.vim ~/.vim/colors/
