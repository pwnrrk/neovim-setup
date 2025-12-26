require("bufferline").setup({
  options = {
    mode = "buffers", -- buffers | tabs
    numbers = "none",
    diagnostics = "nvim_lsp",
    separator_style = "thin", -- slant | thick | thin
    show_buffer_close_icons = true,
    show_close_icon = false,
    always_show_bufferline = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true,
      },
    },
  },
})

-- Switch buffers
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")

-- Close buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

-- Pick buffer by letter
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>")
