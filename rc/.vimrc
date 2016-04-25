":so %        <-- this reloads this file if you're editing it
":so $MYVIMRC <-- this reloads the vimrc from any vim
"makes it so that mousing in terminal vim goes into visual mode rather than
"being all fucking weird
"put swap files elsewhere
set backupdir=~/.vimbackup
set directory=~/.vimswap

let mapleader = '\'

"fuck the visual bell
set noerrorbells
set visualbell
set t_vb=
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
"windows (ugh)
"set rtp+=c:/Program\ Files\ (x86)/Vim/vimfiles/bundle/vundle
call vundle#begin()
"magic vim plugin management
Bundle 'gmarik/vundle'
"uncomment on windows
"so $VIMRUNTIME\..\locals.vim

"color schemes
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/umber-green'
Bundle 'vim-scripts/very-monochrome-grey-theme'
Bundle 'vim-scripts/C64.vim'

Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'goldfeld/vim-seek'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'nathanaelkane/vim-indent-guides'

Bundle 'edkolev/tmuxline.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-ragtag'
Bundle 'Raimondi/delimitMate'
Bundle 'easymotion/vim-easymotion'

"javascript shit
"tern is the thing that does type inference and other cray shit
Bundle 'marijnh/tern_for_vim'
" requires you to do an 'npm install' inside the tern dir
"Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
"Bundle 'einars/js-beautify'
Bundle 'maksimr/vim-jsbeautify'
"no longer sure what this means in the comment below this one, fuck
"this requires a 'git submodule update --init --recursive' in it's dir

"type script syntax highlighting
Bundle 'HerringtonDarkholme/yats.vim'

"typescript tools
Bundle 'Quramy/tsuquyomi'

let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::', '"', "'", 'use ', 'namespace ', '\'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'html': ['<', '"', '</', ' '],
            \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'haskell' : ['.', 're!.']
            \ }


"glorious LISP IDE
Bundle 'kovisoft/slimv'

"glorious everything ide?
Bundle "zweifisch/pipe2eval"

"debug with node with F5
nnoremap <F5> :! node debug %<CR>

"amazing autocompletion that has some weird errors/conflicts maybe?
Bundle 'Valloric/YouCompleteMe'
"this requires additional shit to be installed so watch out
"also you don't get semantic completion at the top level without pressing
"ctrl+space
"these two commands should do it
"cd ~/.vim/bundle/YouCompleteMe
"./install.sh

"go syntax support 
Bundle 'fatih/vim-go'

"rust syntax support
Bundle 'rust-lang/rust.vim'

"all plugin imports have to happen before this line
call vundle#end()            " required
filetype plugin indent on  "also required
"end of bundle related stuff

"this makes the completion preview window close after completion (ycm)
"see also :echo &completeopt
autocmd CompleteDone * pclose

"this maps Ctrl+O to open up a newline inside parens
imap <C-o> <CR><Esc>O

"recommended settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"maybe turn this off? it might get annoying
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
"
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
set foldlevelstart=99
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

"nnoremap <C-n> :call NumberToggle()<cr>
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

"respect gitignore with ctrlp <-- not tested
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"ezscroll.vim <-- should fork this into a plugin at some point
func! MScroll()
  let l:done=0
  let l:n = -1
  let l:w0 = line("w0")
  let l:last = line("$")
  while done!=1
    let l:g = getchar()
    if l:g != "\<RightDrag>"
      let done = 1
    else
      if l:n == -1
        let l:n = v:mouse_lnum
        let l:fln = v:mouse_lnum
      else
        let l:new = l:w0 - v:mouse_lnum + l:n
        if l:new<1
          let l:new = 1
        endif

        let l:diff = -v:mouse_lnum + l:n
        let l:nd = line("w$")
        if l:nd+l:diff>l:last
          let l:new = l:last - winheight(0) + 1
          if l:new<1
            let l:new = 1
          endif
        end

        let l:wn = "normal ".string(l:new)."zt"
        if (l:n != v:mouse_lnum)
          exec(l:wn)
          redraw
        endif
        let l:w0 = line("w0")
        let l:n = v:mouse_lnum + l:diff
      endif
    endif
  endwhile
  :call cursor(v:mouse_lnum,v:mouse_col)
endfunc
:set mouse=a
:noremap <silent> <RightMouse> :call MScroll()<CR>
:noremap <RightRelease> <Nop>
:noremap <RightDrag> <Nop> 
map <Leader> <Plug>(easymotion-prefix)

"disable ycm when using multiple cursors 
function! Multiple_cursors_before()
  let g:ycm_auto_trigger = 0
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
"function! Multiple_cursors_after()
"endfunction
function! Multiple_cursors_after()
  let g:ycm_auto_trigger = 1
endfunction

function SetJSOptions()
  set fdm=syntax
  set foldlevelstart=99
  let g:maplocalleader = ','
  nnoremap <localleader>d :TernDef<CR>
  nnoremap <localleader>Dp :TernDefPreview<CR>
  nnoremap <localleader>Dt :TernDefTab<CR>
  nnoremap <localleader>Ds :TernDefSplit<CR>
  nnoremap <localleader>sd :TernDefSplit<CR>
  nnoremap <localleader>h :TernDocBrowse<CR>
  nnoremap <localleader>H :TernDoc<CR>
  nnoremap <localleader>r :TernRefs<CR>
  nnoremap <localleader>R :TernRename<CR>
  nnoremap <localleader>t :TernType<CR>
  "let g:syntastic_auto_loc_list=0
endfunction

au BufWritePre *.js call JsBeautify()
au FileType javascript call SetJSOptions() 

