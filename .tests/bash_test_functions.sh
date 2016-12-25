# Array tests

function array_print_elements {
	local tarray="$1"

	echo "Elements: ${tarray}"
}

function array_print_quantity {
	local tarray="$1"

	echo "${#tarray[@]} elements in tarray."
}

function array_loop_indicies {
	local tarray="$1"

	for index in "${#tarray[@]}"; do
		echo -e "Index: ${index}\t Element: ${!tarray[${index}]}"
	done
}

# File tests

function file_null {
	local tarray="$1"

	if [[ -z $tarray ]]; then
		echo "true"
	fi
}

function file_execute_bit_set {
	local path
	path="$1"

	if [[ -x $path ]]; then
		echo "true"
	fi
}

function file_size_gt_zero {
	local path
	path="$1"

	if [[ -s $path ]]; then
		echo "true"
	fi
}

function file_modified_since_last_read {
	local path
	path="$1"

	if [[ -N $path ]]; then
		echo "true"
	fi
}

function regular_file_exists {
	local path
	path="$1"

	if [[ -f $path ]]; then
		echo "true"
	fi
}
