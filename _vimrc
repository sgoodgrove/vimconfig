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

" Vimtodo
let g:todo_states =[['TODO(t)', '|', 'DONE(d)', 'CANCELLED(c)'],
	\['WAITING(w)', 'HOLD(h)', 'INPROGRESS(i)', 'SOMEDAY(s)', 'CLOSED(l)']]

" Key mappings

nmap <Leader>nt :NERDTreeToggle $UserProfile/Desktop<cr>

nmap <F8> :TagbarToggle<cr>
nmap <F12> :noh<cr>

nmap <C-x>h :bp<cr>
nmap <C-x>l :bn<cr>

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

