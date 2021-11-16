" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Custom Plugin
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-prettier'
  \ ]
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"THEME
Plug 'joshdick/onedark.vim'
" Initialize plugin system
call plug#end()

