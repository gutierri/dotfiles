git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
git_tag () {
    git describe --tags 2> /dev/null
}
git_branch_or_tag() {
    local OUT="$(git_branch)"
        if [ "$OUT" == "no branch" ]; then
        OUT="$(git_tag)";
    fi
    echo $OUT
}
git_status() {
    if git status 2> /dev/null | grep -q 'Changes to be committe'; then
        echo -ne "\e[00;32m ●\e[0m"
    fi
    if git status 2> /dev/null | grep -q 'Changes not staged for commit'; then
        echo -ne "\e[00;33m ■\e[0m"
    fi
    if git status 2> /dev/null | grep -q 'Untracked files'; then
        echo -ne "\e[00;31m ▲\e[0m"
    fi
}

