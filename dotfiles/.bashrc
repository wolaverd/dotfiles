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

for bash_builtin in "${builtins[@]}"; do
	# check return value from shopt -q
	# 1: enabled, 0: otherwise
	shopt -q "$bash_builtin" && ret="$?"
	[[ $ret = 1 ]] && echo "$bash_builtin"
done
unset builtins


HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000


if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
else
	color_prompt=
fi

if [ -n "$SSH_CONNECTION" ]; then
    ssh_prompt="${SSH_CONNECTION/ * /:}"
fi

if [ "$color_prompt" = yes ]; then
	# Change prompt for SSH connections.
	PS1='${debian_chroot:+($debian_chroot) }${ssh_prompt:+($ssh_prompt) }[\@] \[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\]\n> '
else
    PS1='${debian_chroot:+($debian_chroot)}${ssh_prompt:+($ssh_prompt) }[\@] \u@\h: \w\n> '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


[[ -f ~/.functions ]] && source ~/.functions
[[ -f ~/.aliases ]] && source ~/.aliases


if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

