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

hi Normal		                ctermbg=234         ctermfg=250
hi Comment      term=NONE       ctermbg=234         ctermfg=8
hi Constant		term=underline  ctermbg=234         ctermfg=LightGreen
hi String		term=underline  ctermbg=234         ctermfg=140
hi Number		term=underline  ctermbg=234         ctermfg=45
hi Boolean		term=underline  ctermbg=234         ctermfg=49
hi Identifier	term=underline  ctermbg=234         ctermfg=147
hi Ignore					    ctermbg=234         ctermfg=black
hi PreProc		term=underline  ctermbg=234         ctermfg=67
hi Search		term=reverse    ctermbg=193
hi Operator		term=NONE	                        ctermfg=7
hi Special		term=NONE	                        ctermfg=159
hi Statement	term=NONE	                        ctermfg=114
hi Type						                        ctermfg=153
hi Error		term=reverse    ctermbg=None        ctermfg=1
hi Todo			term=standout   ctermbg=NONE        ctermfg=1
" From the source:
hi Cursor										    guifg=Orchid	guibg=fg
hi Directory	term=NONE	    ctermfg=LightCyan   guifg=Cyan
hi ErrorMsg		term=standout   ctermbg=DarkRed	    ctermfg=White guibg=Red guifg=White
hi IncSearch	term=reverse    cterm=reverse	    gui=reverse
hi LineNr		term=underline                      ctermfg=8
hi ModeMsg		term=NONE	    cterm=NONE		    gui=NONE
hi MoreMsg		term=NONE	    ctermfg=LightGreen  gui=NONE		guifg=SeaGreen
hi NonText		term=NONE	    ctermfg=Blue		gui=NONE		guifg=Blue
hi Question		term=standout   ctermfg=LightGreen  gui=NONE		guifg=Cyan
hi SpecialKey	term=NONE	    ctermfg=LightBlue   guifg=Cyan
hi StatusLine	term=reverse,NONE cterm=reverse     gui=NONE		guifg=White guibg=darkblue
hi StatusLineNC term=reverse    cterm=reverse	    gui=NONE		guifg=white guibg=#333333
hi Title		term=NONE	    ctermfg=LightMagenta gui=NONE	    guifg=Pink
hi WarningMsg	term=standout   ctermfg=LightRed    guifg=Red
hi Visual       term=reverse    ctermfg=White

" Ale highlighting maybe
hi ALEError                     ctermbg=238         ctermfg=None
hi ALEWarning                   ctermbg=238         ctermfg=None
hi ALEInfo                      ctermbg=81          ctermfg=0
