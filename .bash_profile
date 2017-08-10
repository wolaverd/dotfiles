pathcheck() {
	IFS_backup="$IFS"
	IFS=':'
	for pathdir in $PATH; do
        if [[ $1 = $pathdir ]]; then
			IFS="$IFS_backup"
			return 1
		fi
    done
	IFS="$IFS_backup"
    return 0
}

if [ -n "$BASH_VERSION" ]; then
    [[ -f ~/.bashrc ]] && source ~/.bashrc
fi

path=(
	/sbin
	/usr/bin
	/usr/sbin
	/usr/local/bin
	"${HOME}/bin"
	"${HOME}/.local/bin"
	/usr/local/ignition
)

PATH="/bin"
for i in "${path[@]}"; do
	if [[ -d $i ]]; then
		pathcheck "$i" || continue
		PATH="${PATH}:${i}"
	fi
done
unset path
export PATH

if [[ $(dpkg-query --show 'keychain' &>/dev/null) -eq 0 ]]; then
    eval "$(keychain --eval --agents ssh id_rsa)"
fi
