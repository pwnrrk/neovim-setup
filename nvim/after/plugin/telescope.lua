local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "❯ ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      width = 0.9,
      height = 0.85,
      preview_cutoff = 120,
    },
    border = true,
    winblend = 0,
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },

  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

-- Find files
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })

-- Live grep (search text in files)
vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Find text" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

-- Search visual selection (live grep / find files)
local function get_visual_selection()
  local mode = vim.fn.mode()
  local region = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = mode })
  vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "nx", false)
  return table.concat(region, " ")
end

vim.keymap.set("v", "<C-f>", function()
  builtin.live_grep({ default_text = get_visual_selection() })
end, { desc = "Find selected text" })
vim.keymap.set("v", "<leader>fg", function()
  builtin.live_grep({ default_text = get_visual_selection() })
end, { desc = "Live grep selection" })
vim.keymap.set("v", "<leader>ff", function()
  builtin.find_files({ default_text = get_visual_selection() })
end, { desc = "Find files by selection" })



-- Open buffers
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })

-- Help
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

