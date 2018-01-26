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
	/usr/local/sbin
	"${HOME}/bin"
	"${HOME}/.local/bin"
	/opt/android-sdk/platform-tools
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
