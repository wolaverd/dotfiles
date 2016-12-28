if [[ -f /etc/bash_completion ]]; then
	source '/etc/bash_completion'
fi

for include in ~/.bash/*; do
	if [[ ! $include =~ history$ ]]; then
		source "$include"
	fi
done

source ~/bin/start-ssh-agent

