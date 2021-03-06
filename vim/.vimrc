"////////////////////////////////////////
" vim-plug plugins
"////////////////////////////////////////
call plug#begin('~/.vim/plugged')
" #### Add new plugins here:
Plug 'tmhedberg/SimpylFold' " code folding
Plug 'w0rp/ale' " syntax checking   make sure to install the linter (i.e. pip install flake8)
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator' " navigate tmux w/ ctrl-j etc
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
" colorschemes
Plug 'rakr/vim-two-firewatch'
Plug 'arcticicestudio/nord-vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'hzchirs/vim-material'
"////////////////////////////////////////
call plug#end()
"////////////////////////////////////////

"////////// Vim settings
set mouse=a
set number
set backspace=2     " makes backspace work
set wildmode=longest,list  " autocompletion for vim command mode
set wildmenu
let mapleader=","
set list
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,space:·
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

set incsearch
set nohls
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions-=o " turns off continuation of commenting on next line

" delete trailing whitespace
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" use comma+w to execute func to delete trailing whitespace
noremap <leader>w :call DeleteTrailingWS()<CR>

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
"let g:airline_theme='base16_ocean'
"let g:airline_theme='wombat'

" display the time
let g:airline_section_b = '%{strftime("%H:%M")}'

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
let g:jedi#force_py_version = 3

"////////////////////////////////////////
"Colors
"////////////////////////////////////////
syntax on


"""" space-vim-dark --- use source code pro font if you like
"colorscheme space-vim-dark
"let g:airline_theme='violet'
"--------------------------------

"colorscheme zenburn

""" other themes --------------
""""" Turn this on for the other colorschemes
if (has("termguicolors"))
 set termguicolors
endif
""""" Nord colorschme
"set background=dark
"colorscheme nord
"let g:airline_theme='base16_ocean'
 "enable highlighting which somehow gets lost in nord colorscheme
"highlight Visual cterm=reverse ctermbg=NONE

"""" Material Theme
" for the palenight flavor of the material theme
"let g:material_style='palenight'
set background=dark
colorscheme vim-material
let g:airline_theme='material'
""""""""""""""""""""""""""""""""
"/////////////////////////////////////////
" Python settings
"/////////////////////////////////////////
"
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal cindent
setlocal smarttab
setlocal formatoptions=croql
setlocal number

"set colorcolumn=80
"///////////// code folding
set foldmethod=indent
set foldlevel=99
let python_highlight_all=1
"/////////////
set encoding=utf-8

