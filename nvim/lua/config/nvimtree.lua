require("nvim-tree").setup{
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>')
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>')
