" Appearance {{{

colorscheme molokai

if has("win32")
	set gfn=Droid_Sans_Mono:h10:cANSI
	set gfn=Fantasque_Sans_Mono:h11
else
	set gfn="Droid Sans Mono 10"
endif

" Other colorschemes
" jellybeans koehler vividchalk
" Other fonts
" DejaVu_Sans_Mono:h8:cANSI
" Fantasque_Sans_Mono:h11


" }}}
" System settings and win32 specific {{{

if has("win32")
	let s:swapPath = expand("$APPDATA/Vim/swap")

	if !isdirectory(s:swapPath)
		call mkdir(s:swapPath, "p")
	endif

	let &directory=s:swapPath

endif

set spelllang=en_gb

syntax on
filetype plugin indent on

" }}}
" Gui {{{

if has("gui")
:set lines=40 columns=120
":set guioptions-=T  "remove toolbar
":set guioptions-=m  "remove menu bar
":set guioptions-=r  "remove right-hand scroll bar
:set guioptions=
endif

:let g:colorizer_auto_filetype='css,html'

:set colorcolumn=81,121
:set cursorline
:set number
:set showmatch " show matching braces

:set shiftwidth=4
:set tabstop=4
:set tw=0
:set expandtab
:set lazyredraw " don't redraw for macros and such

set modelines=1
" }}}
" Search {{{

set fdo-=search
" }}}
" Pathogen {{{
execute pathogen#infect()
" }}}
" Vimtodo {{{

" let g:todo_states =[['TODO(t)', '|', 'DONE(d)', 'CANCELLED(c)'],
"	\['WAITING(w)', 'HOLD(h)', 'INPROGRESS(i)', 'SOMEDAY(s)', 'CLOSED(l)']]
let g:todo_taskurl="https://doncaster-mbc.atlassian.net/browse/WEB-%s"
let g:todo_browser="C:/Program Files (x86)/Mozilla Firefox/firefox.exe"
" }}}
" Tabularize {{{
" :let g:tabular_loaded = 1
" }}}
" Key mappings {{{

nmap <Leader>nt :NERDTreeToggle $UserProfile/Desktop<cr>
nmap <F8> :TagbarToggle<cr>
nmap <F12> :noh<cr>
nmap <C-x><C-h> :bp<cr>
nmap <C-x><C-l> :bn<cr>
"
" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F5> :!start C:\Users\tomas\AppData\Local\Google\Chrome\Application\chrome.exe %:p<CR>'

" }}}
" SQL specific functions {{{
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
"}}}
" Misc functions {{{
function! Scratch()
	" as taken from http://vim.wikia.com/wiki/Vim_buffer_FAQ
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
endfunction

let g:multi_cursor_next_key="<F6>"
"}}}
" Status line definition {{{
set laststatus=2
" jamessan's
set statusline=   " clear the statusline for when vimrc is reloaded 
set statusline+=%-3.3n\                      " buffer number
set statusline+=%2*
set statusline+=%f\                          " file name
set statusline+=%3*
set statusline+=%h%m%r%w                     " flags
" set statusline+=%5*
" set statusline+=\{%n\}
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

" Status line colours 
hi User1 guifg=gray80 guibg=gray10 term=bold gui=NONE
hi User2 guifg=white guibg=gray30 term=bold gui=NONE
hi User3 guifg=black guibg=white term=bold gui=bold
hi User4 guifg=gray80 guibg=gray10 term=italic gui=italic
" hi User5 guifg=black guibg=gray30 term=bold gui=bold
"
" }}}
" Supertab {{{
" This line is to enable supertab and snipMate to work together
let g:SuperTabDefaultCompletionType = "context"
"}}}j
" Golden Ratio {{{
let g:loaded_golden_ratio = 1


" }}}
" Key mappings {{{

" FuzzyFinder
nmap <leader>F :FufFile<cr>
nmap <leader>D :FufDir<cr>
nmap <leader>B :FufBuffer<cr>
nmap <leader>M :FufBookmarkDir<cr>

let g:tagbar_type_cake = {
    \ 'ctagstype' : 'cakebuild',
    \ 'kinds' : [
        \ 't:Task'
    \ ]
\ }
" }}}

" vim:foldmethod=marker:foldlevel=0

