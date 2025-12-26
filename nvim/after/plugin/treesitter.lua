-- ~/.config/nvim/after/plugin/treesitter.lua
require("nvim-treesitter").setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "json",
    "html",
    "css",
    "scss",
    "lua",
    "bash",
  },
  highlight = { enable = true },
  indent = { enable = true },
})

