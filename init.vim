" NeoVim configuration file by Steven Goodgrove

" {{{ global Vim-native settings
"
" Set spelling language
:set spelllang=en_gb

" Enable relative line numbers
:set rnu
" }}}
" {{{ vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" For async completion
Plug 'Shougo/deoplete.nvim'

" For Denite features
Plug 'Shougo/denite.nvim'

call plug#end()
" }}}
" {{{ deoplete
let g:deoplete#enable_at_startup=1
" }}}

" vim:foldmethod=marker:foldlevel=0
