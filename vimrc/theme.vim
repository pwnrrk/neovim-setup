syntax on
if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
endif
lua <<EOF
local onedarkpro = require('onedarkpro')
onedarkpro.setup({
options = {
      transperency = true
      },
colors = {
      onedark = {
            bg = "#00000000"
            }
      }
})
onedarkpro.load()
EOF
