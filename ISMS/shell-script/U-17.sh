#!/bin/bash

U_17=("$HOME/.rhosts" "/etc/hosts.equiv")

for u_17 in ${U_17[@]}
do
  ls -al $u_17 2> /dev/null
  if [ $? -eq 0 ]; then
    chown root $u_17
    chmod 600 $u_17
    sed -e "s/+//g" -i $u_17
  fi
done