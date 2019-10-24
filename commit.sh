#!/bin/sh

current=`cat .current 2>/dev/null`

if [ "$current" = "" ]; then
  echo "Please set a current work context with ./current.sh before commiting"
  exit 1
fi


git add -A && git commit -m "Work on $current" && git push
