"
"learn vimscript the hard way examples
"echo '>^.^<'  
let mapleader ='\' 		"\ is the default for the global leader anyway but now we can change it easily wiht this line
let maplocalleader ='\' 	"\ is also the default for the local (bufferwise) leader

nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
nnoremap <leader>sv :source $MYVIMRC<cr> 
nnoremap <leader>et :vsplit ~/.tmux.conf<cr> 
noremap <LocalLeader>d ddO<esc>p  

inoremap <LocalLeader>u <esc><C-v>wUi<esc>w 
nnoremap <LocalLeadeLocalLeader>u vwUw 
nnoremap H ^
nnoremap L $
"inoremap <esc> <nop>
"inoremap jk <esc>
"disaple arrow keys
"nnoremap OC <nop>
"nnoremap OD <nop>
"nnoremap OA <nop>
"nnoremap OB <nop>
"quote visual selection
vnoremap <leader>" <esc>`<i"<esc>`>ea" 
"quote visual block
vnoremap <leader>" <esc>'<i"<esc>'>o"
iabbrev ssig -- <cr>Markus Müller<cr>markus.mueller.1.g@googlemail.com
augroup filetype_javascript
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup END 

augroup filetype_latex
	autocmd!
	autocmd FileType latex nnoremap <buffer> <localleader>cI%<esc>
augroup END 

augroup filetype_python
	autocmd!
	autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
augroup END 

augroup filetype_html
	autocmd!
	autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END 

" inspired by
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"begin vundl
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
Plugin 'julienr/vim-cellmode'
Plugin 'vim-scripts/Vimball'
"Plugin 'jgdavey/tslime.vim'
Plugin 'jebaum/vim-tmuxify'
Plugin 'epeli/slimux'

Plugin 'nvie/vim-flake8' "check that syntax conforms to PEP8
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"end vundle

" set slimux
"let g:slimux_select_from_current_window = 1
":SlimuxShellConfigure 2
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>
map <C-c><C-c> :SlimuxREPLSendSelection<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1 "docstrings in folds

" set python indentation
au BufNewFile,BufRead *.py
    \ setlocal tabstop=4|
    \ setlocal softtabstop=4|
    \ setlocal shiftwidth=4|
   "\ setlocal textwidth=79|
    \ setlocal expandtab|
    \ setlocal autoindent|
    \ setlocal fileformat=unix

" set indentation for shell scripts
au BufNewFile,BufRead *.sh
    \ setlocal tabstop=2|
    \ setlocal softtabstop=2|
    \ setlocal shiftwidth=2|

" set indentation for web stuff
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2

" set indentation for R
au BufNewFile,BufRead *.r, *.R
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set autoindent|
    \ set expandtab|
    \ set shiftwidth=2
" flag unwanted whitespace (does not work at the moment
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


set number
set autoindent
set hls
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
set listchars=eol:$,tab:>-,trail:~,extends:>,space:·,precedes:o
"set list

"set clipboard=unnamed

"some setup for the NvimR plugin
"We want to use tmux as terminal emulator and not neovims builtin terminal
let R_in_buffer = 0
let R_nvimpager = 'vertical'
let R_applescript = 0
let R_tmux_split = 1
