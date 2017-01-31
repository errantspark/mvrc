" Vim color file - orchid
" Generated by http://bytefluent.com/vivify 2013-02-23
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
"stop fucking trying to do commands in insert mode
autocmd InsertEnter * :hi LineNr guibg=#CF3A32 guifg=#fedeba
autocmd InsertLeave * :hi LineNr guibg=#1a202b guifg=#7592b3
hi IndentGuidesOdd  guibg=#23233f
hi IndentGuidesEven guibg=#33334f
hi LineNr guifg=#7592b3 guibg=#1a202b guisp=#1a202b gui=NONE ctermfg=67 ctermbg=235 cterm=NONE

set t_Co=256
let g:colors_name = "orchid"

hi ColorColumn guibg=#122542
"hi IncSearch -- no settings --
"hi WildMenu -- no settings --
"hi SignColumn -- no settings --
hi SpecialComment guifg=#A9EE8A guibg=NONE guisp=NONE gui=NONE ctermfg=156 ctermbg=NONE cterm=NONE
hi Typedef guifg=#55AAFF guibg=NONE guisp=NONE gui=bold,italic ctermfg=75 ctermbg=NONE cterm=bold
hi Title guifg=#83cbdb guibg=NONE guisp=NONE gui=bold ctermfg=116 ctermbg=NONE cterm=bold
hi Folded guifg=#000000 guibg=#FFC0C0 guisp=#FFC0C0 gui=NONE ctermfg=8 ctermbg=NONE cterm=NONE
hi PreCondit guifg=#F9449A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Include guifg=#F9449A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Float guifg=#A9EE5A guibg=NONE guisp=NONE gui=bold,italic ctermfg=155 ctermbg=NONE cterm=bold
hi StatusLineNC guifg=#5c5d73 guibg=#1a1529 guisp=#1a1529 gui=NONE ctermfg=60 ctermbg=235 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText guifg=#9FADC5 guibg=#233654 guisp=#233654 gui=NONE ctermfg=146 ctermbg=NONE cterm=NONE
"hi CTagsGlobalConstant -- no settings --
"hi DiffText -- no settings --
"hi ErrorMsg -- no settings --
"hi Ignore -- no settings --
hi Debug guifg=#A9EE8A guibg=NONE guisp=NONE gui=NONE ctermfg=156 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#848688 guisp=#848688 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
hi Identifier guifg=#a584bd guibg=NONE guisp=NONE gui=bold ctermfg=139 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#A9EE8A guibg=NONE guisp=NONE gui=NONE ctermfg=156 ctermbg=NONE cterm=NONE
hi Conditional guifg=#f7e631 guibg=NONE guisp=NONE gui=NONE ctermfg=75 ctermbg=NONE cterm=bold
hi StorageClass guifg=#55AAFF guibg=NONE guisp=NONE gui=bold,italic ctermfg=75 ctermbg=NONE cterm=italic
hi Todo guifg=#FFFFFF guibg=#c71010 guisp=#c71010 gui=bold ctermfg=15 ctermbg=1 cterm=bold
hi Special guifg=#c74d64 guibg=NONE guisp=NONE gui=NONE ctermfg=168 ctermbg=NONE cterm=NONE
hi LineNr guifg=#7592b3 guibg=#1a202b guisp=#1a202b gui=NONE ctermfg=67 ctermbg=235 cterm=NONE
hi StatusLine guifg=#c4d8ff guibg=#28336e guisp=#28336e gui=bold ctermfg=153 ctermbg=17 cterm=bold
hi Normal guifg=#ebead9 guibg=#13131f guisp=#13131f gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE
hi Label guifg=#55AAFF guibg=NONE guisp=NONE gui=bold,italic ctermfg=75 ctermbg=NONE cterm=bold
"hi CTagsImport -- no settings --
hi PMenuSel guifg=#f5f0f4 guibg=#bd173e guisp=#bd173e gui=NONE ctermfg=255 ctermbg=1 cterm=NONE
hi Search guifg=#000020 guibg=#ffffff guisp=#ffffff gui=NONE ctermfg=17 ctermbg=15 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=#A9EE8A guibg=NONE guisp=NONE gui=NONE ctermfg=156 ctermbg=NONE cterm=italic
hi Statement guifg=#ff752b guibg=NONE guisp=NONE gui=bold ctermfg=221 ctermbg=NONE cterm=bold
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Comment guifg=#999aa1 guibg=#0d0c1a guisp=#0d0c1a gui=NONE ctermfg=247 ctermbg=234 cterm=NONE
hi Character guifg=#A9EE5A guibg=NONE guisp=NONE gui=bold,italic ctermfg=155 ctermbg=NONE cterm=bold
"hi TabLineSel -- no settings --
hi Number guifg=#a2be54 guibg=NONE guisp=NONE gui=italic ctermfg=202 ctermbg=NONE cterm=NONE
hi Boolean guifg=#ff9742 guibg=NONE guisp=NONE gui=bold,italic ctermfg=215 ctermbg=NONE cterm=bold
hi Operator guifg=#55AAFF guibg=NONE guisp=NONE gui=bold ctermfg=75 ctermbg=NONE cterm=bold
"hi CursorLine -- no settings --
"hi Union -- no settings --
"hi TabLineFill -- no settings --
hi Question guifg=#F4BB7E guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#F60000 guibg=NONE guisp=NONE gui=underline ctermfg=196 ctermbg=NONE cterm=underline
"hi VisualNOS -- no settings --
hi DiffDelete guifg=#f04a71 guibg=#331822 guisp=#331822 gui=NONE ctermfg=204 ctermbg=236 cterm=NONE
hi ModeMsg guifg=#404040 guibg=#C0C0C0 guisp=#C0C0C0 gui=NONE ctermfg=238 ctermbg=7 cterm=NONE
"hi CursorColumn -- no settings --
hi Define guifg=#F9449A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Function guifg=#f53451 guibg=NONE guisp=NONE gui=italic ctermfg=13 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#d2b48c guibg=#800080 guisp=#800080 gui=NONE ctermfg=180 ctermbg=90 cterm=NONE
hi PreProc guifg=#bd4c5f guibg=NONE guisp=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
"hi EnumerationName -- no settings --
hi Visual guifg=#1a0808 guibg=#f89cb9 guisp=#b85c69 gui=bold ctermfg=234 ctermbg=131 cterm=bold
hi MoreMsg guifg=#00ced1 guibg=#188F90 guisp=#188F90 gui=NONE ctermfg=44 ctermbg=30 cterm=NONE
"hi SpellCap -- no settings --
hi VertSplit guifg=#1c2661 guibg=#758da1 guisp=#758da1 gui=NONE ctermfg=17 ctermbg=109 cterm=NONE
hi Exception guifg=#55AAFF guibg=NONE guisp=NONE gui=bold,italic ctermfg=75 ctermbg=NONE cterm=bold
hi Keyword guifg=#55AAFF guibg=NONE guisp=NONE gui=bold,italic ctermfg=75 ctermbg=NONE cterm=bold
hi Type guifg=#55AAFF guibg=NONE guisp=NONE gui=bold ctermfg=75 ctermbg=NONE cterm=bold
"hi DiffChange -- no settings --
hi Cursor guifg=#e3e3e3 guibg=#D74141 guisp=#D74141 gui=NONE ctermfg=254 ctermbg=167 cterm=NONE
"hi SpellLocal -- no settings --
"hi Error -- no settings --
hi PMenu guifg=#c3b1e6 guibg=#38414d guisp=#38414d gui=NONE ctermfg=146 ctermbg=239 cterm=NONE
hi SpecialKey guifg=#BF9261 guibg=NONE guisp=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
hi Constant guifg=#a5d0ed guibg=NONE guisp=NONE gui=bold,underline ctermfg=153 ctermbg=NONE cterm=bold,underline
"hi DefinedName -- no settings --
hi Tag guifg=#A9EE8A guibg=NONE guisp=NONE gui=NONE ctermfg=156 ctermbg=NONE cterm=NONE
hi String guifg=#88e659 guibg=NONE guisp=NONE gui=italic ctermfg=113 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#a4a6a8 guisp=#a4a6a8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
"hi MatchParen -- no settings --
"hi LocalVariable -- no settings --
hi Repeat guifg=#55AAFF guibg=NONE guisp=NONE gui=bold,italic ctermfg=75 ctermbg=NONE cterm=bold
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
"hi Directory -- no settings --
hi Structure guifg=#55AAFF guibg=NONE guisp=NONE gui=bold,italic ctermfg=75 ctermbg=NONE cterm=bold
hi Macro guifg=#F9449A guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
"hi Underlined -- no settings --
hi DiffAdd guifg=#94cce8 guibg=#181840 guisp=#181840 gui=NONE ctermfg=110 ctermbg=17 cterm=NONE
"hi TabLine -- no settings --
hi mbenormal guifg=#cfbfad guibg=#2e2e3f guisp=#2e2e3f gui=NONE ctermfg=187 ctermbg=237 cterm=NONE
hi perlspecialstring guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi doxygenspecial guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi mbechanged guifg=#eeeeee guibg=#2e2e3f guisp=#2e2e3f gui=NONE ctermfg=255 ctermbg=237 cterm=NONE
hi mbevisiblechanged guifg=#eeeeee guibg=#4e4e8f guisp=#4e4e8f gui=NONE ctermfg=255 ctermbg=60 cterm=NONE
hi doxygensmallspecial guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi doxygenprev guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi perlspecialmatch guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi cformat guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi lcursor guifg=#404040 guibg=#8fff8b guisp=#8fff8b gui=NONE ctermfg=238 ctermbg=120 cterm=NONE
hi cursorim guifg=#404040 guibg=#8b8bff guisp=#8b8bff gui=NONE ctermfg=238 ctermbg=105 cterm=NONE
hi user2 guifg=#7070a0 guibg=#3e3e5e guisp=#3e3e5e gui=NONE ctermfg=103 ctermbg=60 cterm=NONE
hi doxygenspecialmultilinedesc guifg=#ad600b guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi taglisttagname guifg=#808bed guibg=NONE guisp=NONE gui=NONE ctermfg=105 ctermbg=NONE cterm=NONE
hi doxygenbrief guifg=#fdab60 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi mbevisiblenormal guifg=#cfcfcd guibg=#4e4e8f guisp=#4e4e8f gui=NONE ctermfg=252 ctermbg=60 cterm=NONE
hi user1 guifg=#00ff8b guibg=#3e3e5e guisp=#3e3e5e gui=NONE ctermfg=48 ctermbg=60 cterm=NONE
hi doxygenspecialonelinedesc guifg=#ad600b guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi doxygencomment guifg=#ad7b20 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi cspecialcharacter guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
"hi clear -- no settings --
hi doxygenparam guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
