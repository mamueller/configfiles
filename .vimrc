set number
set autoindent
let mysyntaxfile="~/.vim/mysyntax.vim"
syntax enable
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
