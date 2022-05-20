#!/bin/bash

PERMISSION=$(ls -l /etc/rsyslog.conf | cut -d" " -f1 | sed 's/-//')
OWN=$(ls -l /etc/rsyslog.conf | cut -d" " -f3)

if [ $PERMISSION != "rw-r--r--" ]; then
  chmod 644 /etc/rsyslog.conf
fi

if [ $OWN != "root" ]; then
  chown root /etc/rsyslog.conf
fi