return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- load before everything else
    config = function()
      require("onedark").setup({
        style = "dark", -- dark | darker | cool | deep | warm | warmer
        transparent = false, -- set true if you want Hyprland transparency
        term_colors = true,
      })
      require("onedark").load()
    end,
  },
}

