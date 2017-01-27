link_dotfile () {
	local ln_src="$1"
	local ln_dest
	local ln_dest_pdir

	local filename
	local dest_dir

	if [[ $SHELL = '/bin/zsh' ]]; then
		dest_dir="${HOME}/.zsh"
	else
		dest_dir="${HOME}/.bash"
	fi

	filename=$(basename "$ln_src")

	case "$ln_src" in
		*/.z*)
			ln_dest="${HOME}/${filename}"
			;;
		*/aliases)
			ln_dest="${dest_dir}/${filename}"
			;;
		*/functions/*)
			ln_dest="${dest_dir}/functions/${filename}"
			;;
		*/vimrc)
			ln_dest="${HOME}/.vim/${filename}"
			;;
		*)
			return 1
			;;
	esac

	ln_dest_pdir=$(dirname "$ln_dest")
	[[ ! -d $ln_dest_pdir ]] && mkdir -p "$ln_dest_pdir"
	
	[[ ! -e $ln_dest && -h $ln_dest ]] && rm -f "$ln_dest"					# Remove broken symlink.
	[[ -e $ln_dest && ! -h $ln_dest ]] && rm -f "$ln_dest"					# Remove regular file.

	[[ ! -e $ln_dest && ! -h $ln_dest ]] && ln -s "$ln_src" "$ln_dest"
}
