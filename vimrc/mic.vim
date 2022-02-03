"General
syntax on
set mouse=a
set number
set signcolumn=yes
set nowrap
set sidescroll=1
filetype indent on
filetype plugin indent on
let NERDTreeShowHidden=1
set cmdheight&
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"set t_Co=256


"Ale
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
let g:ale_sign_hint = ''

"Coc
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-styled-components'
      \ ]

"Close tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascriptreact': 'jsxRegion',
      \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"Lua plugin
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
ensure_installed = "maintained",

-- Install languages synchronously (only applied to `ensure_installed`)
sync_install = false,

-- List of parsers to ignore installing
-- ignore_install = { "javascript" },

highlight = {
  -- `false` will disable the whole extension
enable = true,

-- list of language that will be disabled
-- disable = { "c", "rust" },

-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
-- Using this option may slow down your editor, and you may see some duplicate highlights.
-- Instead of true it can also be a list of languages
additional_vim_regex_highlighting = false,
},
}
EOF

let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 0 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 0 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_change_dir_global = 0 "0 by default, use :cd when changing directories.
let g:nvim_tree_disable_window_picker = 0 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_respect_buf_cwd = 0 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
      \   'filetype': [
        \     'notify',
        \     'packer',
        \     'qf'
        \   ],
        \   'buftype': [
          \     'terminal'
          \   ]
          \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
      \ 'git': 1,
      \ 'folders': 1,
      \ 'files': 1,
      \ 'folder_arrows': 1,
      \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
      \ 'default': '',
      \ 'symlink': '',
      \ 'git': {
        \   'unstaged': "✗",
        \   'staged': "✓",
        \   'unmerged': "",
        \   'renamed': "➜",
        \   'untracked': "★",
        \   'deleted': "",
        \   'ignored': "◌"
        \   },
        \ 'folder': {
          \   'arrow_open': "",
          \   'arrow_closed': "",
          \   'default': "",
          \   'open': "",
          \   'empty': "",
          \   'empty_open': "",
          \   'symlink': "",
          \   'symlink_open': "",
          \   }
          \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><mymap> :BufferLineMoveNext<CR>
nnoremap <silent><mymap> :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>


lua <<EOF
require('nord').set()
require('lualine').setup({
options = {
  theme = 'nord'
  }
})
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
  enable = true,
  auto_open = true,
  },
diagnostics = {
enable = false,
icons = {
  hint = "",
  info = "",
  warning = "",
  error = "",
  }
},
  update_focused_file = {
  enable      = false,
  update_cwd  = false,
  ignore_list = {}
  },
system_open = {
  cmd  = nil,
  args = {}
  },
filters = {
  dotfiles = false,
  custom = {}
  },
git = {
enable = true,
ignore = true,
timeout = 500,
},
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
      },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
    },
  trash = {
    cmd = "trash",
    require_confirm = true
    }
  }

require('bufferline').setup {
  options = {
    numbers = "ordinal",
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
          middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
            -- NOTE: this plugin is designed with this icon in mind,
            -- and so changing this is NOT recommended, this is intended
            -- as an escape hatch for people who cannot bear it for whatever reason
            indicator_icon = '▎',
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            --- name_formatter can be used to change the buffer's label in the bufferline.
            --- Please note some names can/will break the
            --- bufferline so use this at your discretion knowing that it has
            --- some limitations that will *NOT* be fixed.
            name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match('%.md') then
              return vim.fn.fnamemodify(buf.name, ':t:r')
            end
          end,
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
          tab_size = 18,
          diagnostics = "coc",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number, buf_numbers)
        -- filter out filetypes you don't want to see
        if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
          return true
        end
        -- filter out by buffer name
        if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
          return true
        end
        -- filter out based on arbitrary rules
        -- e.g. filter out vim wiki buffer from tabline in your work repo
        if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
          return true
        end
        -- filter out by it's index number in list (don't show first buffer)
        if buf_numbers[1] ~= buf_number then
          return true
        end
      end,
      offsets = {{filetype = "NvimTree", text = "File Explorer" , text_align = "left"}},
      show_buffer_icons = true , -- disable filetype icons for buffers
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    }
  }
EOF

" lua <<EOF
" local onedarkpro = require('onedarkpro')
" onedarkpro.setup({
" colors = {
  "   onedark = {
    "     bg = "#282C34"
    "     }
    "   }
    " })
    " onedarkpro.load()
    " EOF
