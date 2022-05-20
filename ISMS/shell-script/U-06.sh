#!/bin/bash

# U-06
LINE=$(grep -n "^PATH" ~/.bash_profile | cut -d: -f1 | head -1)
U_06=$(awk -v line=$LINE 'NR==line { value=($0 !~ ".") ? 1 : 2; print value }' ~/.bash_profile)

if [[ "$PATH" == *.* ]] || [[ "$U_06" -eq 2 ]]; then
  sed -i "$LINE s/\.//g" ~/.bash_profile
fi