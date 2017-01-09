import subprocess
import os
import sys

import setup_lib as sl

home = os.path.expanduser('~')
print('home is {0}'.format(home))

repo = os.getcwd()
print('repo is {0}'.format(repo))

dotfiles = subprocess.getoutput('git ls-files').splitlines()

for dotfile in dotfiles:
    print('loop: dotfile is {0}'.format(dotfile))

    if dotfile != 'setup.py' and dotfile != '.gitignore':
        spath = os.path.abspath(dotfile)
        print('loop: spath is {0}'.format(spath))

        dpath = os.path.join(home, dotfile)
        print('loop: dpath is {0}'.format(dpath))

        try:
            sl.unlink_files(dpath)
        except Exception as e:
            print(
                'unlink_files: unlink failed for {0}: err: {1}'.format(
                    dpath, e))
            sys.exit(1)

        try:
            sl.make_parent_dir(dpath)
        except Exception as e:
            print(
                'make_parent_dir: mkdir failed for {0}: err: {1}'.format(
                    dpath, e))
            sys.exit(1)

        try:
            sl.link_files(spath, dpath)
        except Exception as e:
            print(
                'link_files: failed linking {0} to {1}: err: {2}'.format(
                    spath, dpath, e))
            sys.exit(1)

print('changing ssh file permissions')

ssh_dir = os.path.join(home, '.ssh')

print("chmod dir: {0}".format(ssh_dir))
os.chmod(ssh_dir, 700)

for ssh_file in os.listdir(ssh_dir):
    print("chmod file: {0}".format(ssh_file))
    os.chmod(ssh_file, 600)

