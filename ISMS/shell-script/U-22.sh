#!/bin/bash

U_22=("/etc/xinetd.d/rlogin" "/etc/xinetd.d/rsh" "/etc/xinetd.d/rexec")

for u_22 in ${U_22[@]}
do
  ls -al $u_22 2> /dev/null
  if [ $? -eq 0 ]; then
    LINE=$(egrep -n "(*disable*)" $u_22 | cut -d: -f1)
    sed -e "$LINE s/no/yes/" -i $u_22
  fi
done