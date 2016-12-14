TERM=screen-256color
EDITOR='vim'

chome='/cygdrive/c/Users/neeto'
repos="${chome}/repos/github"

shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth

set -o vi

shopt -s checkwinsize
shopt -s cdspell
shopt -s globstar
shopt -s extglob dotglob nullglob

export TERM EDITOR
export chome repos

export posh=$(pwd)

export etc=/etc/defaults/etc
