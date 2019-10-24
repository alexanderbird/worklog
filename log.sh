#!/bin/sh

current=`cat .current 2>/dev/null`

if [ "$current" = "" ]; then
  echo "Please use ./current.sh to set the current work context"
  exit 1
fi

echo "[`date`]  " $@ >> work/"$current.md"
