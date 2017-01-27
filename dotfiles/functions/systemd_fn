start () { sudo systemctl start "$@"; }
stop () { sudo systemctl stop "$@"; }
restart () { sudo systemctl restart "$@"; }
status () { sudo systemctl status "$@"; }
enabled () { sudo systemctl enable "$@"; }
disabled () { sudo systemctl disable "$@"; }

Start () { sudo systemctl start "$@"; sudo systemctl status "$@"; }
Stop () { sudo systemctl stop "$@"; sudo systemctl status "$@"; }
Restart () { sudo systemctl restart "$@"; sudo systemctl status "$@"; }
Enable () { sudo systemctl enable "$@"; sudo systemctl status "$@"; }
Disable () { sudo systemctl enable "$@"; sudo systemctl status "$@"; }

State () { systemctl --state="$@"; }

ustart () { systemctl --user start "$@"; }
ustop () { systemctl --user stop "$@"; }
ustatus () { systemctl --user status "$@"; }
uenabled () { systemctl --user enable "$@"; }
udisabled () { systemctl --user disable "$@"; }
