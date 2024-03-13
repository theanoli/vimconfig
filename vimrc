call pathogen#infect()
set nocompatible              " be iMproved, required
filetype plugin indent on                  " required
syntax enable

set number
set hidden
set backspace=indent,eol,start
set statusline=%f%m%r%h%w
set statusline+=\ [%Y]
set statusline+=\ %=col\ %2v,\ line\ %2l\ of\ %L
set statusline+=\ %=%3p%%
set laststatus=2
set mouse=a
set tabstop=4
set shiftwidth=4
set nospell
set clipboard+=unnamedplus
set wildmode=longest:full,full

colorscheme wildcharm

map <F1> <Esc>
imap <F1> <Esc>

augroup spell
	autocmd!
	autocmd FileType text	set nospell
	autocmd FileType tex	set nospell
	autocmd Filetype bib 	set nospell
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType tex			call pencil#init({'wrap': 'soft'})
  autocmd FileType text         call pencil#init({'wrap': 'soft'})
augroup END

" localleader default is \
autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>  
autocmd FileType c nnoremap <buffer> <localleader>c I// <esc>
autocmd FileType tex nnoremap <buffer> <localleader>c I% <esc>
autocmd BufRead,BufNewFile * set conceallevel=0

let g:pencil#autoformat = 0  

let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
			\ 'continuous' : 0,
			\ 'build_dir' : 'build',
			\}

let g:vimtex_complete_bib = { 'simple': 1 }
let g:vimtex_imaps_leader = '"'
let g:vimtex_complete_recursive_bib = 1
let g:vimtex_quickfix_enabled = 0

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

" Auto-close brackets, etc. in insert mode. Escape with ctrl+v
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" =========
" CoC stuff
" =========
set encoding=utf-8
set nobackup
set nowritebackup

set updatetime=300

set signcolumn=yes
" Skipped a bunch of stuff here

" GoTo code navigation
nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Toggle inlays in function calls
nmap <silent> <F1> :CocCommand document.toggleInlayHint<CR>

" Tab completion
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()

" === Following config normally would go into coc-settings.json
" Don't suggest until more than 3 characters have been typed
call coc#config('suggest.minTriggerInputLength', 3)
