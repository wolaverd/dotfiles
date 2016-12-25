export EDITOR='vim'

# Windows variables
if [[ -e '/cygdrive/c/Users/neeto' ]]; then
	export chome='/cygdrive/c/Users/neeto'
	export cprojects="${chome}/projects"
	export posh="${chome}/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
fi

# Bash
set -o vi

shopt -s checkwinsize
shopt -s cdspell
shopt -s globstar
shopt -s extglob dotglob nullglob
shopt -s histappend

HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth
