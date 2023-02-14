require('telescope').setup{
	pickers = {
    find_files = {
      theme = "dropdown",
    },
		git_files = {
      theme = "dropdown",
		},
		live_grep = {
      theme = "dropdown",
		}
  },
}

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<leader>fl', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffer<CR>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
