workdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function link_file {
	local src dest ddir
	
	src="$1"
	dest="$2"
	ddir="${dest%/*}"

	rm -f "$dest" 2> /dev/null
	
	[[ ! -d $ddir ]] && mkdir -p "$ddir"

	ln -s "$src" "$dest"
}

link_file "${workdir}/bash/aliases" "${HOME}/.bash/aliases"
link_file "${workdir}/bash/bash_profile" "${HOME}/.bash_profile"
link_file "${workdir}/bash/bashrc" "${HOME}/.bashrc"
link_file "${workdir}/bash/env" "${HOME}/.bash/env"
link_file "${workdir}/bash/functions" "${HOME}/.bash/functions"
link_file "${workdir}/bash/prompt" "${HOME}/.bash/prompt"
link_file "${workdir}/config/youtube-dl/youtube-dl.conf" "${HOME}/.config/youtube-dl/youtube-dl.conf"
link_file "${workdir}/vim/vimrc" "${HOME}/.vim/vimrc"
