"This file has to be linkes to ~/.config/nvim/init.vim
call plug#begin('~/.local/share/nvim/plugged/')
" Initialize plugin system
  Plug 'chriskempson/base16-vim'
  Plug 'hkupty/iron.nvim'
  Plug 'jalvesaq/Nvim-R'
  Plug 'Valloric/YouCompleteMe'
  Plug 'nvie/vim-flake8'
  Plug 'scrooloose/nerdtree'
" Plug 'integralist/vim-mypy'
 Plug 'LnL7/vim-nix'
  " Plug 'vigemus/impromptu.nvim'
  " Plug 'bfredl/nvim-ipy'
call plug#end()
"set direction in which splits occure
"set splitright
"set splitbelow

set mouse=a
set number
set autoindent
set hls
set modeline

nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
nnoremap <leader>sv :source $MYVIMRC<cr> 

"some setup for the NvimR plugin
let R_nvimpager = 'vertical'
let R_assign = 2

"some setup for the IRONplugin
let iron_repl_open_cmd = "vsplit"

" Colors {{{
 let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 syntax enable                " enable syntax processing
 let base16colorspace=256
" colorscheme base16-default-light
" set background=light
" colorscheme base16-default-dark
" set background=dark
" " }}} Colors

set verbose=0
augroup vimrc
" remove all previously defined autocommands
  autocmd!  
  "
  "autocmd VimEnter * NERDTree
  
  " set python indentation
  au BufNewFile,BufRead *.py ,*.hs,*.R,*.Rnw
      \ setlocal tabstop=4|
      \ setlocal softtabstop=4|
      \ setlocal shiftwidth=4|
      \ setlocal expandtab|
      \ setlocal shiftround
  
<<<<<<< HEAD
  " set R indentation
  au BufNewFile,BufRead *.Rnw
      \ setlocal tabstop=4|
      \ setlocal expandtab|
      \ setlocal fileformat=unix |
      \ setlocal textwidth=79
  
  au BufNewFile,BufRead *.R 
      \ setlocal tabstop=4|
      \ setlocal softtabstop=4|
      \ setlocal shiftwidth=4|
      \ setlocal expandtab|
      \ setlocal shiftround

  " set html indentation
  au BufNewFile,BufRead *.html,*.tex,*.sh
      \ setlocal tabstop=2 |
      \ setlocal softtabstop=2 |
      \ setlocal shiftwidth=2| 
      \ setlocal expandtab |
      \ setlocal autoindent |
      \ setlocal fileformat=unix |
      \ setlocal textwidth=79


augroup END 
luafile $HOME/.config/nvim/iron.lua
"luafile $HOME/.config/nvim/impromptu_example.lua
