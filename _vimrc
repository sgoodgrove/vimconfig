" Themeing
" set gfn=DejaVu_Sans_Mono:h8:cANSI
set gfn=Droid_Sans_Mono:h10:cANSI
" colorscheme koehler
colorscheme jellybeans
" colorscheme molokai
" colorscheme vividchalk

" Gui
:set lines=40 columns=120
:set guioptions-=T  "remove toolbar
":set guioptions-=m  "remove menu bar
":set guioptions-=r  "remove right-hand scroll bar
:let g:colorizer_auto_filetype='css,html'

:set colorcolumn=81
" :set listchars=tab:??,trail:?,nbsp:~
" :set list
:set number
:set showmatch
:set shiftwidth=4
:set tabstop=4
:set cursorline

" Pathogen
execute pathogen#infect()

" Vimtodo
" let g:todo_states =[['TODO(t)', '|', 'DONE(d)', 'CANCELLED(c)'],
"	\['WAITING(w)', 'HOLD(h)', 'INPROGRESS(i)', 'SOMEDAY(s)', 'CLOSED(l)']]

" Key mappings

nmap <Leader>nt :NERDTreeToggle $UserProfile/Desktop<cr>

nmap <F8> :TagbarToggle<cr>
nmap <F12> :noh<cr>

nmap <C-x><C-h> :bp<cr>
nmap <C-x><C-l> :bn<cr>

" SQL Specific
let g:sql_type_default = "sqlserver"

function! ToSqlInList() range
	for linenum in range(a:firstline, a:lastline)
		let curr_line = getline(linenum)

		let replacement = substitute(curr_line, '^', '''', '')

		if linenum < a:lastline
			let replacement = substitute(replacement, '$', ''',', '')
		else
			let replacement = substitute(replacement, '$', '''', '')
		endif

		call setline(linenum, replacement)
	endfor
endfunction

function! ToSqlSelectList() range
	for linenum in range(a:firstline, a:lastline)
		let curr_line = getline(linenum)

		let replacement = substitute(curr_line, ',\s*', ''', ''', 'g')
		let replacement = substitute(replacement, '^', 'SELECT ''', '')
		let replacement = substitute(replacement, '$', '''', '')

		if linenum < a:lastline
			let replacement = substitute(replacement, '$', ' UNION ALL', '')
		endif

		call setline(linenum, replacement)
	endfor
endfunction

" System
set directory=$APPDATA/Vim/directory

set shiftwidth=4

set spelllang=en_gb

let g:multi_cursor_next_key="<F6>"

syntax on
filetype plugin indent on

function! Scratch()
	" as taken from http://vim.wikia.com/wiki/Vim_buffer_FAQ
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
endfunction


" status line definition
set laststatus=2
" jamessan's
set statusline=   " clear the statusline for when vimrc is reloaded set statusline+=%-3.3n\                      " buffer number
set statusline+=%2*
set statusline+=%f\                          " file name
set statusline+=%3*
set statusline+=%h%m%r%w                     " flags
set statusline+=%4*
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%2*
set statusline+=%-14.(%l,%c%V%)
set statusline+=%1*
set statusline+=\ %<%P        " offset

hi User1 guifg=gray80 guibg=gray10 term=bold gui=NONE
hi User2 guifg=white guibg=gray30 term=bold gui=NONE
hi User3 guifg=black guibg=white term=bold gui=bold
hi User4 guifg=gray80 guibg=gray10 term=italic gui=italic

" This line is to enable supertab and snipMate to work together
let g:SuperTabDefaultCompletionType = "context"
