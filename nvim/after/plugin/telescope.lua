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

-- Open buffers
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })

-- Help
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

