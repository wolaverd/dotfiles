if [[ -f /etc/bash_completion ]]; then
	source '/etc/bash_completion'
fi

<<<<<<< HEAD
for dfile in ~/.bash/*; do
	if [[ -f $dfile ]]; then
		source "$dfile"
	fi
done
=======
for include in ~/.bash/*; do
	source "$include"
done

source ~/bin/start-ssh-agent.sh

>>>>>>> 1e0e48320c830b0c017d6fcbdb5512884d8be89c
