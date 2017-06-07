"////////////////////////////////////////
"  Vundle Plugins
"////////////////////////////////////////

set nocompatible	" required
filetype off 		" required

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" #### Add new plugins here:
Plugin 'tmhedberg/SimpylFold' " code folding
"Plugin 'w0rp/ale' " syntax checking   make sure to install the linter (i.e. pylint)
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator' " navigate tmux w/ ctrl-j etc
Plugin 'chriskempson/base16-vim' " color schemes
Plugin 'epeli/slimux'
" **** All plugins must be added above this line:
call vundle#end()		" required
filetype plugin indent on	" required
"////////////////////////////////////////
"End Vundle plugins 
"////////////////////////////////////////
"////////// Vim settings
set number
set backspace=2     " makes backspace work
set wildmode=longest,list  " autocompletion for vim command mode
set wildmenu
let mapleader=","
"//////////  Autoreload .vimrc
augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END	

"///////// the following enables clipboard/yanking,etc in vim when using tmux
"set clipboard +=unnamedplus
if $TMUX == ''
	set clipboard+=unnamed
endif
"////////// Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"////////// end vim settings /////////////
"/////////////////////////////////////////

"////////// vim-airline settings
set laststatus=2
set ttimeoutlen=10
let g:airline_theme='base16_oceanicnext'

"call airline#parts#define_function('ALE', 'ALEGetStatusLine')
"call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
"let g:airline_section_error = airline#section#create_right(['ALE'])
"let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
""let g:ale_python_pylint_use_global = 1
"highlight clear ALEErrorSign
"highlight clear ALEWarningSign
"let g:ale_sign_column_always = 1

"//////////  NERDTree settings
let NERDTreeIgnore=['\.pyc$', '\~$']
nnoremap <C-n> :NERDTreeToggle<CR>

"////////// jedi settings
set completeopt-=preview " turns of docstring window popup during completion
let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0	" pop up only occurs when ctrl-space is typed
let g:deoplete#enable_at_startup = 1
"////////// slimux settings
" send the line then move down one line
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>j 
" moves to the next line after visual mode
vnoremap <C-c><C-c> :SlimuxREPLSendSelection<CR><Esc>'>j 
nnoremap <C-c><C-v> :SlimuxREPLConfigure<CR>

"////////////////////////////////////////
"Colors
"////////////////////////////////////////
syntax on

"colorscheme zenburn

" base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let base16colorspace=256
colorscheme base16-ocean
"/////////////////////////////////////////
" Python settings
"/////////////////////////////////////////
"///////////// code folding
set foldmethod=indent
set foldlevel=99
let python_highlight_all=1
"/////////////
set encoding=utf-8

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

