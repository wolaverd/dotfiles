pathCheck() {
    while read -r path; do
        [[ $1 = $path ]] && return 1
    done < <(sed 's/:/\n/g' <<< "$PATH")
    return 0
}


if [ -n "$BASH_VERSION" ]; then
    [[ -f ~/.bashrc ]] && source ~/.bashrc
fi

path=('/sbin:/usr/bin:/usr/sbin:/usr/local/bin'
      "${HOME}/bin"
      "/usr/local/bin/ignition")

export PATH="/bin"
for i in "${path[@]}"; do
    pathCheck "$i" && PATH="${PATH}:${i}"
done
unset path
export PATH

if which keychain 2>/dev/null; then
    keychain --quiet --agents ssh id_rsa
    eval "$(keychain --query --quiet | awk -F '=' '$1 ~ /^SSH/ {print "export", $0}')"
fi

if [[ -z $DISPLAY ]]; then
    if [[ $XDG_VTNR = 1 || $XDG_VTNR = 2 || $XDG_VTNR = 5 ]]; then
        exec startx
    fi
fi
