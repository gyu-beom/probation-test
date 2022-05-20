#!/bin/bash

# U-02
U_02="pam_pwquality.so try_first_pass local_users_only enforce_for_root retry=3 authtok_type= minlen=8 dcredit=-1 ucredit=-1 lcredit=-1 ocredit=-1"

egrep "$U_02" /etc/pam.d/system-auth
if [ $? -eq 1 ]; then
  TARGET=$(echo $U_02 | awk -F" " '{ print $1 }')
  LINE=$(egrep -n "(^password.*$TARGET)" /etc/pam.d/system-auth | cut -d: -f1 | head -1)
  sed -e "$LINE s/$TARGET/$U_02/g" -i /etc/pam.d/system-auth
fi