#!/bin/bash

declare -a dotfiles

case "$SHELL" in
	*bash)
		inc_dir='.bash'
		;;
	*zsh)
		inc_dir='.zsh'
		;;
	*)
		exit 1
		;;
esac

dotfiles=(
	./${inc_dir}/*
	'./functions'
	'./aliases'
	'./.vim'
)

for dotfile in "${dotfiles[@]}"; do
	# Abspath to repo's copy.
	src=$(realpath "$dotfile")
	# Substitute dotslash for $HOME.
	dest="${dotfile/.\//$HOME/}"
	dest_pdir=$(dirname "$dest")

	# Removes any conflicting files or links.
	[[ -e $dest || -h $dest ]] && rm -rf "$dest"

	# If dotfile's parent dir is non-existant and user has write permissions of it's grandparent dir..
	if [[ ! -d $dest_pdir && -w $(dirname "$dest_pdir") ]]; then
		mkdir -p "$dest_pdir"
	fi

	ln -s "$src" "$dest" || break
done