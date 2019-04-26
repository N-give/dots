" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Nathan Givens <nate.givens03@gmail.com>
" Last Change:	26 Apr 19

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mytheme"
" TODO
"  Group        term            ctermbg             ctermfg

hi Normal		                ctermbg=Black       ctermfg=7
hi Comment      term=bold       ctermbg=Black       ctermfg=8
hi Constant		term=underline  ctermbg=Black       ctermfg=LightGreen
hi String		term=underline  ctermbg=Black       ctermfg=140
hi Number		term=underline  ctermbg=Black       ctermfg=45
hi Boolean		term=underline  ctermbg=Black       ctermfg=49
hi Identifier	term=underline  ctermbg=Black       ctermfg=147
hi Ignore					    ctermbg=Black       ctermfg=black
hi PreProc		term=underline  ctermbg=Black       ctermfg=67
hi Search		term=reverse    ctermbg=193
hi Operator		term=bold	                        ctermfg=7
hi Special		term=bold	                        ctermfg=159
hi Statement	term=bold	                        ctermfg=121
hi Type						                        ctermfg=153
hi Error		term=reverse    ctermbg=Red	        ctermfg=White
hi Todo			term=standout   ctermbg=NONE        ctermfg=1
" From the source:
hi Cursor										    guifg=Orchid	guibg=fg
hi Directory	term=bold	    ctermfg=LightCyan    guifg=Cyan
hi ErrorMsg		term=standout   ctermbg=DarkRed	    ctermfg=White guibg=Red guifg=White
hi IncSearch	term=reverse    cterm=reverse	    gui=reverse
hi LineNr		term=underline                      ctermfg=8
hi ModeMsg		term=bold	    cterm=bold		    gui=bold
hi MoreMsg		term=bold	    ctermfg=LightGreen   gui=bold		guifg=SeaGreen
hi NonText		term=bold	    ctermfg=Blue		    gui=bold		guifg=Blue
hi Question		term=standout   ctermfg=LightGreen   gui=bold		guifg=Cyan
hi SpecialKey	term=bold	    ctermfg=LightBlue    guifg=Cyan
hi StatusLine	term=reverse,bold cterm=reverse     gui=NONE		guifg=White guibg=darkblue
hi StatusLineNC term=reverse    cterm=reverse	  gui=NONE		guifg=white guibg=#333333
hi Title		term=bold	    ctermfg=LightMagenta gui=bold	guifg=Pink
hi WarningMsg	term=standout   ctermfg=LightRed   guifg=Red
hi Visual       term=reverse    ctermfg=White
