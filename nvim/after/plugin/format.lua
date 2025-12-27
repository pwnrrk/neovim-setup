-- ~/.config/nvim/after/plugin/format.lua
require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
  },
})

vim.keymap.set("n", "<leader>fm", function()
  require("conform").format({ async = true })
end)

