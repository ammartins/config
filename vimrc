syntax on
set fileformat=unix
set autoindent
set background=light
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch

set ai
set si
set wrap

if &diff
	syntax off
	set diffopt+=iwhite
else
	syntax enable
endif

au BufRead,BufNewFile *.twig set filetype=htmljinja

set colorcolumn=100
set ruler
