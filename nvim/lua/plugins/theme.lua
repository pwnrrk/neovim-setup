-- Github
-- return {
--   'projekt0n/github-nvim-theme',
--   name = 'github-theme',
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('github-theme').setup({
--       -- ...
--     })
--
--     vim.cmd('colorscheme github_dark_default')
--   end,
-- }

-- Tokyo Night
-- return {
--   'folke/tokyonight.nvim',
--   name = 'tokyo-night',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd('colorscheme tokyonight')
--   end,
-- }

-- Onedark
-- return {
--   {
--     "navarasu/onedark.nvim",
--     priority = 1000, -- load before everything else
--     config = function()
--       require("onedark").setup({
--         style = "dark", -- dark | darker | cool | deep | warm | warmer
--         transparent = false, -- set true if you want Hyprland transparency
--         term_colors = true,
--       })
--       require("onedark").load()
--     end,
--   },
-- }

-- Catppuccin
-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--       require("catppuccin").setup({
--         flavour = "macchiato"
--       })
--       vim.cmd.colorscheme "catppuccin"
--     end
--   }
-- }

-- VS Code
-- return {
--   {
--     "Mofiqul/vscode.nvim",
--     name = "vscode",
--     priority = 1000,
--     config = function ()
--       require("vscode").setup()
--       vim.cmd.colorscheme "vscode"
--     end
--   }
-- }

-- Ayu
-- return {
--   {
--     "Shatur/neovim-ayu",
--     name = "ayu",
--     priority = 1000,
--     config = function ()
--       require("ayu").setup({})
--       vim.cmd.colorscheme "ayu-dark"
--     end
--   }
-- }

-- Base 16
return {
  "tinted-theming/tinted-nvim",
  priority = 1000,
  lazy = false,
  opts = {
    default_scheme = "base16-twilight",
  },
}
