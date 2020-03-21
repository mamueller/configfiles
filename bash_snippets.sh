# rsync sources to dev machine
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
