"/////////////////////////////////////////
"  Vundle Plugins
"/////////////////////////////////////////

set nocompatible	" required
filetype off 		" required

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" #### Add new plugins here:
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator' " navigate tmux w/ ctrl-j etc

" **** All plugins must be added above this line:
call vundle#end()		" required
filetype plugin indent on	" required
"////////////////////////////////////////
"End Vundle plugins 
"////////////////////////////////////////

"/////////////////////////////////////////
"------------ vim-airline settings
set laststatus=2
set ttimeoutlen=10
let g:airline_theme='powerlineish'
"------------ NERDTree settings
let NERDTreeIgnore=['\.pyc$', '\~$']
nnoremap <C-n> :NERDTreeToggle<CR>
			
"------------  Autoreload .vimrc
augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END	

"------------ Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"------------ Vim settings
set number
set backspace=2     " makes backspace work

"" the following enables clipboard/yanking,etc in vim when using tmux
if $TMUX == ''
	set clipboard+=unnamed
endif

"////////////////////////////////////////
"Colors
"////////////////////////////////////////
syntax on
colorscheme zenburn

"/////////////////////////////////////////
" Python settings
"/////////////////////////////////////////
"------------  code folding
set foldmethod=indent
set foldlevel=99
let python_highlight_all=1
"------------
set encoding=utf-8

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix
