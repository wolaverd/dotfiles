set -o vi

builtins=(
	'histappend'
	'checkwinsize'
	'cmdhist'
	'complete_fullquote'
	'expand_aliases'
	'extglob'
	'extquote'
	'force_fignore'
	'histappend'
	'interactive_comments'
	'progcomp'
	'promptvars'
	'sourcepath'
)

for builtin in "${builtins[@]}"; do
	shopt -q "$builtin" && ret="$?"
	[[ $ret -eq 1 ]] && shopt -s "$builtin"
done
unset builtins

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

[[ -n $SSH_CONNECTION ]] && sshPrompt="${SSH_CONNECTION/ * /:}"
[[ -n $VIRTUAL_ENV ]] && envName="${VIRTUAL_ENV##*/}"

if [ "$color_prompt" = yes ]; then
	PS1='${ssh_prompt:+($sshPrompt)\n}${VIRTUAL_ENV:+($envName)\n}[\@] \[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\]\n> '
else
    PS1='${ssh_prompt:+($sshPrompt)\n}${VIRTUAL_ENV:+($envName)\n}[\@] \u@\h: \w\n> '
fi
unset color_prompt force_color_prompt

#case "$TERM" in
#xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #;;
#*)
    #;;
#esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

[[ -f ~/.functions ]] && source ~/.functions
[[ -f ~/.aliases ]] && source ~/.aliases

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
