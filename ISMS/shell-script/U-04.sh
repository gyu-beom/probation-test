#!/bin/bash

# U-04
U_04="PASS_MAX_DAYS"

LINE=$(grep -n "^$U_04" /etc/login.defs | cut -d: -f1 | head -1)
VALUE=$(awk -v line=$LINE 'NR==line { print $2 }' /etc/login.defs)

if [ $VALUE -gt 90 ]; then
  sed -e "$LINE s/$VALUE/90/g" -i /etc/login.defs
fi

ID=$(awk -F":" '{ if ($3 >= 1000 && $6 ~ "/home") print $1 }' /etc/passwd)

for id in $ID
do
  chage -M 90 $id
done