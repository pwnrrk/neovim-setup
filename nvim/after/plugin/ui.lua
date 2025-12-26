-- ~/.config/nvim/after/plugin/ui.lua
require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
})
require("lualine").setup()

require("gitsigns").setup()
require("Comment").setup()

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
})

-- Recommended Keymaps

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Telescope shortcuts:

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

vim.opt.number = true

vim.opt.tabstop = 2       -- number of visual spaces per TAB
vim.opt.shiftwidth = 2   -- spaces used for autoindent
vim.opt.softtabstop = 2  -- spaces inserted when pressing TAB
vim.opt.expandtab = true -- convert TAB to spaces
vim.opt.clipboard = "unnamedplus"

