link_dotfile () {
	local ln_src="$1"
	local filename
	local ln_dest ln_dest_pdir

	filename=$(basename "$ln_src")

	case "$filename" in
		.z*|.b*|.profile|.functions|.aliases)
			ln_dest="${HOME}/${filename}"
			;;
		vimrc)
			ln_dest="${HOME}/.vim/${filename}"
			;;
		*)
			continue
			;;
	esac

	ln_dest_pdir=$(dirname "$ln_dest")
	[[ ! -d $ln_dest_pdir ]] && mkdir -p "$ln_dest_pdir"
	
	[[ ! -e $ln_dest && -h $ln_dest ]] && rm -f "$ln_dest"					# Remove broken symlink.
	[[ -e $ln_dest && ! -h $ln_dest ]] && rm -f "$ln_dest"					# Remove regular file.

	ln -s "$ln_src" "$ln_dest"
}

