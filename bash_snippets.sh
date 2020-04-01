# rsync sources to dev machine
# example usage:
# Assume on your own machine you are in 
# '~/network'
# rsyncs agricola
# will create (or sync) the directory ~/network on agricola
# 
rsyncs() {
    local target="${1:?no target given}"
    local project="${PWD##*/}"
    echo $procjet
    local cmd="rsync -azv --delete --exclude=.git --exclude=.hg"
    local cand
    for cand in .gitignore .hgignore; do
        if [[ -r $cand ]]; then
            cmd="$cmd --exclude-from=${cand}"
        fi
    done
    echo "execution cmd: $cmd ./ ${target}:${project}/"
    eval $cmd ./ ${target}:${project}/
}

session_name='pps' #pair_programming_session
attachTmux(){
  tmux -S /tmp/sharedtmux attach -t $session_name
}

pairTmux(){
 # tmux -S /tmp/sharedtmux new -s shared #would create an new session
 # but would not be able to change the ownership
 # so we 
 # 1. create a session and immediately detach from it
 tmux -S /tmp/sharedtmux new-session -d -s $session_name
 # 2. change the ownership of the socket
 chgrp pairprogrammers /tmp/sharedtmux 
 # 3. attach
 attachTmux
}
