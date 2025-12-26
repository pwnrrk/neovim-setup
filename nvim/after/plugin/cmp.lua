-- ~/.config/nvim/after/plugin/cmp.lua
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local lspkind = require("lspkind")

lspkind.init({
  symbol_map = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "󰕳",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
  },
})

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      -- icons + kind text
      vim_item.kind = lspkind.symbolic(vim_item.kind, {
        mode = "symbol",
      })

      -- source labels (VS Code style)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer   = "[Buffer]",
        path     = "[Path]",
        luasnip  = "[Snippet]",
        npm      = "[npm]",
      })[entry.source.name]

      return vim_item
    end,
    fields = { "kind", "abbr", "menu" },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  window = {
    completion = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None",
    }),
  },
})

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)
