" Themeing
set gfn=DejaVu_Sans_Mono:h9:cANSI
colorscheme koehler
colorscheme jellybeans

" Gui
:set lines=30 columns=100
:set guioptions-=T  "remove toolbar
":set guioptions-=m  "remove menu bar
":set guioptions-=r  "remove right-hand scroll bar
:let g:colorizer_auto_filetype='css,html'

:set colorcolumn=81
:set listchars=tab:··,trail:•,nbsp:~
:set list
:set number
:set showmatch
:set shiftwidth=4
:set tabstop=4
:set cursorline

" Pathogen
execute pathogen#infect($APPDATA . '/Vim/bundle/{}')

" Key mappings

nmap <Leader>nt :NERDTreeToggle $UserProfile/Desktop<cr>

nmap <F8> :TagbarToggle<cr>
nmap <F12> :noh<cr>

nmap <C-x>h :bp<cr>
nmap <C-x>l :bn<cr>

" SQL Specific
let g:sql_type_default = "sqlserver"

" System
set directory=$APPDATA/Vim/directory

set shiftwidth=4

set spelllang=en_gb
