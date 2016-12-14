ENV_FILE=${HOME}/.ssh/environment

start_agent () {
	ssh-agent | sed 's/^echo/#echo/' > "$ENV_FILE"
	[[ -x $ENV_FILE ]] && chmod 600 "$ENV_FILE"
	source "$ENV_FILE" > /dev/null
	for i in ~/.ssh/*; do
		case "$i" in
			*keys|*.pub|*config*|*known_hosts*|*environment*) continue;;
			*) ssh-add "$i";;
		esac
	done
}

if [[ -f $ENV_FILE ]]; then
	source "$ENV_FILE" > /dev/null
	ps -p "$SSH_AGENT_PID" > /dev/null || start_agent;
else
	start_agent;
fi
