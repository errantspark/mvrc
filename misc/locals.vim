set backupdir=c:/TMP/vimbackups
set directory=c:/TMP/vimswap
set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin
set guifont=Consolas:h8
Bundle 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
