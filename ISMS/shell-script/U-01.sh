#!/bin/bash

# U-01
# U-01 | 01
grep "pts" /etc/securetty
if [ $? -eq 0 ]; then
  sed -i "/pts/d" /etc/securetty
fi

# U-01 | 02
PRL="PermitRootLogin"

egrep "($PRL.*no)" /etc/ssh/sshd_config
if [ $? -eq 1 ]; then
  egrep "(^$PRL.*yes)" /etc/ssh/sshd_config
  if [ $? -eq 0 ]; then
    LINE=$(egrep -n "(^$PRL.*yes)" /etc/ssh/sshd_config | cut -d: -f1 | head -1)
	sed -e "$LINE c\\$PRL no" -i /etc/ssh/sshd_config
  else
    LINE=$(egrep -n "(#$PRL.*yes)" /etc/ssh/sshd_config | cut -d: -f1 | head -1)
	sed -e "$LINE a\\$PRL no" -i /etc/ssh/sshd_config
  fi
fi