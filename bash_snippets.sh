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
