net_start () {
		local conn="$1"
		[[ -f /etc/netctl/${conn} ]] && sudo netctl start "$conn"
}