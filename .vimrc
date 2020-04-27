" NeoVim configuration file by Steven Goodgrove

" {{{ global Vim-native settings

" {{{ Windows specific settings
if has("win32")
	" Set python 3 location
	let g:python3_host_prog = 'C:\Users\steven.goodgrove\AppData\Local\Programs\Python\Python37-32\python.exe'
endif
" }}}

" Set spelling language
:set spelllang=en_gb

" Enable relative line numbers
:set rnu

" Set color scheme
colorscheme koehler

" Set font
if (has("win32"))
    :set gfn=Fantasque_Sans_Mono:h12
endif

" Allows for file-specific settings
" :help modeline
set modeline

:set colorcolumn=81,121
:set cursorline
:set showmatch " show matching braces

:set shiftwidth=4
:set tabstop=4
:set tw=0
:set expandtab " use spaces instead of tabs
:set lazyredraw " don't redraw for macros and such
"

" }}}
" {{{ vim-plug

if has("win32")
    call plug#begin('~/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'quramy/tsuquyomi'
" Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colour schemes
Plug 'nanotech/jellybeans.vim'
Plug 'Rigellute/shades-of-purple.vim'

" Neomake
Plug 'neomake/neomake'

" Searching
Plug 'mileszs/ack.vim'

" Slack Markdown
Plug 'uptech/vim-slack-format'

" CSS colours
Plug 'chrisbra/Colorizer'

" Syntastic
Plug 'shmup/vim-sql-syntax'

" Automatic closing of quotes, parenthesis, brackets etc.
Plug 'Raimondi/delimitMate'

" Tagbar
Plug 'majutsushi/tagbar'

" The unite or unite.vim plug-in can search and display information from arbitrary sources like files, buffers, recently used files or registers.
Plug 'Shougo/unite.vim'

" Markdown
Plug 'plasticboy/vim-markdown'

" Surround
Plug 'tpope/vim-surround'

" F#
" Plug 'kongo2002/fsharp-vim'
Plug 'fsharp/vim-fsharp'

" extended % matching (HTML)
Plug 'tmhedberg/matchit'

" HTML5
Plug 'othree/html5.vim'

" NERDTree
Plug 'scrooloose/nerdtree'

" OmniSharp
Plug 'OmniSharp/omnisharp-vim'

" SQL syntax
Plug 'shmup/vim-sql-syntax'

" For Denite features
Plug 'Shougo/denite.nvim'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Svelte
Plug 'evanleck/vim-svelte'

" Vue
Plug 'posva/vim-vue'

" Clojure
Plug 'guns/vim-clojure-static'

" Docker
Plug 'ekalinin/Dockerfile.vim'

" Not sure about this one. It's nice, but it might need patched fonts and I'm
" not sure if I want to go to that trouble.
" vim-airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'


call plug#end()
" }}}

" In the editor execute :CocInstall coc-tsserver

" vim:foldmethod=marker:foldlevel=0
