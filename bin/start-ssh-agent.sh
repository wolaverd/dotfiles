ssh_environment=${HOME}/.ssh/environment

function start_agent {
	ssh-agent | sed 's/^echo/#echo/' > "$ssh_environment"
	[[ -x $ssh_environment ]] && chmod 600 "$ssh_environment"
	source "$ssh_environment" > /dev/null
	for i in ~/.ssh/*; do
		case "$i" in
			*keys|*.pub|*config*|*known_hosts*|*environment*) continue;;
			*) ssh-add "$i";;
		esac
	done
}

if [[ -f $ssh_environment ]]; then
	source "$ssh_environment" > /dev/null
	ps -p "$SSH_AGENT_PID" > /dev/null || start_agent;
else
	start_agent;
fi
