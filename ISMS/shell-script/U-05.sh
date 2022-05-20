#!/bin/bash

# U-05
U_05=$(awk -F":" '{ value=($2 == "x") ? 1 : 2; print value }' /etc/passwd)
U_05_ARR=($U_05)

if [ $U_05_ARR -eq 2 ]; then
  pwconv
fi