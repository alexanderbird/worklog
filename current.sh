#!/bin/sh

current=$1
previous=`cat .current`

if [ "$current" = "" ]; then
  echo "Please provide a name for the current work context"
fi

echo "$current" > .current
echo "Switch context to [$current](./$current.md)" >> "$previous.md"
echo "Switch context from [$previous](./$previous.md)" >> "$current.md"

sed -i "/$current/d" README.md
sed -i "s/TOP-OF-RECENT-WORK-AUTO-GENERATED/&\n  - [$current](./$current.md)/" README.md
