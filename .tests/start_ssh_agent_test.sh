agent_pid="$(ps aux | awk '$8 ~ /ssh\-agent$/ {print $1}')"

if [[ -f ./bash_test_functions.sh ]]; then
	source './bash_test_functions.sh'
fi

print_elements
echo ''
print_quantity
echo ''
loop_array
