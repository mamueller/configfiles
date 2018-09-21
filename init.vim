call plug#begin('~/.local/share/nvim/plugged/')
" Initialize plugin system
 Plug 'chriskempson/base16-vim'
 Plug 'hkupty/iron.nvim'
 Plug 'jalvesaq/Nvim-R'
 Plug 'Valloric/YouCompleteMe'
 Plug 'nvie/vim-flake8'
 Plug 'scrooloose/nerdtree'
call plug#end()


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
  autocmd VimEnter * NERDTree
  " set python indentation
  autocmd BufNewFile,BufRead *.py set tabstop=4 |set softtabstop=4 |set shiftwidth=4 |set expandtab |set autoindent |set fileformat=unix |set textwidth=79
  
  " set html indentation
  au BufNewFile,BufRead *.html 
        \set tabstop=2 |
        \set softtabstop=2 |
        \set shiftwidth=2| 
        \set expandtab |
        \set autoindent |
        \set fileformat=unix |
        \set textwidth=79
augroup END 
