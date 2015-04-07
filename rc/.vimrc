":so %        <-- this reloads this file if you're editing it
":so $MYVIMRC <-- this reloads the vimrc from any vim
"makes it so that mousing in terminal vim goes into visual mode rather than
"being all fucking weird
"pathogen plugin manager
"call pathogen#infect()
"fuck the visual bell
set noerrorbells
set visualbell
set t_vb=
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'kovisoft/slimv'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'goldfeld/vim-seek'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'ervandew/supertab'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/umber-green'
Bundle 'vim-scripts/very-monochrome-grey-theme'
Bundle 'vim-scripts/C64.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'

Bundle 'marijnh/tern_for_vim'
" requires you to do an 'npm install' inside the tern dir

Bundle 'jelera/vim-javascript-syntax'

Bundle 'einars/js-beautify'
Bundle 'maksimr/vim-jsbeautify'
"this requires a 'git submodule update --init --recursive' in it's dir

Bundle 'Valloric/YouCompleteMe'
"this requires additional shit to be installed so watch out
"also you don't get semantic completion at the top level without pressing
"ctrl+space
"these two commands should do it
"cd ~/.vim/bundle/YouCompleteMe
"./install.sh
"Bundle 'wookiehangover/jshint.vim'

call vundle#end()            " required
filetype plugin indent on  

autocmd CompleteDone * pclose
"this maps Ctrl+O to open up a newline inside parens
imap <C-o> <CR><Esc>O
" you have to run :BundleInstall or :BundleInstall! to actually make it work
"helptags

"fix capital W and capital Q annoyance
:command WQ wq
:command Wq wq
:command W w
:command Q q

"remaps ; to : so the above things don't even happen at all
nnoremap ; :

"enables mousing
set mouse=a

"This sets t_Co to 256 to fix colors because seriously who doesn't have 256? 
set t_Co=256

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

"let g:Powerline_symbols = 'unicode'

"let g:Powerline_symbols_override = {
"  \ 'BRANCH': [0x2213],\
"  \ 'LINE': 'L',
"  \ 'RO': 'RO',
"  \ }
"let g:Powerline_dividers_override = ['|', '>', '|', '<']
let g:airline#extensions#tabline#enabled = 1

set hidden
"sets the minimum height of the currently selected window to 30 lines
set winheight=10
"sets the minimum absolute height to 5 lines
set winminheight=5
"this allows for tab completing when you're using :e with a nice file browser
set wildmode=longest,list,full
set wildmenu
"sets up code folding
set foldmethod=syntax
set foldlevel=99
"i should get a better color scheme
"colorscheme noctu
colorscheme molokai
"makes molokai nicer for 256 color use
let g:rehash256 = 1
"tabstop sets how many spaces a tab should be displayed as
"expandtab means that tab makes spaces instead of a tab
"shiftwidth is how much code is indended when you use >>
"softtabstop is how big tab is in insert mode
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
"ostensibly this is something to configure search to be good
set incsearch ignorecase hlsearch
set nu
"marks the column at 80 lines red for old readability standards
set colorcolumn=80
set scrolloff=8         "Start scrolling when we're 8 lines away from margins"
"UPDATE: i was a retard| that was ugly so now we use this instead
"match Error /\%81v.\+/

set noru
"indentguides
let g:indent_guides_auto_colors = 0
"adds jumps from seek
let g:seek_enable_jumps = 1
syntax on
"this remaps Ctrl+(+,-,<,>) to resize windows
"map - <C-W>-
"map + <C-W>+
"map < <C-W><
"map > <C-W>>
"this remaps Ctrl+(h,j,k,l) to focus windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
"makes it so that ctrl+enter goes to the correct place
map <C-Return> <CR><CR><C-o>k<Tab>
"put swap files elsewhere
set backupdir=~/.vimbackup
set directory=~/.vimswap
"let g:solarized_termcolors=256
"exit insert mode with jk or kj
ino jk <ESC>
ino kj <ESC>
"Relative Line Numbering (jeffkreeftmeijer.com)
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
"this is apparently some hack that the javascript plugin guy recommends
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

nnoremap <C-n> :call NumberToggle()<cr>
"enables rainbow perens because DOUBLE RAINBOW ALL THE WAY ACROSS THE LISP
let g:lisp_rainbow=1
"TODO decide if i should deprecate this in favor of powerline
"stop fucking trying to do commands in insert mode
"autocmd InsertEnter * :hi LineNr ctermbg=11
"autocmd InsertLeave * :hi LineNr ctermbg=none
"makes ctrlp have line mode
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"silversurfer fast ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Called once right before you start selecting multiple cursors
"function! Multiple_cursors_before()
"endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
"function! Multiple_cursors_after()
"endfunction
