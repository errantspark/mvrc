vib() {
  vim +"colorscheme noctu" +"let t_Co=8" $*
}

alias srd="screen -rd"
alias ss="screen -S"
alias sls="screen -list"

alias memo="pushd ~/lambda/memo/ > /dev/null && node main.mjs && popd > /dev/null"
alias vimemo="pushd ~/lambda/memo/ > /dev/null && vim log && popd > /dev/null"

alias xmon="xrandr -s 2560x1440"
alias xlap="xrandr -s 1920x1080"

function treg {
    # tree respecting gitignore

    local ignored=$(git ls-files -ci --others --directory --exclude-standard)
    local ignored_filter=$(echo "$ignored" \
                    | egrep -v "^#.*$|^[[:space:]]*$" \
                    | sed 's~^/~~' \
                    | sed 's~/$~~' \
                    | tr "\\n" "|")
    tree --prune -I ".git|${ignored_filter: : -1}" "$@"
}
