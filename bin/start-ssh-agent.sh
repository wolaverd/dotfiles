umask 066

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ssh_environment=${HOME}/.ssh/environment

function start_agent {
	# Write ssh-agent startup vars to disk.
	ssh-agent | sed 's/^echo/#echo/' > "$ssh_environment"
	source "$ssh_environment" > /dev/null
}

function add_keys {
	# Add id_rsa to agent.
	if [[ -n $SSH_AGENT_PID ]]; then
		for key in ~/.ssh/*; do
			case "$key" in
				*id_rsa) ssh-add "$key";;
				*) continue;;
			esac
		done
	fi
}

if [[ -f ${scriptdir}/kill_agent.sh ]]; then
	source "${scriptdir}/kill_agent.sh"
fi

if [[ -f $ssh_environment ]]; then
	source "$ssh_environment" > /dev/null
	ps -p "$SSH_AGENT_PID" > /dev/null || start_agent
else
	start_agent
fi

add_keys
