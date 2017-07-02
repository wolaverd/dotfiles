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
      '/usr/local/ignition')

export PATH="/bin"
for i in "${path[@]}"; do
    pathCheck "$i" && PATH="${PATH}:${i}"
done
unset path
export PATH

if [[ $(dpkg-query --show 'keychain' &>/dev/null) -eq 0 ]]; then
    eval "$(keychain --eval --agents ssh id_rsa)"
fi
