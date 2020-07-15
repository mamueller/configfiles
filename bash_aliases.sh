alias vimdiff='vim-with-plugins -d'
alias vim='vim-with-plugins'
alias vi='vim-with-plugins'
alias gt='gnome-terminal'
alias jl='jupyter-lab --port=8889 --port-retries=0 --no-browser'
alias jn='jupyter notebook --port=8889 --port-retries=0 --no-browser'
alias ll='ls -alF'
alias l='ls -CF'
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
    alias cdc2="cd ~/bgc_md2/bgc_md2/models/cable_all/cable_transit_time/"
    alias cdd2="cd /home/data/cable-data/example_runs/"
