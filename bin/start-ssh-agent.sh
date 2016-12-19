SSH_ENV_FILE=${HOME}/.ssh/environment

function start_agent {
	ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV_FILE"
	[[ -x $SSH_ENV_FILE ]] && chmod 600 "$SSH_ENV_FILE"
	source "$SSH_ENV_FILE" > /dev/null
	for i in ~/.ssh/*; do
		case "$i" in
			*keys|*.pub|*config*|*known_hosts*|*environment*) continue;;
			*) ssh-add "$i";;
		esac
	done
}

if [[ -f $SSH_ENV_FILE ]]; then
	source "$SSH_ENV_FILE" > /dev/null
	ps -p "$SSH_AGENT_PID" > /dev/null || start_agent;
else
	start_agent;
fi
