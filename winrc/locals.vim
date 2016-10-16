set backupdir=c:/TMP/vimbackups
set directory=c:/TMP/vimswap
set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin
set guifont=Consolas:h8
let g:ycm_path_to_python_interpreter = 'c:\Python27\python.exe'
"Bundle 'Shougo/neocomplete.vim'
"let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
