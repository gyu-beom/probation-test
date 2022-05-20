#!/bin/bash

U_16=$(find / -type f -perm -2 -exec ls -l {} \; | awk '{ print $9 }')

for u_16 in $U_16
do
  chmod o-w $u_16
done

if [ $? -eq 1 ]; then
  echo "Nothing Changed."
fi