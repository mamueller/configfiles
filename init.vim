call plug#begin('~/.local/share/nvim/plugged/')
" Initialize plugin system
 Plug 'hkupty/iron.nvim'
 Plug 'jalvesaq/Nvim-R'
 Plug 'Valloric/YouCompleteMe'
 Plug 'nvie/vim-flake8'
call plug#end()



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
