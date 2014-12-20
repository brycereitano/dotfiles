let mapleader = ","
let maplocalleader = ","
set nocompatible
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim

" Color scheme changes
set t_Co=256
set background=dark
colorscheme jellybeans


" Force utf-8 encoding and allow to use last status bar
set encoding=utf-8
set termencoding=utf-8
set laststatus=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Bundles
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
"Bundle 'SirVer/ultisnips'
"Bundle 'honza/vim-snippets'
Bundle "majutsushi/tagbar"
Bundle 'jelera/vim-javascript-syntax'
Bundle 'marijnh/tern_for_vim'
Bundle 'Raimondi/delimitMate'
Bundle "tpope/vim-fugitive"

Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
Bundle 'christoomey/vim-tmux-navigator'

Bundle 'Valloric/YouCompleteMe'
Bundle 'Blackrush/vim-gocode'
Bundle 'jimenezrick/vimerl'

syntax on
set number
set nowrap
"set cursorline
set synmaxcol=160
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
set autoread
filetype plugin indent on


" Vim Airline
let g:airline_powerline_fonts = 1
"let g:tmuxline_powerline_separators = 0

" Vim indent guides
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_enable_on_vim_startup = 1

" DelimitMate
let delimitMate_expand_cr = 2

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_cpp_compiler_options = ' -std=c++0x'
let g:syntastic_cpp_check_header = 1
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args = "--max-line-length=160"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': ['asm'] }

" Ultisnips and YouCompleteMe fix
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Tagbar
nmap <C-b> :TagbarToggle<CR>

" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_key_list_previous_completion = ['<C-n>', '<S-TAB>']
let g:ycm_key_list_select_completion = ['<C-p>', '<TAB>']
set completeopt-=preview

" Mapping NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeDirArrows=0
let NERDTreeIgnore = ['\.pyc$', '\.o$']

if bufwinnr(2)
  map + <C-W>5>
  map - <C-W>5<
endif

imap <C-o> <CR><Esc>O
