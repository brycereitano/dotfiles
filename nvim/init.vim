let os = substitute(system('uname'), "\n", "", "")
let mapleader = ","
let maplocalleader = ","
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim

let g:python_host_prog  = "/usr/sbin/python2"
let g:python3_host_prog = "/usr/sbin/python"

if has('nvim')
  nmap <BS> <C-w>h
endif

call plug#begin('~/.config/nvim/plugged')

" Plugins
" =======

" Essentials
" ----------
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'christoomey/vim-tmux-navigator'
Plug 'majutsushi/tagbar'
Plug 'cohama/lexima.vim'
Plug 'djoshea/vim-autoread'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'tpope/vim-repeat'

" Autocomplete
" ------------
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Visual Preferences
" ------------------
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'chriskempson/base16-vim'

" Testing
" -------
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'

" Go
" --
Plug 'fatih/vim-go'
Plug 'garyburd/go-explorer'

" Git
" ---
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim',   { 'on': 'Gist' }
Plug 'mattn/webapi-vim', { 'on': 'Gist' }

" Web
" ---
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim',       { 'for': ['html'] }
Plug 'tpope/vim-rails',        { 'for': ['ruby'] }
Plug 'vim-ruby/vim-ruby',      { 'for': ['ruby'] }
Plug 'kylef/apiblueprint.vim'

call plug#end()

" Visual Preferences
" ==================

set background=dark
colorscheme base16-twilight
let base16colorspace=256
autocmd ColorScheme * highlight TODO ctermfg=red ctermbg=NONE
autocmd ColorScheme * highlight LineNr ctermbg=black
autocmd ColorScheme * highlight SignColumn ctermbg=black
autocmd ColorScheme * highlight GitGutterAdd ctermbg=black
autocmd ColorScheme * highlight GitGutterChange ctermbg=black
autocmd ColorScheme * highlight GitGutterDelete ctermbg=black
autocmd ColorScheme * highlight GitGutterChangeDelete ctermbg=black

" Coding Helpers
" --------------
syntax on
set nowrap
"set cursorline " Comment this out, if there is lag
set tabstop=2
set shiftwidth=2
set expandtab

" TODO: Highlighting
" -----------------
augroup HiglightTODO
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('TODO', 'TODO: ', -1)
augroup END

" Performance Improvements
" ------------------------
set synmaxcol=360

" Move backups
" ------------
set backupdir=/tmp

" Ignorecase
" ----------
set ignorecase
set smartcase

" Relative Line Numbers
" ---------------------
set norelativenumber
set number

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

map <Leader>n :call NumberToggle()<cr>
map <Leader>c :nohl<cr>

filetype plugin indent on
filetype on

" Plugin Configurations
" =====================

" UltiSnips
" ---------
let g:UltiSnipsSnippetDirectories      = ["~/.config/nvim/UltiSnips"]
let g:UltiSnipsExpandTrigger           = '<c-j>'
let g:UltiSnipsJumpForwardTrigger      = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger     = '<c-k>'

" CtrlP
" -----
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Go
" --
let g:go_fmt_flags = "-s"
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Riot
" ----
au BufNewFile,BufRead *.tag setlocal ft=html

" Vim Airline
" -----------
let g:airline_powerline_fonts = 1

" DelimitMate
" -----------
let delimitMate_expand_cr = 2

" Syntastic
" ---------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args = "--max-line-length=160"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby','go','javascript','typescript'], 'passive_filetypes': ['asm'] }
let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_html_tidy_exec = "/usr/local/bin/tidy5"
let g:syntastic_typescript_tsc_args = '--target ES5 --module --experimentalDecorators'
let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_aggregate_errors = 1

" Tagbar
" ------
nmap <C-b> :TagbarToggle<CR>

" Git Gutter
" ----------
let g:gitgutter_realtime = 1

" Gist
" ----
if os == "Linux"
  let g:gist_clip_command = 'ssh hyperion pbcopy'
elseif os == "Darwin"
  let g:gist_clip_command = 'pbcopy'
endif
let g:gist_show_privates = 1
let g:gist_post_privates = 1

" deoplete.vim
" ------------
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.html = '<[^>]*'
let g:deoplete#omni_patterns.xml  = '<[^>]*'
let g:deoplete#omni_patterns.md   = '<[^>]*'
let g:deoplete#omni_patterns.css   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.scss   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.sass   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:deoplete#omni_patterns.go = '[^. \t0-9]\.\w*' " '[^.[:digit:] *\t]\.\w*'
let g:deoplete#omni_patterns.ruby = ['[^. *\t]\.\w*', '\h\w*::']
let g:deoplete#omni_patterns.python = ['[^. *\t]\.\h\w*\','\h\w*::']
let g:deoplete#omni_patterns.python3 = ['[^. *\t]\.\h\w*\','\h\w*::']
let g:deoplete#max_list = 20
let g:deoplete#sources = {}
let g:deoplete#sources._=['omni', 'ultisnips', 'buffer', 'member', 'tag', 'file']

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


" NERDTree
" --------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.o$']

" Resizing
" --------
if bufwinnr(2)
  map + <C-W>5>
  map - <C-W>5<
endif

" Edit vimrc
" ----------
autocmd bufwritepost .vimrc source $MYVIMRC
map <leader>v :tabedit $MYVIMRC<CR>

" Error Navigation
map <Leader>h :cprev<CR>
map <Leader>l :cnext<CR>
