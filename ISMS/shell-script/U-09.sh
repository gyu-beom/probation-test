#!/bin/bash

PERMISSION=$(ls -l /etc/shadow | cut -d" " -f1 | sed 's/-//')
OWN=$(ls -l /etc/shadow | cut -d" " -f3)

if [ $PERMISSION != "r--------" ]; then
  chmod 400 /etc/shadow
fi

if [ $OWN != "root" ]; then
  chown root /etc/shadow
fi