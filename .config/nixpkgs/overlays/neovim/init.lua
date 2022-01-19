require('packer').startup(function()
  use({
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup({
            styles = {
              comments = "italic",
              functions = "italic",
              keywords = "NONE",
              strings = "NONE",
              variables = "NONE",
            },
          })
      end
    })

  use({
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  })
end)

vim.g.mapleader = " "

vim.opt.syntax = "on"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.backspace = "indent,eol,start"
vim.opt.autoindent = true
vim.opt.confirm = true
vim.opt.softtabstop = 1
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.textwidth = 80
vim.opt.mouse = "a"
vim.opt.formatprg=""
vim.opt.colorcolumn="80"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true

-- XXX
-- vim.bo.filetype = "plugin indent on"

vim.wo.colorcolumn = '80'

vim.api.nvim_exec([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  augroup END
]], false)

vim.api.nvim_set_keymap('n', '<Leader>w', '<C-w>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>bn', ':bn<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>bp', ':bp<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bd<CR>', { noremap = true, silent = true})

--[[
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]]

vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true, silent = true })

