#!/usr/bin/python
""" Module prepare work environment to work """

import logging
import os
import shutil
import subprocess
import sys
import time


def join(*args):
    """ Function joins path """
    return os.path.join(*args)

# Working Directory, Home Directory, Dot Backup
WD = os.path.dirname(sys.argv[0])
HD = subprocess.check_output('echo ~', shell=True).rstrip()
DB = join(HD, 'dot_backup')

FILES = ('bashrc', 'bash_aliases', 'gitconfig', 'git-completion.bash', 'vimrc')
DOT_FILES = tuple('.' + _file for _file in FILES)

LOG_FILE = join(HD, 'script.log')
LOG_FORMAT = '%(asctime)s - %(levelname)s - %(message)s'
logging.basicConfig(filename=LOG_FILE,
                    filemode='w',
                    level=logging.DEBUG,
                    format=LOG_FORMAT)

CONSOLE = logging.StreamHandler()
CONSOLE.setLevel(logging.INFO)
FORMATTER = logging.Formatter(LOG_FORMAT)
CONSOLE.setFormatter(FORMATTER)
logging.getLogger('').addHandler(CONSOLE)


def create(directory):
    """ Function create dir """
    logging.info('Trying to create %s directory', directory)

    try:
        os.mkdir(directory)
    except OSError:
        logging.info('%s already exists', directory)
    else:
        logging.info('%s created', directory)


def move(dot_files, files):
    """ Function moves files from HD to DB """

    for dot_file, _file in zip(dot_files, files):
        old = join(HD, dot_file)
        new = join(DB, _file)
        logging.info('Trying to move %s -> %s', old, new)

        try:
            os.rename(old, new)
        except OSError:
            logging.info("%s didn't exist", old)
        else:
            logging.info('%s moved', old)


def copy(files, dot_files):
    """ Function copies files from WD to HD """

    for _file, dot_file in zip(files, dot_files):
        old = join(WD, _file)
        new = join(HD, dot_file)
        logging.info('Copying %s -> %s', old, new)

        shutil.copy(old, new)


def remove(directory):
    """ Function removes dir if empty """
    logging.info('Trying to remove %s', directory)

    try:
        os.removedirs(directory)
    except OSError:
        logging.info('%s is not empty', directory)
    else:
        logging.info('%s removed', directory)


def download():
    """ Function downloads vim-plug """
    logging.info('Downloading plug-vim to ~/.vim/autoload')

    command = "curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    call = subprocess.call(command, shell=True)
    if call:
        logging.error("Couldn't downoload plug.vim")
    return call


def install():
    """ Function installs all plugins """
    logging.info('Installing plugins from ~/.vimrc')

    subprocess.call('nohup vim -c PlugInstall > /dev/null &', shell=True)


def main():
    """ Function makes whole job """

    started = time.time()
    create(DB)
    move(DOT_FILES, FILES)
    copy(FILES, DOT_FILES)
    remove(DB)

    err = download()
    if not err:
        install()

    lasts = time.time() - started
    logging.info('All done in %ss', round(lasts, 3))


if __name__ == '__main__':
    main()
