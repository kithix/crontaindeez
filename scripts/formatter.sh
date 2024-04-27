#!/usr/bin/env bash

CMD_NAME="$1"
if [[ -z "$1" ]]; then
    CMD_NAME="pid$$"
fi

echo "$CMD_NAME+ opened"
while read line
do
    echo "$CMD_NAME: $line"
done < "/dev/stdin"
echo "$CMD_NAME- closed"
