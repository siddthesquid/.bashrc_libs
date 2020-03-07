
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" PLUGINS """"""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" BASIC SETTINGS """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set tabstop=4
set shiftwidth=4  "this is the level of autoindent, adjust to taste
set expandtab
set autoindent 
set ruler
set number
set visualbell
set backspace=indent,eol,start
set encoding=utf-8
" Uncomment below to make screen not flash on error
set vb t_vb=""
set t_Co=256
colorscheme industry
set showcmd
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set splitbelow
set splitright
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" REMAPPINGS """""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space> za
nnoremap j gj
nnoremap k gk
nnoremap <leader>s :mksession!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" PLUGIN OPTIONS """""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='badwolf'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" PYTHON OPTIONS """"""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_python = 'python3'
let python_highlight_all=1
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" FOLDING OPTIONS """""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set colorcolumn=80
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
