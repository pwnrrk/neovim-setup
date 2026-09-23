local data_file = vim.fn.stdpath("state") .. "/theme.txt"

local function read_theme()
  local f = io.open(data_file, "r")
  if not f then return "catppuccin" end
  local name = f:read("*l")
  f:close()
  return (name and name ~= "") and name or "catppuccin"
end

local function write_theme(name)
  local f = io.open(data_file, "w")
  if f then
    f:write(name)
    f:close()
  end
end

local themes = {
  catppuccin = {
    plugin = "catppuccin",
    spec = { "catppuccin/nvim", name = "catppuccin" },
    apply = function()
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  tokyonight = {
    plugin = "tokyo-night",
    spec = { "folke/tokyonight.nvim", name = "tokyo-night" },
    apply = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  github_dark_default = {
    plugin = "github-theme",
    spec = { "projekt0n/github-nvim-theme", name = "github-theme" },
    apply = function()
      require("github-theme").setup({})
      vim.cmd.colorscheme("github_dark_default")
    end,
  },
  onedark = {
    plugin = "onedark.nvim",
    spec = { "navarasu/onedark.nvim" },
    apply = function()
      require("onedark").setup({ style = "dark", transparent = false, term_colors = true })
      require("onedark").load()
    end,
  },
  vscode = {
    plugin = "vscode",
    spec = { "Mofiqul/vscode.nvim", name = "vscode" },
    apply = function()
      require("vscode").setup()
      vim.cmd.colorscheme("vscode")
    end,
  },
  ayu = {
    plugin = "neovim-ayu",
    spec = { "Shatur/neovim-ayu" },
    apply = function()
      require("ayu").setup({})
      vim.cmd.colorscheme("ayu-dark")
    end,
  },
  nord = {
    plugin = "nord.nvim",
    spec = { "shaunsingh/nord.nvim", name = "nord" },
    apply = function()
      vim.cmd.colorscheme("nord")
    end,
  },
}

local current = read_theme()
if not themes[current] then current = "catppuccin" end

vim.api.nvim_create_user_command("Theme", function(opts)
  local name = opts.args
  if name == "" then
    print("Current: " .. current .. " | Available: " .. table.concat(vim.tbl_keys(themes), ", "))
    return
  end
  local t = themes[name]
  if not t then
    vim.notify("Unknown theme: " .. name, vim.log.levels.ERROR)
    return
  end
  require("lazy").load({ plugins = { t.plugin } })
  t.apply()
  current = name
  write_theme(name)
end, {
  nargs = "?",
  complete = function() return vim.tbl_keys(themes) end,
})

local specs = {}
for name, t in pairs(themes) do
  local spec = vim.deepcopy(t.spec)
  if name == current then
    spec.lazy = false
    spec.priority = 1000
    spec.config = t.apply
  else
    spec.lazy = true
  end
  table.insert(specs, spec)
end

return specs
