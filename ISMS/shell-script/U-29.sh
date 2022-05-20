#!/bin/bash

U_29=("/etc/xinetd.d/tftp" "/etc/xinetd.d/talk" "/etc/xinetd.d/ntalk")

for u_29 in ${U_29[@]}
do
  ls -al $u_29 2> /dev/null
  if [ $? -eq 0 ]; then
    LINE=$(egrep -n "(*disable*)" $u_29 | cut -d: -f1)
    sed -e "$LINE s/no/yes/" -i $u_29
  fi
done

service xinetd restart