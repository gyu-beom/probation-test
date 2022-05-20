#!/bin/bash

grep "ftp" /etc/passwd
if [ $? -eq 0 ]; then
  userdel ftp
fi

U_21="/etc/vsftpd/vsftpd.conf"
if [ -e $U_21 ]; then
  LINE=$(egrep -n "(anonymous.*YES)" $U_21 | cut -d: -f1)
  sed -e "$LINE s/YES/NO/g" -i $U_21
fi