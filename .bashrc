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

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Prompt
esc='\033';             white="\[${esc}[01;00m\]";      inv="\[${esc}[7m\]"
reset="\[${esc}[00m\]"; cyan="\[${esc}[96m\]"

[[ -n $SSH_CONNECTION ]] && export sshPrompt="${SSH_CONNECTION/ * /:}"
[[ -n $VIRTUAL_ENV ]] && export envName="${VIRTUAL_ENV##*/}"

PS1="${ssh_prompt:+($sshPrompt) }${VIRTUAL_ENV:+($envName) }"
PS1="${PS1}${inv}[\@]${reset} "                # hh:mm am/pm clock
PS1="${PS1}\u@\h: "                            # user@host:
PS1="${PS1}${inv}\w${reset}\n> "               # relpath to wd
export PS1
unset esc white inv reset cyan

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

[[ -f ~/.functions ]] && source ~/.functions
[[ -f ~/.aliases ]] && source ~/.aliases

