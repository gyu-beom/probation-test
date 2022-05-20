#!/bin/bash

NOUSER_FILES=$(find / -nouser -o -nogroup 2> /dev/null)
for NOUSER_FILE in $NOUSER_FILES
do
  rm -rf $NOUSER_FILE
done