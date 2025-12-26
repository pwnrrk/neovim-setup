-- ~/.config/nvim/after/plugin/lsp.lua
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "jsonls",
    "emmet_ls"
  },
})


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "eslint" then
      if not vim.fs.find({ ".eslintrc", "eslint.config.js" }, {
        upward = true,
        path = vim.api.nvim_buf_get_name(args.buf),
      })[1] then
      vim.lsp.stop_client(client.id)
    end
  end
end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      border = "rounded",
      source = "always",
    })
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- could be "■", "▎", ""
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.open_float(nil, { border = "rounded" })
end, { desc = "Line diagnostics" })

local signs = {
  Error = " ",
  Warn  = " ",
  Hint  = " ",
  Info  = " ",
}

for type, icon in pairs(signs) do
  vim.fn.sign_define("DiagnosticSign" .. type, {
    text = icon,
    texthl = "DiagnosticSign" .. type,
    numhl = "",
  })
end

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.diagnostic.config({
  virtual_text = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  severity_sort = true,
})

vim.opt.updatetime = 300


-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = { "package.json", "tsconfig.json", ".git" },
})

-- ESLint
vim.lsp.config("eslint", {
  cmd = { "vscode-eslint-language-server", "--stdio" },

  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },

  root_markers = {
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.json",
    "eslint.config.js",
    "package.json",
    ".git",
  },

  settings = {
    validate = "on",
    format = false, -- IMPORTANT: let prettier handle formatting
  },
})

-- HTML
vim.lsp.config("html", {
  filetypes = { "html" },
})

-- CSS
vim.lsp.config("cssls", {
  filetypes = { "css", "scss", "less" },
})

-- JSON
vim.lsp.config("jsonls", {
  filetypes = { "json" },
})

-- Emmet
vim.lsp.config("emmet_ls", {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})
