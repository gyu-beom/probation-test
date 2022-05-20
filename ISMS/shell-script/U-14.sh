#!/bin/bash

U_14_FILE=./DOC/U_14.txt

cat $U_14_FILE | while read i
do
  if [ -e $i ]; then
    PERMISSION=$(ls -l $i | awk '{ if ($1 ~ "s") print $1 }')
    if [ -n $PERMISSION ]; then
      chmod -s $i
      echo $i $(ls -l $i | awk '{ print $1 }')
    fi
  fi
done

echo "아래는 시스템 내 SUID와 SGID를 가진 파일 목록입니다."
echo "협의 후 추후 작업을 진행해주세요."
find / -xdev -user root -type f \( -perm -4000 -o -perm -2000 \) -ls | awk '{ print $3, $11 }' 2>/dev/null