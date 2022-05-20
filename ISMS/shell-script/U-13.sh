#!/bin/bash

PERMISSION=$(ls -l /etc/services | cut -d" " -f1 | sed 's/-//')
OWN=$(ls -l /etc/services | cut -d" " -f3)

if [ $PERMISSION != "rw-r--r--" ]; then
  chmod 644 /etc/services
fi

if [ $OWN != "root" ]; then
  chown root /etc/services
fi