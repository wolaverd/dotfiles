import logging
import os

logging.basicConfig(format='[%(asctime)s] %(message)s',
                    datefmt='%m/%d/%Y-%H:%M:%S',
                    filename=os.path.join(os.getcwd(), 'setup.log'),
                    filemode='a',
                    level=logging.DEBUG)


def unlink_files(dest):
    logging.info('unlink_files: passing %s', dest)
    if os.path.lexists(dest):
        logging.info('unlink_files: %s is a broken symlink', dest)
        try:
            os.unlink(dest)
        except Exception as e:
            logging.error(
                'unlink_files: unlink failed for %s: err: %s', dest, e)
            return 1


def make_parent_dir(dest):
    logging.info('make_parent_dir: passing %s', dest)
    pardir = os.path.dirname(dest)
    logging.info('make_parent_dir: %s child of: %s', dest, pardir)

    if not os.path.isdir(pardir):
        logging.info('make_parent_dir: %s not found. trying mkdir', pardir)
        try:
            os.mkdir(pardir)
        except Exception as e:
            logging.error(
                'make_parent_dir: mkdir failed for %s: err: %s', pardir, e)
            return 1


def link_files(src, dest):
    logging.info('link_files: passing %s, %s', src, dest)
    try:
        os.symlink(src, dest)
    except Exception as e:
        logging.error(
            'link_files: failed linking %s to %s: err: %s', src, dest, e)
        return 1
