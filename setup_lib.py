import os


def unlink_files(dest):
    print('unlink_files: passing %s' % dest)
    if os.path.lexists(dest):
        print('unlink_files: %s is a broken symlink' % dest)
        try:
            os.unlink(dest)
        except Exception as e:
            print(
                'unlink_files: unlink failed for %s: err: %s', dest, e)
            return 1


def make_parent_dir(dest):
    print('make_parent_dir: passing %s' % dest)
    pardir = os.path.dirname(dest)
    print('make_parent_dir: %s child of: %s' % dest, pardir)

    if not os.path.isdir(pardir):
        print('make_parent_dir: %s not found. trying mkdir' % pardir)
        try:
            os.mkdir(pardir)
        except Exception as e:
            print(
                'make_parent_dir: mkdir failed for %s: err: %s' % pardir, e)
            return 1


def link_files(src, dest):
    print('link_files: passing %s, %s' % src, dest)
    try:
        os.symlink(src, dest)
    except Exception as e:
        print(
            'link_files: failed linking %s to %s: err: %s' % src, dest, e)
        return 1
