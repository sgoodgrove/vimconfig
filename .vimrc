" NeoVim configuration file by Steven Goodgrove

" {{{ global Vim-native settings

" {{{ Windows specific settings
if has("win32")
	" Set python 3 location
	let g:python3_host_prog = 'C:\Users\steven.goodgrove\AppData\Local\Programs\Python\Python37-32\python.exe'
endif
" }}}

:set listchars=tab:??,trail:?
" Set spelling language
:set spelllang=en_gb


:set rnu " Enable relative line numbers
:set number " Enable current line number

" Set color scheme
colorscheme koehler

" Set font
if (has("win32"))
    :set gfn=Fantasque_Sans_Mono:h12
endif

" Set GUI options
if (has('gui'))
    " Remove toolbar
    :set guioptions-=T
    " Remove menu
    :set guioptions-=m
endif

if (has('gui_running'))
    set columns=130
    set lines=40
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

:set ruler " shows the line number/column number in the bottom right
:set rulerformat=%50(B%n)\ %#Title#%t%*%m\ %=%#LineNr#%5l%*l,%3cc\ (%L)%)
:set statusline=%<%f\ %y%h%#WarningMsg#%m%r%*%=%-14.(%4l,%c%)\ %L

" Toggle spell check.
nmap <F7> :set spell!<cr> 
nmap <F8> :set list!<cr> 
" Run json through jq to prettify it.
nmap <leader>jq :%!jq .<cr>
nmap <leader>nt :NERDTree<cr>

autocmd ColorScheme * highlight StatusLine guibg=#111111 guifg=white

:set laststatus=2

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
Plug 'vim-syntastic/syntastic'

" Automatic closing of quotes, parenthesis, brackets etc.
Plug 'Raimondi/delimitMate'

" Tagbar
Plug 'majutsushi/tagbar'

" The unite or unite.vim plug-in can search and display information from arbitrary sources like files, buffers, recently used files or registers.
Plug 'Shougo/unite.vim'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'jkramer/vim-checkbox'

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

" Vimwiki
Plug 'vimwiki/vimwiki'

" Not sure about this one. It's nice, but it might need patched fonts and I'm
" not sure if I want to go to that trouble.
" vim-airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"
Plug 'dhruvasagar/vim-vinegar'


call plug#end()
" }}}

" {{{ autocmd file type commands
autocmd FileType markdown set conceallevel=2
" }}}
"
"{{{ Plugin preferences

" vim-checkbox
let g:checkbox_states = [' ', 'X']
""}}}


" In the editor execute :CocInstall coc-tsserver
let g:coc_global_extensions = ['coc-tsserver']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cs_checkers = ['code_checker']

" vim:foldmethod=marker:foldlevel=0
