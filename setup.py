import subprocess
import os
import sys

def link_files(src, dest):
	if os.path.exists(dest) or os.path.lexists(dest):
		os.unlink(dest)

	pdir = os.path.dirname(dest)

	if not os.path.isdir(pdir):
		os.mkdir(dest_pdir)

	os.symlink(src, dest)


home = os.path.expanduser('~')
repo = os.getcwd()

dotfiles = subprocess.getoutput('git ls-files').splitlines()

for dotfile in dotfiles:
	if dotfile != 'setup.py' and dotfile != '.gitignore':
		spath = os.path.abspath(dotfile)
		dpath = os.path.join(home, dotfile)

		link_files(spath, dpath)
