call plug#begin("$HOME/.config/nvim/plugged")
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'chriskempson/base16'
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
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
" Deoplete and sources
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/deoplete-clangx'
call plug#end()

map <Space> <leader>

" vimwiki
nmap <silent> <leader>vwh :Vimwiki2HTML<cr>

" indentLine settings
let g:indentLine_char = '|'
let g:indentLine_enable = 1


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
let g:ale_lint_on_text_changed='always'
let g:ale_lint_on_insert_leave=1
let g:ale_fix_on_save=1
let g:ale_lint_delay=50
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'rust': ['rustfmt']
      \}

let g:ale_sign_error=''
let g:ale_sign_info=''
let g:ale_sign_warning=''
let g:ale_open_list=1
let g:ale_list_window_size=5
let g:ale_set_quickfix=1
let g:ale_set_loclist=0

nmap <silent> <leader>ane <Plug>(ale_next_wrap_error)
nmap <silent> <leader>ape <Plug>(ale_previous_wrap_error)
nmap <silent> <leader>anw <Plug>(ale_next_wrap_warning)
nmap <silent> <leader>apw <Plug>(ale_previous_wrap_warning)
nmap <silent> <leader>ad :ALEDetail<cr>

" base 16
set background=dark
let base16colorspace=256

" airline theme
" let g:airline_theme = 'angr'
let g:airline_theme='mytheme'

""""""""""""
" deoplete "
""""""""""""
let g:deoplete#enable_at_startup=1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete clangx


" deoplete-jedi
let g:deoplete#sources#jedi#enable_typeinfo=1
let g:deoplete#sources#jedi#show_docstring=1
let g:deoplete#sources#jedi#python_path='/usr/bin/python3'

" deoplete rust
if $USER == "ngivens"
  let g:deoplete#sources#rust#racer_binary='/home/ngivens/.cargo/bin/racer'
  let g:deoplete#sources#rust#rust_source_path='/home/ngivens/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
elseif $USER == "nate"
  let g:deoplete#sources#rust#racer_binary='/home/nate/.cargo/bin/racer'
  let g:deoplete#sources#rust#rust_source_path='/home/nate/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
endif

let g:deoplete#sources#rust#documentation_max_height=20
" let g:deoplete#sources#rust#disable_keymap=1

" nmap <buffer> gd <plug>DeopleteRustGoToDefinitionSplit
" nmap <buffer> K <plug>DeopleteRustShowDocumentation

" deoplete_tern
let g:deoplete#sources#ternjs#tern_bin='/home/nate/.nvm/versions/node/v10.4.0/lib/tern_bin'
let g:deoplete#sources#ternjs#timeout=1
let g:deoplete#sources#ternjs#case_insensitive=1
let g:deoplete#sources#ternjs#filetypes=["jsx","javascript.sx","vue","react"]

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
" set number
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
" let g:polyglot_disabled=['rust', 'rs']
set textwidth=80

au FileType markdown setl sw=4 sts=4 et textwidth=120

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

"                          "
" alternative key bindings "
"                          "

" Switch buffers
nnoremap <C-n> :bnext<CR>

" NERDTree Toggle
nnoremap <F8> :NERDTreeToggle<CR>

" clear white space
autocmd BufWritePre * :%s/\s+$//e

" colors
colorscheme mytheme
