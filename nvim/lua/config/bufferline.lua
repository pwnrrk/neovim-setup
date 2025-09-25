require("bufferline").setup{
	options = {
		diagnostics = "coc"
	}
}
vim.keymap.set('n', 'gt', ':BufferLineCycleNext<CR>', {silent = true})
vim.keymap.set('n', 'gT', ':BufferLineCyclePrev<CR>', {silent = true})
vim.keymap.set('n', 'mn', ':BufferLineMoveNext<CR>', {silent = true})
vim.keymap.set('n', 'mb', ':BufferLineMovePrev<CR>', {silent = true})
