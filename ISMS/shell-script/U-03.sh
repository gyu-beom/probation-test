#!/bin/bash

# U-03
U_03="pam_tally2.so deny=5 no_magic_root"

AUTH_TARGET="pam_env.so"
ACCOUNT_TARGET="pam_unix.so"

# U-03 | 01
# system-auth | auth
egrep "(^auth.*$U_03)" /etc/pam.d/system-auth
if [ $? -eq 1 ]; then
  AUTH_LINE=$(egrep -n "(^auth.*$AUTH_TARGET)" /etc/pam.d/system-auth | cut -d: -f1 | head -1)
  
  AUTH_CP_SOURCE=$(awk 'NR=='"$AUTH_LINE"' { print $0 }' /etc/pam.d/system-auth)
  sed -e "$AUTH_LINE a\\$AUTH_CP_SOURCE" -i /etc/pam.d/system-auth
  
  AUTH_NEW_LINE=$(echo `expr $AUTH_LINE + 1`)
  sed -e "$AUTH_NEW_LINE s/$AUTH_TARGET/$U_03/g" -i /etc/pam.d/system-auth
fi

# system-auth | account
egrep "(^account.*$U_03)" /etc/pam.d/system-auth
if [ $? -eq 1 ]; then
  ACCOUNT_LINE=$(egrep -n "(^account.*$ACCOUNT_TARGET)" /etc/pam.d/system-auth | cut -d: -f1 | head -1)
  
  ACCOUNT_CP_SOURCE=$(awk 'NR=='"$ACCOUNT_LINE"' { print $0 }' /etc/pam.d/system-auth)
  sed -e "$ACCOUNT_LINE a\\$ACCOUNT_CP_SOURCE" -i /etc/pam.d/system-auth
  
  ACCOUNT_NEW_LINE=$(echo `expr $ACCOUNT_LINE + 1`)
  sed -e "$ACCOUNT_NEW_LINE s/$ACCOUNT_TARGET/$U_03/g" -i /etc/pam.d/system-auth
fi

# U-03 | 02
# password-auth | auth
egrep "(^auth.*$U_03)" /etc/pam.d/password-auth
if [ $? -eq 1 ]; then
  AUTH_LINE=$(egrep -n "(^auth.*$AUTH_TARGET)" /etc/pam.d/password-auth | cut -d: -f1 | head -1)
  
  AUTH_CP_SOURCE=$(awk 'NR=='"$AUTH_LINE"' { print $0 }' /etc/pam.d/password-auth)
  sed -e "$AUTH_LINE a\\$AUTH_CP_SOURCE" -i /etc/pam.d/password-auth
  
  AUTH_NEW_LINE=$(echo `expr $AUTH_LINE + 1`)
  sed -e "$AUTH_NEW_LINE s/$AUTH_TARGET/$U_03/g" -i /etc/pam.d/password-auth
fi

# password-auth | account
egrep "(^account.*$U_03)" /etc/pam.d/password-auth
if [ $? -eq 1 ]; then
  ACCOUNT_LINE=$(egrep -n "(^account.*$ACCOUNT_TARGET)" /etc/pam.d/password-auth | cut -d: -f1 | head -1)
  
  ACCOUNT_CP_SOURCE=$(awk 'NR=='"$ACCOUNT_LINE"' { print $0 }' /etc/pam.d/password-auth)
  sed -e "$ACCOUNT_LINE a\\$ACCOUNT_CP_SOURCE" -i /etc/pam.d/password-auth
  
  ACCOUNT_NEW_LINE=$(echo `expr $ACCOUNT_LINE + 1`)
  sed -e "$ACCOUNT_NEW_LINE s/$ACCOUNT_TARGET/$U_03/g" -i /etc/pam.d/password-auth
fi