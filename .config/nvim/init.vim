call plug#begin("$HOME/.config/nvim/plugged")
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'chriskempson/base16-vim'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'frazrepo/vim-rainbow'

Plug 'chriskempson/base16-vim'

" latex
Plug 'donRaphaco/neotex', { 'for': 'tex' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Deoplete and sources
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'zchee/deoplete-jedi'
" Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
" Plug 'sebastianmarkow/deoplete-rust'
" Plug 'Shougo/deoplete-clangx'
" Plug 'vim-scripts/superior-haskell-interaction-mode-shim'
call plug#end()

map <Space> <leader>

" indentLine settings
let g:indentLine_char = '|'
let g:indentLine_enable = 1
let g:indentLine_fileTypeExclude = ['markdown']

let g:rust_recommend_style=0

" ctrl-p
let g:ctrlp_map='<C-p>'

" airline settings
" let g:tagbar_ctags_bin = 1
let g:airline_detect_modified=1
let g:airline_detect_spell=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=1
set ttimeoutlen=10
" let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
" let g:airline_powerline_fonts=1
" let g:Powerline_symbols='fancy'

" editorconfig
let g:EditorConfig_disable_rules=['max_line_length']

" gitgutter
set updatetime=10

" ale
" let g:ale_lint_on_text_changed='always'
" let g:ale_lint_on_insert_leave=1
let g:ale_fix_on_save=1
let g:ale_lint_delay=50
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_fixers = {
      \ '*': ['trim_whitespace'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'rust': ['rustfmt'],
      \ 'python': ['autopep8'],
      \ 'cpp': ['clang-format'],
      \ 'haskell': ['brittany']
      \}

let g:ale_sign_error=''
let g:ale_sign_info=''
let g:ale_sign_warning=''

highlight ALEError ctermbg=Black ctermfg=Red
highlight ALEWarning ctermbg=Black ctermfg=Yellow
highlight ALEInfo ctermbg=Black ctermfg=White

" let g:ale_list_window_size=5
" let g:ale_open_list=1
" let g:ale_set_quickfix=1
" let g:ale_set_loclist=0

nmap <silent> <leader>ane <Plug>(ale_next_wrap_error)
nmap <silent> <leader>ape <Plug>(ale_previous_wrap_error)
nmap <silent> <leader>anw <Plug>(ale_next_wrap_warning)
nmap <silent> <leader>apw <Plug>(ale_previous_wrap_warning)
nmap <silent> <leader>ad :ALEDetail<cr>
nmap <silent> <leader>co :copen<cr>
nmap <silent> <leader>cc :cclose<cr>
nmap <silent> <leader>lo :lopen<cr>
nmap <silent> <leader>lc :lclose<cr>

" auto close loclist with buffer
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" base 16
set background=dark
let base16colorspace=256

" airline theme
" let g:airline_theme = 'angr'
let g:airline_theme = 'atomic'
" let g:airline_theme='test_theme.vim'

"""""""
" coc "
"""""""
set cmdheight=2
set updatetime=200
set shortmess+=c
set signcolumn=yes

nmap <silent> gd <Plug>(coc-definition)
" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

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

"" language client
" let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper', '--lsp'] }

""""""""""""
" deoplete "
""""""""""""
" let g:deoplete#enable_at_startup=1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete clangx


" deoplete-jedi
let g:python3_host_prog='/usr/bin/python'
" let g:deoplete#sources#jedi#enable_typeinfo=1
" let g:deoplete#sources#jedi#show_docstring=1
" let g:deoplete#sources#jedi#python_path='python3'
" let g:deoplete#sources#jedi#python_path='/usr/bin/python3'

" deoplete rust
" if $USER == "ngivens"
"   let g:deoplete#sources#rust#racer_binary='/home/ngivens/.cargo/bin/racer'
"   let g:deoplete#sources#rust#rust_source_path='/home/ngivens/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
" elseif $USER == "nate"
"   let g:deoplete#sources#rust#racer_binary='/home/nate/.cargo/bin/racer'
"   let g:deoplete#sources#rust#rust_source_path='/home/nate/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
" endif

" let g:deoplete#sources#rust#documentation_max_height=20
" let g:deoplete#sources#rust#disable_keymap=1

" nmap <buffer> gd <plug>DeopleteRustGoToDefinitionSplit
" nmap <buffer> K <plug>DeopleteRustShowDocumentation

" deoplete_tern
" let g:deoplete#sources#ternjs#tern_bin='/home/nate/.nvm/versions/node/v13.1.0/bin/ternjs'
" let g:deoplete#sources#ternjs#timeout=1
" let g:deoplete#sources#ternjs#case_insensitive=1
" let g:deoplete#sources#ternjs#filetypes=["jsx","javascript.sx","react"]

" vimwiki
let g:vimwiki_list = [
    \{'path': '~/vimwiki/', 'syntax': 'markdown'},
    \{'path': '~/learning_rust/', 'syntax': 'markdown'}
  \]

let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c':'c', 'Rust':'rust'}
let wiki.path = '~/vimwiki/'
let g:vimwiki_list = [wiki]

au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <Leader>d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <Leader>c :call ToggleCalendar()

" set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set hidden
set wildmenu
set showcmd
set backspace=indent,eol,start
set autoindent
set confirm
set expandtab
set softtabstop=0
set tabstop=2
set shiftwidth=2
set smarttab
syntax on
filetype plugin indent on
set showmatch
set hlsearch
set ignorecase
set smartcase
set textwidth=80
set mouse=a
set formatprg=""
set colorcolumn=80

autocmd BufNewFile,BufRead *.hs,*.lhs set formatprg=hindent
au FileType csv,markdown setl sw=2 sts=2 et textwidth=120

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

"                          "
" alternative key bindings "
"                          "

nnoremap <leader>w <C-w>

" map Ctrl-Backspace to delete the previous word in insert mode
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Switch buffers
nnoremap <C-n> :bnext<CR>

" NERDTree Toggle
nnoremap <F8> :NERDTreeToggle<CR>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" clear white space
" autocmd BufWritePre * :%s/\s+$//e

" base16
" colorscheme base16_default-dark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" latex
let g:tex_flavor = 'latex'

" vim-rainbow
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
