#!/usr/bin/env python

import sys
import os
import subprocess
import tempfile

try:
    from __futures__ import print_function
except ImportError:
    pass
finally:
    print('On {}'.format(sys.version))

SSH_HOME = '{HOME}/.ssh'.format(HOME=os.environ.get('HOME'))
SSH_ADD_CMD = 'ssh-add'
# get passwords from the keychain if applicable
SSH_FILES = (
    'id_rsa',
    'id_rsa_dbz_prod',
    'id_rsa_dbz_github',
    'id_rsa_dubizzle_test',
)

def cmd_run(cmd):
    output = ''
    try:
        result = subprocess.run(cmd)
        if result.returncode:
            output = result.stderr
    except AttributeError:
        with tempfile.TemporaryFile() as temp_file:
            result = subprocess.call(cmd, stderr=temp_file)
            if result:
                temp_file.seek(0,0)
                output = temp_file.readlines()
    finally:
        return output

def run():
    for ssh_file in SSH_FILES:
        abs_ssh_file = os.path.join(SSH_HOME, ssh_file)
        cmd = "{cmd} {ssh_file}".format(cmd=SSH_ADD_CMD, ssh_file=abs_ssh_file).split(' ')
        output = cmd_run(cmd)
        if output:
            print('Failed Output:\n{err}'.format(err=result.stderr))
            break


if __name__ == "__main__":
    run()
