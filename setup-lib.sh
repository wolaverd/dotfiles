link_dotfile () {
	local ln_src="$1"
	local ln_dest
	local ln_dest_pdir

	local filename
	local dotfile_dir

	if [[ $SHELL = '/bin/zsh' ]]; then
		dotfile_dir="${HOME}/.zsh"
	else
		dotfile_dir="${HOME}/.bash"
	fi

	filename=$(basename "$ln_src")

	case "$filename" in
		.z*)
			ln_dest="${HOME}/${filename}"
			;;

		functions|aliases)
			ln_dest="${dotfile_dir}/${filename}"
			;;

		vimrc)
			ln_dest="${HOME}/.vim/${filename}"
			;;

		*)
			return 1
			;;
	esac

	ln_dest_pdir=$(dirname "$ln_dest")
	[[ ! -d $ln_dest_pdir ]] && mkdir "$ln_dest_pdir"

	[[ -e $ln_dest || -h $ln_dest ]] && rm -f "$ln_dest"

	#echo "ln -s "\""$ln_src"\"" "\""$ln_dest"\"
	ln -s "$ln_src" "$ln_dest"
}