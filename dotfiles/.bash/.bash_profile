export PATH="${HOME}/bin:/usr/lib/jvm/java-8-openjdk-amd64/jre/bin:/usr/local/bin/ignition:${PATH}"
export TERM='xterm-256color'
export EDITOR='vim'


if [ -n "$BASH_VERSION" ]; then
	[[ -f ~/.bashrc ]] && source ~/.bashrc
fi
