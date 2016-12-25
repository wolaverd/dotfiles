# Package manager
function upg {
	if [[ -f /etc/debian_version ]]; then
		sudo apt-get update -q && sudo apt-get upgrade -q
	else
		sudo pacman -Syyu
	fi
}

# Git
function gitpush {
	git add ./*
	git commit
	git push -u origin master
}

function getfilelist {
	{ find ./ -maxdepth 1 -type d \! -regex '^\.\/$'
	  find ./ -maxdepth 1 -type f
	} | sed 's/^\.\///g'
}

# Network
function net_start {
	sudo netctl start "$1" && systemctl status "netctl@${1}.service"
}

# Systemd
function start { sudo systemctl start "$1"; }
function stop { sudo systemctl stop "$1"; }
function restart { sudo systemctl restart "$@"; }
function status { sudo systemctl status "$@"; }
function enabled { sudo systemctl enable "$@"; }
function disabled { sudo systemctl disable "$@"; }
function Start { sudo systemctl start "$@"; sudo systemctl status "$@"; }
function Stop { sudo systemctl stop "$@"; sudo systemctl status "$@"; }
function Restart { sudo systemctl restart "$@"; sudo systemctl status "$@"; }
function Enable { sudo systemctl start "$@"; sudo systemctl enable "$@"; }
function ustart { systemctl --user start "$@"; }
function ustop { systemctl --user stop "$@"; }
function ustatus { systemctl --user status "$@"; }
function uenabled { systemctl --user enable "$@"; }
function udisabled { systemctl --user disable "$@"; }
function _state { systemctl --state "$@"; }

# Misc
function lefix { sed -i 's/\r//g' "$i"; }
function mkcd { mkdir -pv "$1" && cd "$1"; }
function dbg { printf "DEBUG: \$_ == %q\n" "$_" >&2; }
