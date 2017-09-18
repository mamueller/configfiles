" inspired by
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

"begin vundle
set nocompatible "required
filetype off "required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'nvie/vim-flake8' "check that syntax conforms to PEP8

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"end vundle

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1 "docstrings in folds

" set python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    "\ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix

" set indentation for web stuff
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" set indentation for R
au BufNewFile,BufRead *.r, *.R
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
" flag unwanted whitespace (does not work at the moment
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


set number
set autoindent
let mysyntaxfile="~/.vim/mysyntax.vim"
let python_highlight_all=1
syntax on
"syntax enable
set encoding=utf-8
set modeline
"let vimrplugin_term = "konsole"
"let vimrplugin_screenplugin = 0
set ttymouse=xterm2 "to work in tmux
set mouse=a
set ls=2  
"set spell
"autocmd FileType tex    set textwidth=110
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:o

"some setup for the NvimR plugin
"We want to use tmux as terminal emulator and not neovims builtin terminal
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
