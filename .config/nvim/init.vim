call plug#begin("$HOME/.config/nvim/plugged")
call plug#end()

map <Space> <leader>

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

au FileType markdown setl sw=4 sts=4 et textwidth=120

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" map Ctrl-Backspace to delete the previous word in insert mode
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Switch buffers
nnoremap <C-n> :bnext<CR>

" clear white space
autocmd BufWritePre * :%s/\s+$//e

" colors
colorscheme mytheme
