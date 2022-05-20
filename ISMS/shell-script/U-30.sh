#!/bin/bash

U_30=$(ps -ef | grep "sendmail" | grep -v 'grep' | awk '{ print $2 }')
U_30_ARR=($U_30)

if [ ${#U_30_ARR[@]} -ne 0 ] && [ ${U_30_ARR[0]} -ne 0 ]; then
  VERSION=$(cat /etc/mail/sendmail.cf | grep DZ)
  echo $VERSION
  echo "http://www.sendmail.org 에 방문하세요."
fi