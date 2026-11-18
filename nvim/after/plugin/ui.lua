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
        -- icon = '',
      },
      {
        'diff'
      },
      {
        'diagnostics',
      },
    },
    lualine_c = {
      -- {
      --   'filename',
      --   path = 0, -- just filename, no path (VS Code shows this in the tab, not status bar)
      --   symbols = { modified = ' ●', readonly = ' 🔒' },
      -- },
    },
    lualine_x = {
      { 'location', icon = '' }, -- line:col, VS Code style
    },
    lualine_y = {
      'encoding',
      { 'fileformat', symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' } },
    },
    lualine_z = {
      'filetype',
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
vim.opt.autoread = true

-- Copy "@relative/path#L<start>-<end>" for the current buffer's file (Copilot CLI ref)
local function copilot_ref()
  local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
  if path == "" then
    vim.notify("Buffer has no file", vim.log.levels.WARN)
    return
  end

  local mode = vim.fn.mode()
  local ref
  if mode == "v" or mode == "V" or mode == "\22" then
    local s, e = vim.fn.line("v"), vim.fn.line(".")
    if s > e then s, e = e, s end
    ref = (s == e) and ("@%s#L%d"):format(path, s) or ("@%s#L%d-%d"):format(path, s, e)
    vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "n", false) -- leave visual mode
  else
    ref = ("@%s#L%d"):format(path, vim.fn.line("."))
  end

  vim.fn.setreg("+", ref)
  vim.notify("Copied: " .. ref)
end

vim.keymap.set({ "n", "x" }, "<leader>cr", copilot_ref, { desc = "Copy Copilot CLI file/range ref" })
