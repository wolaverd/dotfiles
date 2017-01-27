lefix () { sed -i 's/\r//g' "$@"; }
mkcd () { mkdir -pv "$1" && cd "$1"; }
dbg () { printf "DEBUG: \$_ == %q\n" "$_" >&2; }

mantoc () {
	local manpage="$1"

	man "$manpage" | cat | grep -o '^[A-Z][A-Z -]\+'
}

mountext () {
	local device="$1"
	local mountpoint="$2"

	if [[ -b $device ]]; then
		sudo mount "$device" "$mountpoint" -o user,rw,umask=111,dmask=000
	fi
}

getfilelist () {
	{ find ./ -maxdepth 1 -type d \! -regex '^\.\/$'
	  find ./ -maxdepth 1 -type f
	} | sed 's/^\.\///g'
}

archive_dotfiles () {
	find ~ -maxdepth 2 -type f -regex '^\.\/\.z[^_-]+' \! -path "*.git*"
}