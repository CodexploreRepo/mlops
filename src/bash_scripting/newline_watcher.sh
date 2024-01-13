#!/bin/bash
FILENAME=$1

if [[ "$1" ]]; then
    echo "Watching the file $1"
else
    echo "Missing the file to watch :("
    exit 0
fi

# Set initial size in bytes
prevSize="$(stat -c%s $FILENAME)"  # For MacOS, replace with -f%z
echo $prevSize

while true
do 
    currentSize="$(stat -c%s $FILENAME)"
    if [[ $currentSize -gt $prevSize ]]; then
        tail -1 "$FILENAME"
        prevSize=$currentSize
    fi
done