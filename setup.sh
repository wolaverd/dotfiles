function link_file {
	local src dest ddir
	
	src="$1"
	dest="$2"
	ddir="${dest%/*}"

	rm -f "$dest" 2> /dev/null
	
	[[ ! -d $ddir ]] && mkdir -p "$ddir"

	ln -s "$src" "$dest"
}

workdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

files="$(git ls-files | grep -v '\.gitignore\|setup.sh')"
echo "$files"

for file in "${files[@]}"; do
	echo "$file"
done
