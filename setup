#!/bin/bash

[[ -f './setup-lib.sh' ]] && source './setup-lib.sh'

declare -a dotfiles

case "$SHELL" in
	*bash)
		dotfiles+=(./dotfiles/.{bashrc,bash_profile})
		;;
	*zsh)
		dotfiles+=(./dotfiles/.{zshrc,zprofile,zshenv})
		;;
	*)
		exit 1
		;;
esac

dotfiles+=(./dotfiles/{.aliases,.functions,vimrc})

for dotfile in "${dotfiles[@]}"; do
	source_path=$(realpath "$dotfile")
	link_dotfile "$source_path" 2>/dev/null
done
unset dotfiles

