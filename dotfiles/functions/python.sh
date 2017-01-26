pip_search () { python -m pip search "$@"; }
pip_install () { python -m pip search "$@"; }
pip_uninstall () { python -m pip uninstall "$@"; }

venv_activate () {
	local env="${HOME}/.env/${1}"
	local script

	[[ ! -d $env ]] && return 1

	if [[ -d ${env}/bin ]]; then
		script="${env}/bin/activate"
	else
		script="${env}/Scripts/activate"
	fi

	[[ -f "$script" ]] && source "$script"
}
