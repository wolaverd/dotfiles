set nocompatible

"" Vundle
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"
"Plugin 'VundleVim/Vundle.vim'
"
"" Github repos
"Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'flazz/vim-colorschemes'
"
"" Multi cursor
"Plugin 'terryma/vim-multiple-cursors'
"let g:multi_cursor_use_default_mapping=0
"" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
"
"" Airline
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='papercolor'
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_detect_paste=1
"let g:airline#extensions#hunks#enabled = 0
"
"" Nerdtree {{
"Plugin 'scrooloose/nerdtree'
"map <C-a> :NERDTreeToggle<CR>
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"
"" Other repos
"Plugin 'pythoncomplete'
"Plugin 'taglist.vim'
"
"call vundle#end()

filetype on
filetype plugin indent on

syntax off

" Indentation
set ai				" Auto indent
set si				" Smart indent
let s:tabwidth=4
au Filetype * let &l:tabstop = s:tabwidth
au Filetype * let &l:shiftwidth = s:tabwidth
au Filetype * let &l:softtabstop = s:tabwidth

" Search
set incsearch		" Update terminal throughout search.
set ignorecase		" Ignore case when searching.
set hlsearch		" Highlight search results.

set lazyredraw		" Don't redraw while executing macros.
set magic			" For regex special characters.
set showmatch		" Show matching brackets.
set mat=2			" Matching bracket flash interval.

" Disable bell
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Linebreak
set lbr
set tw=500

set shortmess=a		" Abbreviated messages, no truncation.
set number
set ruler
set backspace=indent,eol,start
set hidden
set confirm
set ead=both
set showcmd
set clipboard+=unnamed
set textwidth=80
set noswapfile
set wildmenu
set wildmode=list
set t_Co=256

colorscheme default

" Window nagivation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Status line
set laststatus=2