#!/usr/bin/env python
import sys
import os
import platform
import subprocess

try:
    from __futures__ import print_function
except ImportError:
    pass
finally:
    print('On {}'.format(sys.version))

SSH_HOME = '{HOME}/.ssh'.format(HOME=os.environ.get('HOME'))
SSH_ADD_CMD = 'ssh-add'
# get passwords from the keychain if applicable
SSH_ADD_OPTS = '-K' if platform.system().lower() == 'darwin' else ''
SSH_FILES = (
    'id_rsa',
    'id_rsa_dbz_prod',
    'id_rsa_dbz_github',
    'id_rsa_dubizzle_test',
)


def run():
    for ssh_file in SSH_FILES:
        abs_ssh_file = os.path.join(SSH_HOME, ssh_file)
        cmd = "{cmd} {opts} {ssh_file}".format(cmd=SSH_ADD_CMD, opts=SSH_ADD_OPTS, ssh_file=abs_ssh_file).split(' ')
        result = subprocess.run(cmd)
        if result.returncode:
            print('Failed Output:\n{err}'.format(err=result.stderr))
            break


if __name__ == "__main__":
    run()
