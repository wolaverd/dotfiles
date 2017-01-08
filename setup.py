import subprocess
import logging
import os
import sys

import setup_lib as sl

home = os.path.expanduser('~')
logging.info('home is %s', home)

repo = os.getcwd()
logging.info('repo is %s', repo)

dotfiles = subprocess.getoutput('git ls-files').splitlines()

for dotfile in dotfiles:
    logging.info('loop: dotfile is %s', dotfile)

    if dotfile != 'setup.py' and dotfile != '.gitignore':
        spath = os.path.abspath(dotfile)
        logging.info('loop: spath is %s', spath)

        dpath = os.path.join(home, dotfile)
        logging.info('loop: dpath is %s', dpath)

        try:
            sl.unlink_files(dpath)
        except Exception as e:
            logging.error(
                'unlink_files: unlink failed for %s: err: %s', dpath, e)
            sys.exit(1)

        try:
            sl.make_parent_dir(dpath)
        except Exception as e:
            logging.error(
                'make_parent_dir: mkdir failed for %s: err: %s', dpath, e)
            sys.exit(1)

        try:
            sl.link_files(spath, dpath)
        except Exception as e:
            logging.error(
                'link_files: failed linking %s to %s: err: %s',
                spath, dpath, e)
            sys.exit(1)
