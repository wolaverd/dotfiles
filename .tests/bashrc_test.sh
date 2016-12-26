source './bash_test_functions.sh'


if [[ -f /etc/bash_completion ]]; then
	file_modified_since_last_read '/etc/bash_completion'
fi

if [[ -f /home/neeto/bin/start_ssh_agent.sh ]]; then
	file_modified_since_last_read /home/neeto/bin/start_ssh_agent.sh
fi

for include in ~/.bash/*; do
	if [[ -f $include ]]; then
		file_modified_since_last_read "$include"
	fi
done
