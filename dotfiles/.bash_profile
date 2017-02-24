PATH='/bin:/sbin:/usr/bin:/usr/sbin'
PATH="${HOME}/.rvm/bin:${PATH}"
PATH="${HOME}/bin:${PATH}"
PATH="/usr/lib/jvm/java-8-openjdk-amd64/jre/bin:${PATH}"
PATH="/usr/local/bin/ignition:${PATH}"
export PATH
export TERM='xterm-256color'
export EDITOR='vim'


if [ -n "$BASH_VERSION" ]; then
	[[ -f ~/.bashrc ]] && source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
