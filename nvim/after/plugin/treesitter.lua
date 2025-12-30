-- ~/.config/nvim/after/plugin/treesitter.lua
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 
    "c",
    "lua",
    "html",
    "css",
    "javascript",
    "jsx",
    "typescript",
    "tsx",
    "json",
    "docker",
    "yaml",
  },
  callback = function() vim.treesitter.start() end,
})

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
