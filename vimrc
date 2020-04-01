
set autoindent
augroup vimrc
  " set python indentation
  au BufNewFile,BufRead *.py
      \ setlocal tabstop=4|
      \ setlocal softtabstop=4|
      \ setlocal shiftwidth=4|
      \ setlocal expandtab|
      \ setlocal shiftround
augroup END 
set hls
set mouse=a
set number
syntax enable
set mouse=a
call plug#begin('~/./vim/plugged/')
	Plug 'roxma/vim-tmux-clipboard'
call plug#end()
