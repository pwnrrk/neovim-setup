-- ~/.config/nvim/after/plugin/lsp.lua
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "eslint",
    "html",
    "cssls",
    "jsonls",
    "emmet_ls",
    "dockerls",
    "yamlls"
  },
})
local navic = require("nvim-navic")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- keymaps (buffer-local)
    local opts = { buffer = buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    if not client then
      return
    end

    -- document highlight
    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, buf)
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
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN]  = ' ',
      [vim.diagnostic.severity.INFO]  = ' ',
      [vim.diagnostic.severity.HINT]  = ' ',
    },
    -- You can also define the highlight groups here, or link them separately
    -- through standard highlight commands.
  },
})

vim.opt.updatetime = 300


-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
})

-- ESLint
vim.lsp.config("eslint", {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro", "htmlangular" },
  root_markers = {
    "eslint.config.js",
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.json",
    "package.json",
  },
  settings = {
    workingDirectory = { mode = "auto" },
    validate = "on",
    format = false,
    nodePath = "",
    experimental = {
      useFlatConfig = false,
    },
    problems = {},
    rulesCustomizations = {},
  },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- HTML
vim.lsp.config("html", {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  capabilities = capabilities,
})

-- CSS
vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  capabilities = capabilities,
})

-- JSON
vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  capabilities = capabilities,
})

-- Emmet
vim.lsp.config("emmet_ls", {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "less",
    "scss",
    "javascriptreact",
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

-- Docker
vim.lsp.config("dockerls", {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = {"Dockerfile", "dockerfile"};
})

-- Yaml file
vim.lsp.config("yamlls", {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" }
})
