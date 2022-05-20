#!/bin/bash

U_26=$(ps -ef | grep "auto" | grep -v 'grep' | awk '{ print $2 }')
PROCESS=($U_26)

if [ -z $PROCESS ]; then
  echo "No process named 'auto' is running"
else
  for process in ${PROCESS[@]}
  do
    kill -9 $process
    echo "success kill $process"
  done
  ls -al /etc/rc2.d/S28autofs > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    mv /etc/rc2.d/S28autofs /etc/rc2.d/S28autofs.orig 2> /dev/null
  fi
fi
