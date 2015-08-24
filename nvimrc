let os = substitute(system('uname'), "\n", "", "")
let mapleader = ","
let maplocalleader = ","
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim

" Color scheme changes
set background=dark
colorscheme jellybeans

" Force utf-8 encoding and allow to use last status bar
set encoding=utf-8
set laststatus=2
set backspace=indent,eol,start

if has('nvim')
  nmap <BS> <C-w>h
endif

call plug#begin('~/.nvim/plugged')

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
if os == "Linux"
  Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
elseif os == "Darwin"
  Plug 'Shougo/neocomplete.vim'
endif

" Visual Preferences
" ------------------
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'nathanaelkane/vim-indent-guides'

" Go
" --
Plug 'fatih/vim-go', { 'for': ['golang'] }

" Git
" ---
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim',   { 'on': 'Gist' }
Plug 'mattn/webapi-vim', { 'on': 'Gist' }

" Web
" ---
Plug 'jelera/vim-javascript-syntax'
Plug 'slim-template/vim-slim',      { 'for': ['slim'] }
Plug 'othree/html5.vim',            { 'for': ['html'] }
Plug 'tpope/vim-rails',             { 'for': ['ruby'] }
Plug 'vim-ruby/vim-ruby',           { 'for': ['ruby'] }
Plug 'kylef/apiblueprint.vim'

" OpenSCAD
" --------
Plug 'sirtaj/vim-openscad'

call plug#end()


" Visual Preferences
" ==================

" Allow Hidden Buffers
" --------------------
set hidden

" Coding Helpers
" --------------
syntax on
set autoread
set nowrap
"set cursorline " Comment this out, if there is lag
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch

" TODO: Highlighting
" -----------------
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Constant', 'TODO: ', -1)
augroup END

" Performance Improvements
" ------------------------
set synmaxcol=180

" Google buffer management.
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
map <leader>b :call DeleteHiddenBuffers()<CR>

" Move backups
" ------------
set dir=/tmp

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

filetype plugin indent on
filetype on

" Highlight TODO
" --------------
augroup HiglightTODO
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('Constant', 'TODO:', -1)
augroup END


" Plugin Configurations
" =====================

" Go
" --
let g:go_fmt_flags = "-s"
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


" Vim Airline
" -----------
let g:airline_powerline_fonts = 1

" DelimitMate
" -----------
let delimitMate_expand_cr = 2

" Vim Indent Guides
" -----------------
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_enable_on_vim_startup = 1

" Syntastic
" ---------
let g:syntastic_check_on_open=1
let g:syntastic_cpp_compiler_options = ' -std=c++0x'
let g:syntastic_cpp_check_header = 1
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args = "--max-line-length=160"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby','go'], 'passive_filetypes': ['asm'] }
let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['go', 'ruby'], 'passive_filetypes': ['asm'] }
let g:syntastic_html_tidy_exec = "/usr/local/bin/tidy5"

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

" YCM
" ---
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

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
