-- Base Setting
vim.opt.syntax = 'on'
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.cmd("set t_Co=256")
vim.opt.hlsearch = false
vim.opt.smartindent = true
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false

vim.opt.clipboard = "unnamedplus"

if vim.fn.has('win32') then
	vim.opt.shell = "pwsh"
	vim.opt.shellcmdflag = '-nologo -noprofile -ExecutionPolicy RemoteSigned -command'
	vim.opt.shellxquote = ''
end

vim.keymap.set('n', '<SPACE>', '<Nop>')
vim.g.mapleader = ' '
vim.cmd.colorscheme("onedark")
