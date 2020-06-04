vib() {
  vim +"colorscheme noctu" +"let t_Co=8" $*
}

alias srd="screen -rd"
alias ss="screen -S"
alias sls="screen -list"

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
