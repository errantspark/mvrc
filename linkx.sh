#clean things, this is only useful for re-linking stuff in edge cases
#TODO i should really write a more robust update tool
UD=~
rm $UD/.Xdefaults

#link up rc files
cwd=$(pwd)
ln -s $cwd/grc/.Xdefaults $UD
