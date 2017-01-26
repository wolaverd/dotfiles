grm () {
	git rm --cached $(
		git status --porcelain | awk '$1 ~ /D/ {print $2}'
	)
}

clone_repo () { git clone git@glab:wolaver/${1}.git; }

gitpush () {
	git add ./* && git commit
	git push -u origin master
}
