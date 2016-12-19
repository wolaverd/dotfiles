[[ -f /etc/bash_completion ]] && . /etc/bash_completion
for include_file in ~/.bash/*; do
	[[ -f $include_file ]] && . "$include_file"
done

if [[ -f ~/bin/start-ssh-agent.sh ]]; then
	agent_pid="$(ps aux | awk '$8 ~ /ssh\-agent$/ {print $1}')"
	if [[ -z $agent_pid ]]; then
		. ~/bin/start-ssh-agent.sh
	elif [[ ${#agent_pid[@]} -gt 1 ]]; then
		for pid in "${agent_pid[@]}"; do
			export SSH_AGENT_PID="$pid"
			ssh-agent -k
			unset SSH_AGENT_PID
		done
	fi
	unset agent_pid
fi
