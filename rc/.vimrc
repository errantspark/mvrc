":so %        <-- this reloads this file if you're editing it
":so $MYVIMRC <-- this reloads the vimrc from any vim
"makes it so that mousing in terminal vim goes into visual mode rather than
"being all fucking weird
"put swap files elsewhere
set backupdir=~/.vimbackup
set directory=~/.vimswap

"let mapleader = '\'

"fuck the visual bell
set noerrorbells
set visualbell
set t_vb=
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
"magic vim plugin management
"uncomment on windows
"so $VIMRUNTIME\..\locals.vim

"color schemes
Plug 'tomasr/molokai'
Plug 'vim-scripts/umber-green'
Plug 'vim-scripts/very-monochrome-grey-theme'
Plug 'vim-scripts/C64.vim'
Plug 'ryanpcmcquen/true-monochrome_vim'
Plug 'fxn/vim-monochrome'
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/nerdtree-ack'
Plug 'goldfeld/vim-seek'
Plug 'terryma/vim-multiple-cursors'
"Plug 'nathanaelkane/vim-indent-guides'

Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'

"javascript shit
"tern is the thing that does type inference and other cray shit
"Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" requires you to do an 'npm install' inside the tern dir
"Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
"async lint engine
"DO I ACTULLY WANT THIS????? or is COC enough
"Plug 'dense-analysis/ale'
"Plug 'prettier/vim-prettier', { 'do': 'npm install' }


"Plug 'einars/js-beautify'
"Plug 'maksimr/vim-jsbeautify'
"no longer sure what this means in the comment below this one, fuck
"this requires a 'git submodule update --init --recursive' in it's dir

"type script syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

"elixir syntax highlighting
Plug 'elixir-lang/vim-elixir'

"typescript tools
Plug 'Quramy/tsuquyomi'


"glorious LISP IDE
Plug 'kovisoft/slimv'

"glorious everything ide?
Plug 'zweifisch/pipe2eval'

"5/13/19 i'm going to try deoplete again
"amazing autocompletion that has some weird errors/conflicts maybe?
"Plug 'Valloric/YouCompleteMe'

"this requires additional shit to be installed so watch out
"also you don't get semantic completion at the top level without pressing
"ctrl+space
"these two commands should do it
"cd ~/.vim/bundle/YouCompleteMe
"./install.py --tern-completer
"making sure you build with tern is important

"Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'roxma/nvim-yarp'
"Plug 'Shougo/deoplete.nvim'
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'SirVer/ultisnips'

" shows completions in command line
Plug 'Shougo/echodoc.vim'
"
"5/26/19 i should think long and hard about what it means to use vim with
"all of these fucking plugins because maybe i don't really need
"autocompletion and all these fucking fancy IDE features because i should
"focus on writing good code, but doesn't that stuff help? or is it a crutch?

"go syntax support 
Plug 'fatih/vim-go'

"rust syntax support
Plug 'rust-lang/rust.vim'

"nim syntax support
Plug 'zah/nim.vim'

"zeal one button
Plug 'KabbAmine/zeavim.vim'

"all plugin imports have to happen before this line
call plug#end()            " required
"filetype plugin indent on  "also required
"end of Plug related stuff
"let g:coc.preferences.extensionUpdateCheck = 'never'

"this maps Ctrl+O to open up a newline inside parens
imap <C-o> <CR><Esc>O

"fix capital W and capital Q annoyance
:command WQ wq
:command Wq wq
:command W w
:command Q q

"remaps ; to : so the above things don't even happen at all
nnoremap ; :

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
colorscheme orchid
"colorscheme molokai
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

set smartindent cindent

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()

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

"copied from somewhere because indenting was broken
"set lispwords+=public-method,override-method,private-method,syntax-case,syntax-rules
"set lispwords+=..more..

"unbind arrow keys
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

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
  call cursor(v:mouse_lnum,v:mouse_col)
endfunc

"enables mousing
set mouse=a
noremap <silent> <RightMouse> :call MScroll()<CR>
noremap <RightRelease> <Nop>
noremap <RightDrag> <Nop> 
map <Leader> <Plug>(easymotion-prefix)

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1

"default to no sign column, this breaks diffs i think
set scl=no
" Toggle ALE quick list
nmap <silent> gl :call QFixToggle()<CR>

function! QFixToggle()
  if exists("g:qfix_win")
    cclose
    unlet g:qfix_win
    set scl=no
  else
    set scl=auto
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

let g:maplocalleader = ','
function SetJSOptions()
  Docset threejs,javascript
  set fdm=syntax
  set foldlevelstart=99
  "nnoremap <localleader>d :TernDef<CR>
  "nnoremap <localleader>Dp :TernDefPreview<CR>
  "nnoremap <localleader>Dt :TernDefTab<CR>
  "nnoremap <localleader>Ds :TernDefSplit<CR>
  "nnoremap <localleader>sd :TernDefSplit<CR>
  "nnoremap <localleader>h :TernDocBrowse<CR>
  "nnoremap <localleader>H :TernDoc<CR>
  "nnoremap <localleader>r :TernRefs<CR>
  "nnoremap <localleader>R :TernRename<CR>
  "nnoremap <localleader>t :TernType<CR>
  nnoremap <localleader>z :Zeavim<CR>
  map <localleader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
  "conceal js stuff maybe is fun and good
  let g:javascript_conceal_function             = "ƒ"
  let g:javascript_conceal_null                 = "ø"
  let g:javascript_conceal_this                 = "@"
  let g:javascript_conceal_return               = "⇚"
  let g:javascript_conceal_undefined            = "¿"
  let g:javascript_conceal_NaN                  = "ℕ"
  let g:javascript_conceal_prototype            = "¶"
  let g:javascript_conceal_static               = "•"
  let g:javascript_conceal_super                = "Ω"
  let g:javascript_conceal_arrow_function       = "⇒"
  let g:syntastic_javascript_checkers = ['eshint']
  syntax enable
  "let g:syntastic_auto_loc_list=0
endfunction

function StandardFormat()
  silent !standard-format -w %
endfunction
"au BufWritePre *.js call JsBeautify()
au FileType javascript call SetJSOptions() 

"debug with node with F5
"nnoremap <F5> :! node debug %<CR>
"helper fucntions for editing color schermes
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! SynGroup()                                                            
  let l:s = synID(line('.'), col('.'), 1)                                       
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

function! SynBg()                                                            
  echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "bg")
endfun

function! SynFg()                                                            
  echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")
endfun

function SetRSOptions()
  let g:coc_global_extensions = [ 'coc-rust-analyzer'] ",'coc-rls', 'coc-ultisnips' ]
endfunction

au FileType rust call SetRSOptions() 

"COC copy paste sadness
"

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use sd to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

"tryan get echodoc working
let g:echodoc_enable_at_startup = 1

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" end coc copy paste
