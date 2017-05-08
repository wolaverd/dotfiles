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


if [ -n "$BASH_VERSION" ]; then
    [[ -f ~/.bashrc ]] && source ~/.bashrc
fi

export EDITOR='vim'
export VISUAL='subl'
export GIT_EDITOR="subl --wait --new-window"

path=(
    '/sbin:/usr/bin:/usr/sbin:/usr/local/bin'
    "${HOME}/bin"
    "/usr/local/bin/ignition"
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

if [[ -z $DISPLAY ]]; then
	if [[ $XDG_VTNR = 1 || $XDG_VTNR = 2 ]]; then
		exec startx
	fi
fi

