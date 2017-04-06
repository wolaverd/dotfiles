pathCheck() {
    local new="$1" isPath=0
    while read path; do
        if [[ $new = $path ]]; then
            isPath=1
            break
        fi
    done <<< "$(echo "$PATH" | sed 's/:/\n/g')"
    echo "$isPath"
}


path=(
    '/sbin:/usr/bin:/usr/sbin:/usr/local/bin'
    "${HOME}/bin"
    "/usr/local/bin/ignition"
    "${HOME}/.rvm/bin"
    "/usr/local/bin/jdk"
)

PATH="/bin"
for i in "${path[@]}"; do
    inPath=$(pathCheck "$i")
    if [[ $inPath -eq 0 ]]; then
        PATH="${PATH}:${i}"
    fi
done
export PATH
unset path

export TERM='xterm-256color'
export EDITOR='vim'
export VISUAL='subl'
export GIT_EDITOR="subl --wait --new-window"

if [ -n "$BASH_VERSION" ]; then
	[[ -f ~/.bashrc ]] && source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


export PATH="$PATH:/usr/local/bin/ignition"
