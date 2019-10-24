#!/bin/sh

current=$1
previous=`cat .current 2>/dev/null`

if [ "$current" = "" ]; then
  echo "Please provide a name for the current work context"
  exit 1
fi

echo "$current" > .current

if [[ "$previous" != "" ]]; then
  echo "Switch context to [$current](./$current.md)" >> "work/$previous.md"
  echo "Switch context from [$previous](./$previous.md)" >> "work/$current.md"
fi

tmpfile="${TMPDIR:-/tmp}/$( basename "$file" ).$$"
while read -r line
do
  if [[ $line != *"$current"* ]]; then
    echo "$line"
  fi
  if [[ "$line" == *"TOP-OF-RECENT-WORK-AUTO-GENERATED"* ]]; then
    echo "  - [$current](./work/$current.md)"
  fi
done < "README.md" > "$tmpfile" && mv "$tmpfile" "README.md"
