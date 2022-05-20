#!/bin/bash

U_28=$(ps -ef | grep "ypserv|ypbind|ypxfrd|rpc.yppasswdd|rpc.ypupdated" | grep -v 'grep' | awk '{ print $2 }')
PROCESS=($U_28)

if [ -z $PROCESS ]; then
  echo "No process named 'NIS, NIS+' is running"
else
  for process in ${PROCESS[@]}
  do
    kill -9 $process
    echo "success kill $process"
  done
fi