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
vim.opt.hlsearch = false
vim.opt.smartindent = true
vim.keymap.set('n', '<SPACE>', '<Nop>')
vim.g.mapleader = ' '
vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
