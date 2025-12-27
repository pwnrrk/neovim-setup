require("nvim-autopairs").setup({
  check_ts = true, -- use treesitter
  ts_config = {
    javascript = { "template_string" },
    typescript = { "template_string" },
    javascriptreact = { "template_string" },
    typescriptreact = { "template_string" },
  },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
})
