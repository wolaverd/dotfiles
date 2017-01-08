if [[ -f ${HOME}/.bashrc ]]; then
	source "${HOME}/.bashrc"
fi

if [[ -d ${HOME}/bin ]]; then
	PATH="${HOME}/bin:${PATH}"
fi
