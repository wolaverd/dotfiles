if [[ -f /etc/bash_completion ]]; then
	source '/etc/bash_completion'
fi

for include in ~/.bash/*; do
	source "$include"
done

source ~/bin/start-ssh-agent.sh

