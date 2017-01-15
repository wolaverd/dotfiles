#!/bin/bash

declare -a dotfiles
dotfiles=(
	'./.bash/aliases'
	'./.bash/env'
	'./.bash/functions'
	'./.bash/prompt'
	'./.bash_profile'
	'./.bashrc'
	'./.config/youtube-dl/youtube-dl.conf'
	'./.ssh/config'
	'./.vim/vimrc'
)

for dotfile in "${dotfiles[@]}"; do
	src=$(realpath "$dotfile")
	dest="${dotfile/.\//$HOME/}"
	dest_pdir=$(dirname "$dest")

	[[ -e $dest || -h $dest ]] && rm -f "$dest"
	[[ ! -d $dest_pdir && -w $(dirname "$dest_pdir") ]] && mkdir -p "$dest_pdir"

	ln -s "$src" "$dest" || break

	[[ $dotfile = './.ssh/config' ]] && chmod 600 "$dotfile"
done
