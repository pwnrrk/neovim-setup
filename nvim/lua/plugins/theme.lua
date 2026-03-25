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
--         flavour = "mocha"
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
return {
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    priority = 1000,
    config = function ()
      require("ayu").setup({})
      vim.cmd.colorscheme "ayu-dark"
    end
  }
}
