#!/bin/bash

PERMISSION=$(ls -l /etc/xinetd.conf | cut -d" " -f1 | sed -'s/-//')
OWN=$(ls -l /etc/xinetd.conf | cut -d" " -f3)

if [ $PERMISSION != "rw-r--r--" ]; then
  chmod 644 /etc/xinetd.conf
fi

if [ $OWN != "root" ]; then
  chown root /etc/xinetd.conf
fi