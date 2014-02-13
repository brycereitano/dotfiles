execute pathogen#infect()
syntax on
set number
filetype plugin indent on
set t_Co=256

colorscheme distinguished 

"Tagbar
nmap <C-x> :TagbarToggle<CR>

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
