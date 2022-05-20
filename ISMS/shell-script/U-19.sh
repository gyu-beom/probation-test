#!/bin/bash

CHECKLIST="/etc/crontab /etc/cron.allow /etc/cron.deny"
U_19=($CHECKLIST)

for u_19 in ${U_19[@]}
do
  ls -l $u_19 2> /dev/null
  if [ $? -eq 0 ]; then
    PERMISSION=$(ls -l $u_19 | awk '{ print $1 }' | sed 's/-//')
    OWN=$(ls -l $u_19 | awk '{ print $3 }')
    if [ $PERMISSION != "rw-r-----" ]; then
      chmod 640 $u_19
    fi
    if [ $OWN != "root" ]; then
      chown root $u_19
    fi
  fi
done