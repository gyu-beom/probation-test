#!/bin/bash

U_27=("/etc/xinetd.d/rpc.cmsd" "/etc/xinetd.d/ttdbserverd" "/etc/xinetd.d/sadmind" "/etc/xinetd.d/rusersd" "/etc/xinetd.d/wald" "/etc/xinetd.d/sprayd" "/etc/xinetd.d/rstatd" "/etc/xinetd.d/rpc.nisd" "/etc/xinetd.d/rexd" "/etc/xinetd.d/rpc.pcnfsd" "/etc/xinetd.d/rpc.statd" "/etc/xinetd.d/rpc.ypupdated" "/etc/xinetd.d/rpc.rquotad" "/etc/xinetd.d/kcms_server" "/etc/xinetd.d/cachefsd")

for u_27 in ${U_27[@]}
do
  ls -al $u_27 2> /dev/null
  if [ $? -eq 0 ]; then
    LINE=$(egrep -n "(*disable*)" $u_27 | cut -d: -f1)
    sed -e "$LINE s/no/yes/" -i $u_27
  fi
done

service xinetd restart

# https://armadablog.tistory.com/74