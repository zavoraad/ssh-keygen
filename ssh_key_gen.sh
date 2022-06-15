#!/bin/bash

################################
#
# Author: Aaron Zavora 
#
#  Set up automatic log in through SSH 
#
##################################

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` <Target Servername>"
    exit
fi

target=$1

pushd ~/.ssh/

if [ ! -d ~/.ssh ]; then
    echo "Creating SSH directory..."
    mkdir ~/.ssh
fi

if [ ! -f ~/.ssh/id_rsa ]; then
    echo "Creating new private key... keep hitting enter"
    ssh-keygen -t rsa
fi

#copy public key to host
ssh ${target} 'if [ ! -d ~/.ssh ]; then mkdir ~/.ssh; fi'
scp ~/.ssh/id_rsa.pub ${target}:~/.ssh/new_id_rsa.pub

#add to authorized keys and set permissions on directory
ssh ${target} 'cat ~/.ssh/new_id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/* '
chmod 600 ~/.ssh/* 
