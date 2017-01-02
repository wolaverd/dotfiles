function link_file {
	local src dest ddir
	
	src="$1"
	dest="$2"
	ddir="${dest%/*}"

	[[ -f $dest ]] && rm "$dest"
	[[ ! -d $ddir ]] && mkdir -p "$ddir"

	ln -s "$src" "$dest"
}

link_file './bash/aliases' "${HOME}/.bash/aliases"
link_file './bash/bash_profile' "${HOME}/.bash_profile"
link_file './bash/bashrc' "${HOME}/.bashrc"
link_file './bash/env' "${HOME}/.bash/env"
link_file './bash/functions' "${HOME}/.bash/functions"
link_file './bash/prompt' "${HOME}/.bash/prompt"
link_file './config/youtube-dl/youtube-dl.conf' "${HOME}/.config/youtube-dl/youtube-dl.conf"
link_file './vim/vimrc' "${HOME}/.vim/vimrc"
