-- vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use({
      "catppuccin/nvim",
      as = "catppuccin"
    })
end)
