#clean things, this is only useful for re-linking stuff in edge cases
#TODO i should really write a more robust update tool
UD=~
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

