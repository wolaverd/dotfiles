#if [[ -f /usr/share/bash-completion/bash_completion ]]; then
#	source /usr/share/bash-completion/bash_completion
#fi

for include in ~/.bash/*; do
	if [[ -f $include ]]; then
		source "$include"
	fi
done

