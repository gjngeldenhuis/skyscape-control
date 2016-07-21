#!/bin/bash
# For some reason this does not work directly as the conf_version script
# Expecting the environment as the first parameter
cd /etc/puppetlabs/code/environments/$1
/usr/bin/git status | /usr/bin/head -n1 | /usr/bin/cut -d" " -f4
