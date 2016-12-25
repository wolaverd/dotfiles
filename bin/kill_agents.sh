# Get list of agent pids to work with.
agent_pid="$(ps aux | awk '$8 ~ /ssh\-agent$/ {print $1}')"

if [[ "${#agent_pid[@]}" -ne 0 ]]; then
	# If number of pids in agent_pid is more than one, kill them all.
	for pid in "${agent_pid[@]}"; do
		# Export agent pid to environment.
		SSH_AGENT_PID="$pid"
		export SSH_AGENT_PID
		# Kill agent with ssh-agent.
		ssh-agent -k > /dev/null
	done
fi
