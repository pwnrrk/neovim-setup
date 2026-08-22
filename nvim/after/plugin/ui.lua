-- ~/.config/nvim/after/plugin/ui.lua
require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
})

local function get_hl(name, attr)
  local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
  return hl[attr] and string.format('#%06x', hl[attr]) or nil
end

local colors = {
  bg     = get_hl('TabLine', 'bg') or get_hl('Normal', 'bg') or '#1e1e1e',
  fg     = get_hl('Normal', 'fg') or '#ffffff',
  fg_dim = get_hl('Comment', 'fg') or '#808080',
}

local vscode_theme = {
  normal = {
    a = { bg = colors.bg, fg = colors.fg },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg_dim },
  },
  insert   = { a = { bg = colors.bg, fg = colors.fg } },
  visual   = { a = { bg = colors.bg, fg = colors.fg } },
  replace  = { a = { bg = colors.bg, fg = colors.fg } },
  command  = { a = { bg = colors.bg, fg = colors.fg } },
  inactive = {
    a = { bg = colors.bg_alt, fg = colors.fg_dim },
    b = { bg = colors.bg_alt, fg = colors.fg_dim },
    c = { bg = colors.bg_alt, fg = colors.fg_dim },
  },
}

require("lualine").setup{
  options = {
    theme = vscode_theme,
    component_separators = '',
    section_separators = '',   -- flat, no arrows — key VS Code trait
    globalstatus = true,       -- single statusline across all splits, like VS Code
  },
  sections = {
    lualine_a = {},
    lualine_b = {
      {
        'branch',
        icon = '',
      },
      {
        'diagnostics',
      },
    },
    lualine_c = {
      {
        'filename',
        path = 0, -- just filename, no path (VS Code shows this in the tab, not status bar)
        symbols = { modified = ' ●', readonly = ' 🔒' },
      },
    },
    lualine_x = {
      'filetype',
    },
    lualine_y = {
      'encoding',
      { 'fileformat', symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' } },
    },
    lualine_z = {
      { 'location', icon = '' }, -- line:col, VS Code style
    },
  },
  inactive_sections = {
    lualine_c = { { 'filename', path = 0 } },
    lualine_x = { 'location' },
  },
}

require("gitsigns").setup()
require("Comment").setup()
require("ibl").setup({
  indent = { char = "│" },
})

-- require("noice").setup({
  --   lsp = {
    --     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --     override = {
      --       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      --       ["vim.lsp.util.stylize_markdown"] = true,
      --       ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      --     },
      --   },
      --   -- you can enable a preset for easier configuration
      --   presets = {
        --     bottom_search = true, -- use a classic bottom cmdline for search
        --     command_palette = true, -- position the cmdline and popupmenu together
        --     long_message_to_split = true, -- long messages will be sent to a split
        --     inc_rename = false, -- enables an input dialog for inc-rename.nvim
        --     lsp_doc_border = true, -- add a border to hover docs and signature help
        --   },
        -- })

        -- Recommended Keymaps

        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
        vim.keymap.set("n", "<leader>w", ":w<CR>")
        vim.keymap.set("n", "<leader>q", ":q<CR>")

        -- Telescope shortcuts:

        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
        vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

        vim.opt.number = true

        -- vim.opt.tabstop = 2       -- number of visual spaces per TAB
        -- vim.opt.shiftwidth = 2   -- spaces used for autoindent
        -- vim.opt.softtabstop = 2  -- spaces inserted when pressing TAB
        vim.opt.expandtab = true -- convert TAB to spaces
        vim.opt.clipboard = "unnamedplus"
        vim.opt.wrap = false
