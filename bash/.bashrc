set -o vi

builtins=('histappend'
		  'checkwinsize'	# Update LINES and COLUMNS after each command if necessary.
		  'cmdhist'	    	# Try to save multi-line commands in a single history entry.
		  'dotglob'
		  'extglob')

for builtin in "${builtins[@]}"; do
	shopt -q "$builtin"; [[ $? -eq 1 ]] && shopt -s "$builtin"
done
unset builtins

filesToSource=(/usr/share/bash-completion/bash_completion
	   		   /etc/bash_completion
	   		   ~/.{functions,aliases,bash_env,prompt})

sourceFile() { [[ -f $1 ]] && source "$1"; }

for fileToSource in "${filesToSource[@]}"; do
	sourceFile "$fileToSource"
done
