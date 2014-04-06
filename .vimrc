set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Bundles
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
" Bundle 'garbas/vim-snipmate'
Bundle 'SirVer/ultisnips'
Bundle "honza/vim-snippets"
Bundle "majutsushi/tagbar"
Bundle 'jelera/vim-javascript-syntax'
"Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
Bundle 'altercation/vim-colors-solarized'


"colorscheme distinguished 
syntax on
set t_Co=256
"let g:solarized_termcolors=256
set background=dark
"colorscheme solarized
colorscheme scrot
set number
set nowrap
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=black
set synmaxcol=128
set ttyscroll=10
set tabstop=2 
set shiftwidth=2
set noexpandtab
set nowrap
set noswapfile
set nobackup
set nowritebackup
set hlsearch
set ignorecase
set smartcase
filetype plugin indent on


" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args = "--max-line-length=160"

"Snipmate
" let g:snipMateAllowMatchingDot = 0

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Tagbar
nmap <C-x> :TagbarToggle<CR>

" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_key_list_previous_completion = ['<C-n>','<Up>']
let g:ycm_key_list_select_completion = ['<C-p>', '<Down>']
set completeopt-=preview

" Mapping NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-c> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.pyc$']

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

imap <C-o> <CR><Esc>O
