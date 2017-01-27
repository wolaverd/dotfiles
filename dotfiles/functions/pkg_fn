upg () {
	if [[ -f /etc/debian_version ]]; then
		sudo apt-get update -q && sudo apt-get upgrade -q
	elif [[ -f /etc/arch-release ]]; then
		sudo pacman -Syyu
	else
		sudo yum makecache fast
		sudo yum -y update
	fi
}

pkg_install () {
	for pkg in "$@"; do
		if pacman -Ssq "$pkg" > /dev/null; then
			sudo pacman -S --needed "$@"
		else
			pacaur -S --needed "$@"
		fi
	done
}
