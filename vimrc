call pathogen#infect()
set nocompatible              " be iMproved, required
filetype plugin indent on                  " required
syntax enable

set number
set hidden
set backspace=indent,eol,start
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set laststatus=2
set mouse=a
set tabstop=4
set shiftwidth=4
set nospell

colorscheme desert

map <F1> <Esc>
imap <F1> <Esc>

augroup spell
	autocmd!
	autocmd FileType text	set spell
	autocmd FileType tex	set spell
	autocmd Filetype bib 	set nospell
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType tex			call pencil#init({'wrap': 'soft'})
  autocmd FileType text         call pencil#init({'wrap': 'soft'})
augroup END

autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>
autocmd FileType c nnoremap <buffer> <localleader>c I// <esc>
autocmd FileType tex nnoremap <buffer> <localleader>c I% <esc>
autocmd BufRead,BufNewFile * set conceallevel=0

let g:pencil#autoformat = 0  

let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
			\ 'continuous' : 0,
			\}

if has('nvim')
 let g:vimtex_compiler_progname = 'nvr'
endif
let g:vimtex_complete_bib = { 'simple': 1 }
let g:vimtex_imaps_leader = '"'

" call deoplete#custom#var('omni', 'input_patterns', {
"       \ 'tex': g:vimtex#re#deoplete
"       \})

" If the popup menu is visible, convert TAB to <C-n> else let TAB be TAB
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:go_disable_autoinstall = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1

map <C-n> :NERDTreeToggle<CR>
