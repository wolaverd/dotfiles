if [[ -f /etc/bash_completion ]]; then
	source '/etc/bash_completion'
fi

for dfile in ~/.bash/*; do
	if [[ -f $dfile ]]; then
		source "$dfile"
	fi
done
