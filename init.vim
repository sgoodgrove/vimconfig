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

" CSS colours
Plug 'chrisbra/Colorizer'

" Syntastic
Plug 'shmup/vim-sql-syntax'

" Automatic closing of quotes, parenthesis, brackets etc
Plug 'Raimondi/delimitMate'

" Tagbar
Plug 'majutsushi/tagbar'

" The unite or unite.vim plug-in can search and display information from arbitrary sources like files, buffers, recently used files or registers.
Plug 'Shougo/unite'

" Markdown
Plug 'plasticboy/vim-markdown'

" Surround
Plug 'tpope/vim-surround'
" F#
Plug 'kongo2002/fsharp-vim'

" extended % matching (HTML)
Plug 'tmhedberg/matchit'

" NERDTree
Plug 'scrooloose/nerdtree'

" OmniSharp
Plug 'OmniSharp/omnisharp-vim'

" SQL syntax
Plug 'shmup/vim-sql-syntax'

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
