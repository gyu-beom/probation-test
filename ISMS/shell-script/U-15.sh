#!/bin/bash

ID=$(awk -F":" '{ if ($3 >= 1000 && $6 ~ "/home") print $1 }' /etc/passwd)

for id in $ID
do
  BASH_LOGOUT_PER=$(ls -al /home/$id | grep ".bash_logout" | cut -d" " -f1 | sed 's/-//')
  BASH_LOGOUT_OWN=$(ls -al /home/$id | grep ".bash_logout" | cut -d" " -f3)
  BASH_PROFILE_PER=$(ls -al /home/$id | grep ".bash_profile" | cut -d" " -f1 | sed 's/-//')
  BASH_PROFILE_OWN=$(ls -al /home/$id | grep ".bash_profile" | cut -d" " -f3)
  BASHRC_PER=$(ls -al /home/$id | grep ".bashrc" | cut -d" " -f1 | sed 's/-//')
  BASHRC_OWN=$(ls -al /home/$id | grep ".bashrc" | cut -d" " -f3)

  if [ $BASH_LOGOUT_PER != "rw-r--r--" ]; then
    chmod 644 /home/$id/.bash_logout
  fi

  if [ $BASH_PROFILE_PER != "rw-r--r--" ]; then
    chmod 644 /home/$id/.bash_profile
  fi

  if [ $BASHRC_PER != "rw-r--r--" ]; then
    chmod 644 /home/$id/.bashrc
  fi

  if [[ "$BASH_LOGOUT_OWN" != $id ]] || [[ "$BASH_LOGOUT_OWN" != "root" ]]; then
    chown $id /home/$id/.bash_logout
  fi

  if [[ "$BASH_PROFILE_OWN" != $id ]] || [[ "$BASH_PROFILE_OWN" != "root" ]]; then
    chown $id /home/$id/.bash_profile
  fi

  if [[ "$BASHRC" != $id ]] || [[ "$BASHRC" != "root" ]]; then
    chown $id /home/$id/.bashrc
  fi
done