pathCheck() {
    local newNode="$1" isNode=0
    while read pathNode; do
        if [[ $newNode = $pathNode ]]; then
            isNode=1; break
        fi
    done <<< "$(echo "$PATH" | sed 's/:/\n/g')"
    echo "$isNode"
}


path=(
    '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin'
    "${HOME}/bin"
    "/usr/lib/jvm/java-8-openjdk-amd64/jre/bin"
    "/usr/local/bin/ignition"
    "${HOME}/.rvm/bin"
    "/usr/local/bin/ignition"
)

for i in "${path[@]}"; do
    inPath=$(pathCheck "$i")
    if [[ $inPath -eq 0 ]]; then
        PATH="${PATH}:${i}"
    fi
done
export PATH
unset path

export TERM='konsole-256color'
export EDITOR='vim'
export VISUAL='subl'
export GIT_EDITOR="subl --wait --new-window"

if [ -n "$BASH_VERSION" ]; then
	[[ -f ~/.bashrc ]] && source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
