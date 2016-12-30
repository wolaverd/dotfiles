#!/usr/bin/env bash -e

umask 066

dest='./test'

if [[ -d $dest ]]; then
	rm -rf ${dest}/*
else
	mkdir -p "$dest"
fi

mkdir -p ${dest}/dir-{0..5}

find "$dest" | xargs -I '{}' touch '{}'/file-{0..10}
