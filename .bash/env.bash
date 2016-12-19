export TERM=screen-256color
export EDITOR='vim'

# Windows variables
export chome='/cygdrive/c/Users/neeto'
export repos="${chome}/repos"
export cprojects="${chome}/projects"
export posh="${chome}/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"

# Cygwin variables
export etc=/etc/defaults/etc

shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth

set -o vi

shopt -s checkwinsize
shopt -s cdspell
shopt -s globstar
shopt -s extglob dotglob nullglob


