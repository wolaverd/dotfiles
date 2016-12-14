start() { sudo systemctl start "$1"; }
stop() { sudo systemctl stop "$1"; }
restart() { sudo systemctl restart "$@"; }
status() { sudo systemctl status "$@"; }
enabled() { sudo systemctl enable "$@"; }
disabled() { sudo systemctl disable "$@"; }

Start() { sudo systemctl start "$@"; sudo systemctl status "$@"; }
Stop() { sudo systemctl stop "$@"; sudo systemctl status "$@"; }
Restart() { sudo systemctl restart "$@"; sudo systemctl status "$@"; }

ustart() { systemctl --user start "$@"; }
ustop() { systemctl --user stop "$@"; }
ustatus() { systemctl --user status "$@"; }
uenabled() { systemctl --user enable "$@"; }
udisabled() { systemctl --user disable "$@"; }

_state() { systemctl --state "$@"; }


upg() {
	if [[ -f /etc/debian_version ]]; then
		sudo apt-get update -q && sudo apt-get upgrade -q
	else
		sudo pacman -Syyu
	fi
}

secmode() {
	for i in "$@" ; do
		if [[ -d $i ]]; then
			chmod 700 "$i"
			chmod 600 ${i}/*
		elif [[ -f $i ]]; then
			chmod 600 "$i"
		else
			continue
		fi
	done
}

lefix() {
	for i in "$@"; do
		sed -i 's/\r//g' "$i"
	done
}

mkcd() {
	mkdir -pv "$1" && cd "$1"
}

lsgit() { find "$1" -type d -regex '.+/\.git$' -print; }

gitpush() {
	if [[ -z $1 ]]; then
		echo 'Commit message: '; read cm || return 1
	else
		local cm="$1"
	fi
		git add ./*
		git commit -m "$cm" || return 1
		git push -u origin master
}

dbg() { printf "DEBUG: \$_ == %q\n" "$_" >&2; }

ytdl() {
	local dldir="${HOME}/Music/youtube"
	local url name pdir
	
	case "$1" in
		-p) name="$2"; url="$3";;
		*) name="$1"; url="$2";;
	esac

	pdir="${dldir}/${name}"
	[[ ! -d $pdir ]] && mkdir -p "$pdir"
	
	if [[ $1 = '-p' ]]; then
		youtube-dl --yes-playlist -x --embed-thumbnail --audio-format 'mp3' \
			-o "${pdir}/%(title)s.%(ext)s" "$url"
	else
		youtube-dl -x --embed-thumbnail --audio-format 'mp3' \
			-o "${pdir}/%(title)s.%(ext)s" "$url"
	fi
}

kill_agents() {
	local agent_pid=$(pgrep -f 'ssh-agent')
	if [[ $(echo "$agent_pid" | wc -w) -gt 1 ]]; then
		for i in "${agent_pid[@]}"; do
			export SSH_AGENT_PID="$i"
			ssh-agent -k
		done
	fi
}

net_start() {
	sudo netctl start 'wlo1-Casuals_Plebs' &
}
