#!/usr/bin/env bash

ssh-keygen -q -N "" -t rsa -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Disable strict host key checking
echo "    StrictHostKeyChecking no                     " | tee -a /etc/ssh/ssh_config
# Disable strict modes for less strict permission checking
echo "StrictModes no" | tee -a /etc/ssh/sshd_config

ls -ld ~/.ssh
ls -l ~/.ssh

service ssh restart
