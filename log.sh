#!/bin/sh

current=`cat .current`

if [ "$current" = "" ]; then
  echo "Please use ./current.sh to set the current work context"
fi


echo $@ >> log/"${cat .current}.md"
