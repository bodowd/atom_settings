"////////////////////////////////////////
" vim-plug plugins
"////////////////////////////////////////
call plug#begin('~/.vim/plugged')
" #### Add new plugins here:
Plug 'tmhedberg/SimpylFold' " code folding
Plug  'w0rp/ale' " syntax checking   make sure to install the linter (i.e. pip install flake8)
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator' " navigate tmux w/ ctrl-j etc
Plug 'chriskempson/base16-vim' " color schemes
Plug 'epeli/slimux'
"Plug 'liuchengxu/eleline.vim'
"////////////////////////////////////////
call plug#end() 
"////////////////////////////////////////

"////////// Vim settings
set number
set backspace=2     " makes backspace work
set wildmode=longest,list  " autocompletion for vim command mode
set wildmenu
let mapleader=","
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,space:·
set incsearch
set nohls
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
"let g:airline_theme='base16_spacemacs'
"let g:airline_theme='zenburn'
let g:airline_theme='violet'
let g:airline_section_b = '%{strftime("%H:%M")}'

"let g:Powerline_symbols='fancy' "let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#buffer_nr_format = '%s:'
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#fnamecollapse = 1
"let g:airline#extensions#tabline#fnametruncate = 0
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline#extensions#default#section_truncate_width = {
"            \ 'b': 79,
"            \ 'x': 60,
"            \ 'y': 88,
"            \ 'z': 45,
"            \ 'warning': 80,
"            \ 'error': 80,
"            \ }
" Distinct background color is enough to discriminate the warning and
" error information.

"////////// Airline/ALE settings
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
let g:ale_statusline_format = ['⨉ w %d', '⚠ e %d', '⬥ ok']

"///////// ALE settings
let g:ale_sign_column_always = 0
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters = { 'python': ['flake8'], }"
let g:ale_python_flake8_args = '--ignore=E,W'

"/////////  NERDTree settings
let NERDTreeIgnore=['\.pyc$', '\~$']
nnoremap <C-n> :NERDTreeToggle<CR>

"////////// deoplete settings
let g:deoplete#enable_at_startup = 1
" use tab to cycle through autocomplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" 

"////////// jedi settings
set completeopt-=preview " turns off docstring window popup during completion
let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0	" pop up only occurs when ctrl-space is typed

"////////// slimux settings
" send the line then move down one line
"nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>j 
"" moves to the next line after visual mode
"vnoremap <C-c><C-c> :SlimuxREPLSendSelection<CR><Esc>'>j 
"nnoremap <C-c><C-v> :SlimuxREPLConfigure<CR>

"////////////////////////////////////////
"Colors
"////////////////////////////////////////
syntax on
colorscheme space-vim-dark
"colorscheme zenburn

" base16
"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif
"
"let base16colorspace=256
"colorscheme base16-eighties
"/////////////////////////////////////////
" Python settings
"/////////////////////////////////////////
"/////////////////////////////////////////
"/////////////////////////////////////////
"
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal cindent
setlocal smarttab
setlocal formatoptions=croql
setlocal number
"///////////// code folding
set foldmethod=indent
set foldlevel=99
let python_highlight_all=1
"/////////////
set encoding=utf-8

"au BufNewFile,BufRead *.py
"	\ set tabstop=4 |
"	\ set softtabstop=4 |
"	\ set shiftwidth=4 |
"	\ set textwidth=79 |
"	\ set expandtab |
"	\ set autoindent |
"	\ set fileformat=unix
"
