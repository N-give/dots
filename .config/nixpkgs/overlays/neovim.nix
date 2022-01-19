self: super:
let
  catppuccin = super.vimUtils.buildVimPlugin {
    name = "catppuccin-nvim";
    src = super.fetchFromGitHub {
      owner = "catppuccin";
      repo = "nvim";
      rev = "a057633714b2fa69b8a9710002b26203d57941a7";
      sha256 = "0cj6q9ygbw9600xy1wkd8n4bk1xjhcz6b1a8523q08wc3876zn9k";
    };
  };

  commentnvim = super.vimUtils.buildVimPlugin {
    name = "commentnvim";
    src = super.fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "7a42ae3a1f7f6ce01e30e933075a442afce9e35d";
      sha256 = "0cj6q9ygbw9600xy1wkd8n4bk1xjhcz6b1a8523q08wc3876zn9k";
    };
  };
in
{
  neovim = super.neovim.override {
    viAlias = true;
    vimAlias = true;

    configure = {
      packages.myVimPackage = with super.vimPlugins; {
        start = [
          ale
          base16-vim
          catppuccin
          coc-nvim
          commentnvim
          packer-nvim
          telescope-nvim
          vim-surround
          vim-polyglot
          vim-easy-align
          vim-fugitive

          (nvim-treesitter.withPlugins (
            plugins: with plugins; [
              tree-sitter-bash
              tree-sitter-c
              tree-sitter-comment
              tree-sitter-css
              tree-sitter-haskell
              tree-sitter-html
              tree-sitter-javascript
              tree-sitter-json
              tree-sitter-julia
              tree-sitter-lua
              tree-sitter-markdown
              tree-sitter-nix
              tree-sitter-python
              tree-sitter-rust
              tree-sitter-tsx
              tree-sitter-typescript
              tree-sitter-yaml
            ]
          ))
        ];

        opt = [ ];
      };

      customRC = ''
        lua << EOF
          ${builtins.readFile ./neovim/init.lua}
        EOF

        " syntax on
        " filetype plugin indent on
        " set ttimeoutlen=10
        " set hidden
        " set wildmenu
        " set showcmd
        " set laststatus=2
        " set backspace=indent,eol,start
        " set autoindent
        " set confirm
        " set expandtab
        " set softtabstop=1
        " set tabstop=2
        " set shiftwidth=2
        " set smarttab
        " set showmatch
        " set hlsearch
        " set ignorecase
        " set smartcase
        " set textwidth=80
        " set mouse=a
        " set formatprg=""
        " set colorcolumn=80
        " set number relativenumber
        " set wrap

        " augroup numbertoggle
        "   autocmd!
        "   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        "   autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
        " augroup END

        " nnoremap <leader>w <C-w>
        " nnoremap <leader>bn :bn<CR>
        " nnoremap <leader>bp :bp<CR>
        " nnoremap <leader>bd :bd<CR>

        """""""
        " coc "
        """""""
        set cmdheight=1
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

        """""""
        " ale "
        """""""
        let g:ale_fixers = {
          \ '*': ['trim_whitespace'],
          \ 'javascript': ['eslint', 'prettier'],
          \ 'typescript': ['eslint', 'prettier'],
          \ 'rust': ['rustfmt'],
          \ 'python': ['autopep8'],
          \ 'cpp': ['clang-format'],
          \ 'haskell': ['brittany']
          \}
        let g:ale_fix_on_save=1
        highlight ALEWarning ctermbg=178 ctermfg=Black
        highlight ALEError ctermbg=160 ctermfg=Black

        """"""""""""""
        " easy align "
        """"""""""""""

        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)

        colorscheme catppuccin
        " if filereadable(expand("~/.vimrc_background"))
        "   let base16colorspace=256
        "   source ~/.vimrc_background
        " endif


        """"""""""""""
        " telescope "
        """"""""""""""
        " Find files using Telescope command-line sugar.
        " nnoremap <leader>ff <cmd>Telescope find_files<cr>
        " nnoremap <leader>fg <cmd>Telescope live_grep<cr>
        " nnoremap <leader>fb <cmd>Telescope buffers<cr>
        " nnoremap <leader>fh <cmd>Telescope help_tags<cr>

        " Using Lua functions
        " nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
        " nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
        " nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
        " nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
      '';
    };
  };
}
