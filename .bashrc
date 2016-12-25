if [[ -f /etc/bash_completion ]]; then
	source '/etc/bash_completion'
fi

for include in ~/.bash/*; do
	if [[ -f $include ]]; then
		source "$include"
	fi
done

source ~/bin/start-ssh-agent.sh
